param(
    [Parameter(Mandatory=$true)][string]$IndexPath,
    [Parameter(Mandatory=$true)][string]$OutputPath
)
# Optional Windows-side discovery aid. Does not translate or write game assets.
# Run in Windows PowerShell 5.1. OCR misses remain pending visual review.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Runtime.WindowsRuntime
$null = [Windows.Media.Ocr.OcrEngine, Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Globalization.Language, Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Storage.StorageFile, Windows.Storage, ContentType=WindowsRuntime]
$null = [Windows.Graphics.Imaging.BitmapDecoder, Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Graphics.Imaging.SoftwareBitmap, Windows.Foundation, ContentType=WindowsRuntime]
$null = [Windows.Storage.Streams.IRandomAccessStreamWithContentType, Windows.Storage.Streams, ContentType=WindowsRuntime]
$null = [Windows.Media.Ocr.OcrResult, Windows.Foundation, ContentType=WindowsRuntime]
$ocrAsyncBridge = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
    $_.Name -eq 'AsTask' -and $_.IsGenericMethodDefinition -and $_.GetParameters().Count -eq 1 -and
    $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
} | Select-Object -First 1
function Await-OcrOperation($Operation, [Type]$ResultType) {
    $task = $ocrAsyncBridge.MakeGenericMethod($ResultType).Invoke($null, @($Operation))
    $task.Wait()
    return $task.Result
}
$ocrEngine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromLanguage([Windows.Globalization.Language]::new('en-US'))
if ($null -eq $ocrEngine) { throw 'English Windows OCR unavailable; no packages were installed.' }
$ocrEntries = Get-Content -LiteralPath $IndexPath -Raw -Encoding UTF8 | ConvertFrom-Json
$ocrEncoding = [System.Text.UTF8Encoding]::new($false)
$ocrWriter = [System.IO.StreamWriter]::new($OutputPath, $false, $ocrEncoding)
try {
    foreach ($entry in $ocrEntries) {
        $stream = $null
        $bitmap = $null
        try {
            $file = Await-OcrOperation ([Windows.Storage.StorageFile]::GetFileFromPathAsync($entry.png)) ([Windows.Storage.StorageFile])
            $stream = Await-OcrOperation ($file.OpenReadAsync()) ([Windows.Storage.Streams.IRandomAccessStreamWithContentType])
            $decoder = Await-OcrOperation ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)) ([Windows.Graphics.Imaging.BitmapDecoder])
            $bitmap = Await-OcrOperation ($decoder.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])
            $result = Await-OcrOperation ($ocrEngine.RecognizeAsync($bitmap)) ([Windows.Media.Ocr.OcrResult])
            $receipt = @{path=$entry.path; text=$result.Text; status='ocr-only-not-reviewed'}
        } catch {
            $receipt = @{path=$entry.path; text=''; status='ocr-failed-needs-visual-review'; error=$_.Exception.Message}
        } finally {
            if ($null -ne $bitmap) { $bitmap.Dispose() }
            if ($null -ne $stream) { $stream.Dispose() }
        }
        $ocrWriter.WriteLine(($receipt | ConvertTo-Json -Compress -Depth 8))
        $ocrWriter.Flush()
    }
} finally {
    $ocrWriter.Dispose()
}
