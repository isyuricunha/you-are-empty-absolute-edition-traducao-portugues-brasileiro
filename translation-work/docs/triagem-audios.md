# Triagem local dos áudios das cenas

Lote de 10 arquivos em `gameres/sounds/videozast`, processado localmente.
Oito não produziram fala identificável; `vstrecha5` ficou inconclusivo.
`outro_cutscene` apresentou discurso em russo consistente entre as passadas.
Isso não substitui revisão auditiva: nenhuma audição humana é alegada.

Resultados e hashes: `reports/scene-speech-review.json`. Transcrições automáticas
brutas em `speech/raw/` e passadas de conferência em `speech/recheck/`.
O modelo small foi usado no lote; medium foi aplicado apenas ao final.
Referência do motor: https://github.com/SYSTRAN/faster-whisper

Em `speech/review/` há um recorte de 93 a 122 segundos do final,
três registros de diálogo e uma legenda PT-BR **parcial, posteriormente aprovada**.
Duas falas anteriores permanecem sem tradução por transcrição incerta.
Os tempos da SRT são relativos ao áudio original, não ao recorte de revisão.
As transcrições brutas continuam sendo rascunhos. Somente a última frase foi
aprovada, embutida no vídeo e incluída na release v1.0.2. Música reconhecida
como descrição não virou diálogo.

Durante a triagem, a instalação e o pacote PTBR permaneceram intactos. A
instalação posterior foi autorizada pelo usuário; os recibos registram essa etapa.
Dependências opcionais isoladas: `speech/requirements.txt`. PyAV 18.1.0 é usado
porque PyAV 19 removeu o parâmetro de decodificação usado pelo motor instalado.
