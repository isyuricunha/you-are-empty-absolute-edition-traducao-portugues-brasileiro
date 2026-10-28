# Fluxo de trabalho

1. Clonar/puxar; executar `python3 translation-work/toolkit.py doctor` antes da tradução no servidor.
2. Ler o briefing e criar/manter `diretrizes-de-traducao.md` e `glossario-ptbr.md`. Esses documentos são decisões do tradutor; não há terminologia automaticamente aprovada.
3. Consultar `resume`, ler o lote e preencher/revisar somente PTBR. Usar EN como fonte. As chaves são contexto técnico, não frases a traduzir.
4. Executar `check` após cada grupo; salvar progresso em Git conforme decisão do mantenedor. Lotes de armazenamento têm até 500 registros; grupos de tradução podem ser menores.
5. Após atualizar o jogo, usar `update-sources` com originais verificados ou `sync` para EN recebido. Ler `reports/sync-latest.md` e os detalhes JSON. Revisar só entradas novas/alteradas e seus históricos.
6. Concluir a revisão linguística do perfil antes de `build`. Rodar `verify-output` e testar o pacote em jogo, incluindo todos os acentos, botões e telas de opções. A toolkit não inicia o jogo.
7. Versionar saída completa e recibo juntos. A publicação depende de push autorizado; ela não ocorre enquanto o trabalho estiver só nos JSONL.

Notas em imagens precisam de uma ampliação própria do corpus com transcrição e edição revisadas; o lote atual não as inclui. Uma tradução completa da interface não deve ser apresentada como jogo totalmente traduzido.
