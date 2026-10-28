# Teste isolado da legenda do vídeo final

Este teste contém apenas a frase reconhecida entre 115,8 e 119,2 segundos.
Os dois trechos de transcrição incerta continuam sem legenda. Não representa
legendagem completa das cenas. O teste foi posteriormente autorizado, instalado e incluído na release v1.0.2.

Arquivos preparados em `translation-work/subtitle-test/`:

- `PTBR/gameres/textures/videos/zastavki/outro.avi`: substituição proposta.
- `PTBR-subtitle-test.zip`: pacote isolado com esse único caminho.
- `originals/`: cópia preservada do vídeo original.
- `receipt.json`: hashes, tempos e verificações do teste.

A legenda foi embutida no vídeo para funcionar no caminho de reprodução que o
jogo já usa, sem adicionar um mecanismo de legendas ou alterar EXE/DLL.
O áudio OGG separado permanece original. A recodificação mantém VP9/WebM,
720×480, 30000/1001 fps, 145,745 segundos e os 4.368 timestamps de apresentação
originais. A compressão visual é refeita; os pixels não são byte-idênticos.

O quadro legendado foi renderizado e revisado. A prévia com áudio original está
em `translation-work/preview/subtitle-video/outro-caption-preview.mp4`.
O usuário confirmou o funcionamento do conjunto instalado. A frase parcial foi
aprovada para publicação e integrada ao pacote principal, agora com 58 arquivos.
Os recibos em `subtitle-test/` preservam os dados históricos do teste isolado.
