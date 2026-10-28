# Validação de engenharia — 27/10/2026

Snapshot da preparação anterior à tradução. O resultado posterior está em `translation-review.json`.

Perfil: You Are Empty: Absolute Edition Steam, AppID 4760480, referência build 26256132. Adaptador DS2 para interface solta, Windows-1252 e atlas TGA.

- 165 registros, um lote, nenhum PTBR preenchido automaticamente.
- Suíte consolidada: **17 testes passaram**, em 456,554 segundos. O importador recebeu uma correção final para reconhecer a geração já aceita; os dois testes de política/importação foram repetidos e passaram.
- Round-trip real inglês: bytes idênticos. O build real incompleto foi recusado e PTBR permaneceu ausente.
- Stress: 500 alterações pequenas sobre um cenário de 120 lotes esparsos. Recibos de apenas um lote modificado, amostra intocada preservada por bytes e mtime, retenção até 10 snapshots e total abaixo de 10 MiB verificados por assertivas.
- Fonte: comparação de todos os pixels fora das células de acentos, header/footer e larguras. Amostra em `translation-work/preview/gameres/textures/fonts/`; originais em EN e accepted-sources. Renderização em jogo pendente.
- Portabilidade: Git index real demonstrou LF canônico para JSON e preservação binária. Doctor passou no Windows AMD64/Python 3.14.8. Ubuntu ARM64 ainda depende do primeiro doctor no servidor.
- Importação da instalação com menu do ensaio: recusada como fonte traduzida. Não houve tentativa de restauração automática.
- Publicador HTTP: criação, upload, retomada de draft, idempotência, patch de versão, mudança só de fonte, asset inesperado e erros HTTP exercitados com mocks. Nenhuma publicação real.
- Arte oficial e links públicos verificados por HTTP. README renderizado pela API de Markdown do GitHub e HTML inspecionado. A prévia visual no navegador não foi realizada: a política do navegador bloqueou URLs locais file://; não foi contornada. Layout desktop/mobile permanece sem captura visual.
- Hashes dos três recursos gerenciados na instalação continuam iguais aos observados antes da implementação. Não houve commit nem push.

## Limites de cobertura

As 29 notas foram localizadas por referências de HUD e inventariadas com hashes e associações de áudio. Elas não estão transcritas nem traduzidas. O perfil não cobre vozes, vídeos ou toda a arte ambiental. Não apresentar um build completo da interface como tradução integral do jogo. O tamanho inicial de lote deste adaptador é fixo em 500; o corpus atual cabe num único lote. O documento inglês de permissão foi adaptado de outro projeto existente do mantenedor; o repositório da versão canônica indicada pelo prompt não estava disponível para comparação.

Detalhes, hashes e limites: `engineering-validation.json`. Primeiro passo no servidor: `python3 translation-work/toolkit.py doctor`; depois ler o briefing, criar as diretrizes/glossário, revisar e traduzir os JSONL. O PT-BR substitui os recursos ingleses nos mesmos nomes/caminhos. Nenhum idioma novo é registrado.
