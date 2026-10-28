# Formatos das artes

As artes em TGA preservam cabeçalho, rodapé, dimensões, origem e todos os bytes
do canal alfa. O conteúdo RGB adaptado passa por revisão visual em resolução
nativa antes da aprovação para o pacote.

Os DDS de texto preservados até agora usam DXT5 (BC3). A exportação conserva o
cabeçalho original e sua cadeia completa de mipmaps. Cada nível recebe RGB
recomprimido da arte adaptada e os oito bytes originais de alfa de cada bloco
BC3. Assim, os endpoints e índices de transparência permanecem iguais em todos
os níveis. A recompressão RGB tem perdas e exige revisão visual após a exportação.

O verificador padrão usa apenas a biblioteca padrão do Python. Rejeita formatos
DDS diferentes de DXT5, cubemaps, volumes, cabeçalhos alterados, cadeias truncadas,
dados adicionais e qualquer alteração nos blocos de alfa. Pillow é uma dependência
opcional de preparação/exportação, não de compilação do pacote.

Uma passagem nos testes de formato não comprova a tradução nem a aparência no
jogo. A aprovação também vincula o arquivo original, o texto PT-BR revisado e
os bytes da arte exportada por hashes. A confirmação em jogo fica separada.

Referências técnicas:

- [DDS_HEADER — Microsoft](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-header)
- [DDS_PIXELFORMAT — Microsoft](https://learn.microsoft.com/en-us/windows/win32/direct3ddds/dds-pixelformat)
- [BC3 e dimensões físicas de mipmaps — Microsoft](https://learn.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression)
