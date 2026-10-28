# Expansão de cobertura — trabalho em andamento

## Objetivo preservado

Localizar, traduzir e integrar todo texto acessível ainda em inglês, incluindo documentos, diagramas e arte ambiental, sem modificar EXE/DLL. A instalação é somente leitura. Não publicar, instalar ou fazer commits sem autorização. O pacote existente da interface permanece válido enquanto a expansão é preparada; ele não representa a conclusão deste objetivo.

## Evidência da primeira auditoria

- `reference/resource-audit.json`: 7.412 recursos enumerados; 2.633 imagens candidatas. Enumeração não comprova cobertura linguística. As imagens ainda precisam de inspeção visual; ausência de resultado de OCR nunca permite concluir que não existe texto.
- 69 recursos candidatos preservados byte a byte em `reference/native-assets/`: 29 notas, um atlas de controles e 39 descrições de mapas. EXE/DLL não foram copiados nem alterados; seus hashes foram registrados para proteção.
- `artwork/map-labels.jsonl`: 24 nomes ingleses traduzidos/revisados; 15 nomes russos mantidos como referência em RU/CP1251. Integração depende da confirmação da resolução dos caminhos e da ampliação transacional da toolkit.
- `artwork/notes.jsonl`: 29 transcrições/traduções manuais concluídas. A assinatura Alexey foi conferida em ampliação. Dois fragmentos físicos (final de uma nota rasgada e parte de uma data) estão explicitamente documentados; o trecho ausente não foi inventado. Gênero do narrador não foi inferido de nomes; os pronomes explícitos sobre marido/Vladilen foram registrados como evidência apenas desses referentes.
- `artwork/approved.json`: dez artes nativas revisadas (Masha, carro, zelador, chave do porão, remessa de grãos, galinhas, trens de carvão, vacina, materiais da fábrica e Vladimir). Texto, estilo e disposição foram conferidos visualmente. Exportação restaura dimensões e alfa do original; o codec verifica header/footer e todos os bytes de alfa. Hashes de imagem e texto vinculam as aprovações ao conteúdo revisado. Essas artes ainda não foram integradas ao PTBR.
- `artwork/candidates/`: saídas gráficas, prompts e proveniência. PNGs são intermediários; somente a exportação nativa revisada pode ser candidata ao build. Nenhum arquivo foi aprovado automaticamente apenas por ser gerado.
- `resource_formats.py`: parser/reconstrutor de nomes de mapas e codec TGA 32 bits sem dependências externas, incluindo RLE. Quatro testes passaram sobre os 24 descritores ingleses e as 30 texturas reais, além de fixtures malformadas. Este módulo ainda precisa ser ligado ao fluxo transacional principal.
- `export_native_art.py`: exportador opcional de desenvolvimento usando Pillow, disponível no runtime local. O build do tradutor não deve depender de Pillow nem da ferramenta de edição de imagens: receberá os recursos nativos previamente revisados.
- O atlas `controller_icon.tga` contém os três diagramas, não apenas o primeiro visto na captura. Cada esquema precisa de tradução própria, mantendo linhas e associação dos comandos.
- A captura e o relato do mantenedor confirmam que a interface instalada funciona e exibe acentos nas telas mostradas. Isso não aprova os novos recursos ou todas as telas do jogo.

## Preset 1/2/3

Os três valores foram localizados no executável durante a investigação anterior; o controle declarativo chama-se `Controller Preset` em `ui_ini.lua`. A nova busca nos scripts não encontrou funções de troca do texto dos itens nem a variável `ui_controller_preset`. Isso ainda é evidência parcial: não foi demonstrada uma alternativa suportada por recursos, nem declarada impossibilidade definitiva. Não renomear esse identificador técnico, adicionar hooks ou alterar bytes do executável por tentativa.

## Descoberta por OCR

O Windows disponibiliza reconhecedor en-US. A execução por arquivo do auxiliar `ocr-audit.ps1` foi bloqueada pela política local; o host padrão também não oferece a projeção WinRT necessária. O lançador `run_ocr_audit.py` usa o Windows PowerShell 5.1 em sua invocação nativa inline `-Command`, sem flags de ExecutionPolicy, sem alterar políticas e sem instalar pacotes.

A execução real terminou as **2.633 imagens**, sem erros de API; 225 resultados contêm algum texto reconhecido. A evidência bruta com o hash de cada fonte está em `reference/texture-ocr-evidence.jsonl`. OCR em manuscritos mostrou erros importantes e não substituiu as transcrições manuais. Resultados vazios não comprovam ausência de texto.

`texture_review_sheets.py` preparou 42 pranchas e índices por caminho/hash. As três primeiras (192 imagens) foram triadas visualmente em `reference/texture-review-decisions.json`; arquivos densos/ambíguos ficaram para revisão ampliada. Cinco DDS adicionais contêm inglês confirmado (ACCEPT/BACK e uma placa com please wait). O OCR apontou outras telas e placas de carregamento, que ainda precisam de confirmação visual e investigação de referências. DDS/mipmaps, vídeos e as demais pranchas não estão concluídos.

Referência da API: [Microsoft — OcrEngine](https://learn.microsoft.com/en-us/uwp/api/windows.media.ocr.ocrengine). Esse auxiliar é de investigação no Windows, não uma dependência do tradutor em Ubuntu ARM64.

## Próximas verificações obrigatórias

1. Inspecionar as imagens restantes, registrando textos, itens sem texto e exceções com evidência específica; investigar também scripts, descrições e eventuais textos em vídeo.
2. Completar/revisar todas as transcrições e traduções e preservar os vínculos entre nota, destinatário, assinatura e áudio sem inventar gênero.
3. Preparar a arte em PT-BR, conferir leitura, estilo, fundo, alfa, dimensões e formato nativo. Converter formato não dispensa inspeção da arte.
4. Ampliar a toolkit com identidades e fingerprints dos novos registros, migração segura do catálogo atual, invalidação incremental das imagens e proteção das 165 traduções existentes.
5. Integrar somente recursos revisados, validar o pacote completo e atualizar documentação e inventário de cobertura. Registrar limitações comprovadas sem transformar ausência de investigação em exceção.
6. Entregar roteiro de teste no jogo. Não instalar atualizações automaticamente.
