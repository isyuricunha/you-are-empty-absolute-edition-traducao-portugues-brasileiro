# Toolkit de localização — You Are Empty: Absolute Edition

## Estado e escopo

Perfil Steam inglês, AppID 4760480, build de referência **26256132**. São **165 unidades em um lote**, traduzidas e revisadas em 27/10/2026, sem pendências neste perfil. O build e o pacote local foram validados; teste visual em jogo continua pendente. O perfil implementado cobre a interface e sua fonte. As **29 notas em texturas**, áudio, vídeos e textos ambientais não foram extraídos linguisticamente e não integram o pacote. Um build completo deste perfil **não significa tradução integral do jogo**. Consulte [o inventário](reference/notes-inventory.json) e [o briefing](docs/briefing-do-jogo.md).

Os cinco textos do ensaio anterior estão em `reference/menu-test-observed.json`, fora do lote oficial; não foram tratados como tradução aprovada. O teste anterior confirmou carregamento e encaixe do menu, mas revelou glifos cirílicos nos acentos. A nova fonte ainda exige confirmação visual em jogo.

## Primeiros passos do tradutor

Depois de clonar/puxar este repositório em Ubuntu Server 24.04 LTS ARM64:

```bash
python3 translation-work/toolkit.py doctor
```

Se falhar, pare antes de traduzir e encaminhe a mensagem exata ao responsável pela toolkit. Não instalar pacotes automaticamente ou corrigir hashes por tentativa. **Só Python 3.10+ e biblioteca padrão**; não há Mono, DLL, executável auxiliar ou serviço de tradução. O `doctor` verifica integridade encadeada, arquitetura, catálogo e um parse/rebuild sintético byte a byte, sem escrever recursos ou saída. O sistema precisa conseguir executar Python; ausência do interpretador será informada pelo shell.

Em seguida, leia [o briefing](docs/briefing-do-jogo.md), escreva suas diretrizes e seu glossário em `docs/`, e consulte:

```bash
python3 translation-work/toolkit.py resume
python3 translation-work/toolkit.py check
```

Edite apenas `PTBR` nos JSONL, ou use `apply`. Tradução, revisão linguística, validação estrutural, build e teste em jogo são etapas distintas. Campos preenchidos não comprovam revisão humana; a revisão deve ser concluída antes do build explícito.

## Organização e instalação

`EN/` e `accepted-sources/` guardam bytes nativos originais. `translations/` contém o catálogo e lotes JSONL UTF-8. `reports/` guarda diffs aceitos e histórico removido. `reference/native/` contém apenas scripts de contexto, preservados byte a byte. `PTBR/` só aparece após um **build explícito completo**. Tudo fica neste único repositório; a instalação externa é sempre somente leitura para a ferramenta.

Mapeamento nativo:

```text
EN/gameres/scripts/you_are_empty/ui/ui_strings.txt
  -> PTBR/gameres/scripts/you_are_empty/ui/ui_strings.txt
EN/gameres/textures/fonts/RodchenkoCTT.tga
  -> PTBR/gameres/textures/fonts/RodchenkoCTT.tga
EN/gameres/textures/fonts/RodchenkoCTT.size
  -> PTBR/gameres/textures/fonts/RodchenkoCTT.size
```

Copiar o **conteúdo** de PTBR para a raiz do jogo é uma ação manual do usuário. A toolkit não instala arquivos. O ZIP contém esses caminhos começando por `gameres/`, sem pasta PTBR externa. Não inclui documentação, manifesto, licença do projeto ou scripts como anexos extras.

## Comandos

Execute da raiz do repositório; o script também resolve caminhos corretamente quando chamado a partir de outra pasta. A saída é JSON UTF-8, apropriada para terminal e automação; `--json` mantém esse formato.

| Comando | Comportamento |
| --- | --- |
| `extract` | primeira extração; recusa sobrescrever progresso existente |
| `sync` ou sem comando | compara EN com o snapshot aceito; nunca toca PTBR |
| `sync --source-root CAMINHO` | árvore de fontes completa, com os três caminhos nativos |
| `sync --source-file CAMINHO/ui_strings.txt` | troca apenas o candidato de texto, mantendo fontes aceitas de EN |
| `update-sources --game-root CAMINHO` | verifica identidade Steam, importa fontes originais e sincroniza em uma operação |
| `update-sources` | tenta caminho local já verificado ou bibliotecas registradas da Steam; sem varredura de discos |
| `update-sources --game-root CAMINHO --dry-run` | planeja e informa diff sem escrever nada |
| `check` | valida fontes, mapeamento, campos imutáveis e sintaxe, mesmo incompleto |
| `status` / `resume` | resumo, saída ausente/atual/obsoleta, armazenamento e pendências |
| `diff` | mostra o último diff aceito; geração identifica sua referência |
| `diff --source-root CAMINHO` | comparação candidata somente leitura |
| `apply --payload CAMINHO.json` | aplicação parcial por ID e fingerprints; rejeita sobrescrita por padrão |
| `apply --payload CAMINHO.json --replace` | substituição deliberada após revisão, com histórico |
| `build` | exige todas as unidades, valida e promove saída completa com manifesto |
| `verify-output` | guard barato de inventário, hashes e fingerprints; não reconstrói recursos |
| `package` | valida e gera PTBR.zip determinístico; não publica |
| `font-preview` | amostra de engenharia em `translation-work/preview/`, sem tocar PTBR ou o jogo |
| `recover` | restaura uma transação interrompida após verificar conflitos |
| `rollback --snapshot ID` | restaura snapshot retido se não houve progresso posterior conflitante |
| `gc --dry-run` / `gc` | planeja/executa retenção segura dos snapshots concluídos |
| `doctor` | preflight somente leitura para o clone local ou ARM64 |

Uma instalação alterada é recusada. A instalação atual mantém o ensaio de menu e, portanto, **não é baseline inglês intacto para update-sources**. O EN inicial veio do backup anterior, com SHA-256 conferido. A ferramenta não restaura o jogo sozinha. Para fontes de nova versão não reconhecida, a verificação informa um fingerprint: após inspeção de proveniência, use `--approve-source FINGERPRINT` no mesmo comando de fontes. Isso é uma declaração deliberada de origem, não uma heurística de idioma.

Sem uma instalação disponível no servidor, `update-sources` falha sem alterações e fornece `--game-root`; alternativamente sincronize o EN atualizado recebido por Git. A autodetecção é limitada aos metadados Steam locais. Não alcança o Windows de outra máquina.

## Aplicação parcial

```json
{
  "generation": "copiar do manifest.json",
  "entries": [
    {
      "id": "copiar o id do registro",
      "source_fingerprint": "copiar do registro",
      "PTBR": "texto revisado pelo tradutor"
    }
  ]
}
```

IDs desconhecidos, duplicados e geração incorreta invalidam o payload. Erros de texto podem resultar em aplicação parcial das entradas válidas, com rejeições detalhadas e código de saída 2. Erros de operação retornam 1. Repetir o mesmo texto é idempotente. Não use exemplos acima como dados reais.

## Atualizações, concorrência e recuperação

O snapshot aceito é versionado, permitindo diff mesmo se EN tiver sido sobrescrito manualmente antes de `sync`. IDs são caminho nativo + chave STR; reordenação atualiza a posição e mantém tradução. Mudança material esvazia PTBR ativo e retém EN/PTBR anteriores no histórico. Chaves removidas ficam nos relatórios históricos. Renomeações são removido+adicionado; não há correspondência por semelhança.

Não se aceitam imports incompletos nem novos tipos/caminhos de fonte silenciosamente. Este adaptador possui um arquivo de texto e duas dependências de fonte; recursos adicionais exigem extensão explícita e testes. A exclusão de uma chave dentro de um arquivo completo é suportada. O arquivo inteiro ausente é erro.

Um lock serializa operações de escrita. Antes da promoção, fingerprints detectam mudanças concorrentes. O journal persiste antes das substituições e o snapshot guarda apenas os caminhos modificados. A promoção de vários arquivos é recuperável, não uma operação de filesystem atomicamente indivisível. Um journal pendente bloqueia leituras de estado e novas operações até `recover`; conflitos externos exigem preservar as alterações e investigar. Não apagar `.state` para silenciar o erro.

Retenção padrão: **10 transações concluídas / 512 MiB**, controlada pelas constantes `TX_RETENTION_COUNT` e `TX_RETENTION_BYTES` da implementação versionada. A toolkit verifica espaço livre e orçamento antes de promover. `gc` valida recibos e backups antes de remover snapshots concluídos elegíveis; não remove staging sem recibo, journal ativo ou estado desconhecido. `status` mostra quantidade, bytes e limites. Backups locais não são histórico permanente: commits regulares preservam o trabalho durável, mas a ferramenta não faz commits nem pushes. A janela de rollback se limita aos snapshots retidos e exige que o estado posterior ainda corresponda ao recibo.

## Integridade e portabilidade

`.gitattributes` fixa LF para metadados/código e `-text` para EN, PTBR e bytes nativos. Hashes de código/JSON usam a representação LF equivalente ao blob Git; os hashes nativos usam os bytes exatos. `engine-shapes.json` descreve o formato; `toolchain.json` referencia esse descritor, fontes de confiança e implementação; `runtime-support.json` referencia toolchain, sem ciclo. Alterações legítimas no adaptador exigem revisão e regeneração consciente desses recibos; não mudar hashes só para encobrir adulterações. Após mudanças legítimas revisadas, o responsável pelo adaptador pode executar python translation-work/refresh-integrity.py e conferir o diff antes de rodar os testes. Esse comando nunca é chamado automaticamente.

Verificado no Windows: suíte de testes, fixtures de build/package/release, normalização Git e round-trip nativo. Esperado em Ubuntu ARM64: Python padrão, sem dependências binárias. **Execução real em Ubuntu ARM64 pendente** do primeiro `doctor` no servidor. Não é necessário acessar servidor, instalar emulador ou provisionar runner ARM64 para entregar a implementação Windows.

## Release automática

Depois de revisar toda a interface: execute `build`, confira o resultado e versione PTBR junto com `translation-work/build-manifest.json` e os JSONL correspondentes. O mantenedor decide o commit e o push. Um push em `main` alterando `PTBR/**` aciona `.github/workflows/release.yml`; progresso em JSONL ou README isolado não publica.

O fluxo verifica a saída sem rebuild, gera ZIP, cria `v1.0.0` e incrementa apenas patch nas alterações seguintes. O publicador compara árvores e textos por categoria, exige ancestralidade e commit atual do branch, recusa tags conflitantes, retoma drafts e confirma **exatamente um asset: PTBR.zip**, incluindo digest. Uma repetição sem mudança não cria versão. Tags/drafts conflitantes precisam de revisão; a ferramenta nunca força tags ou apaga assets desconhecidos.

Testes de HTTP são simulados. **Não houve push, publicação real nem teste do workflow hospedado no GitHub.** Depois do primeiro build completo commitado, o fluxo pode ser exercitado por push ou dispatch autorizado. Não rodar `release.py` localmente com credenciais como ensaio: ele publica de verdade.

O README público é estável: números, progresso e relatórios ficam aqui. Nenhum CI reescreve README quando uma Release aparece. O texto público não atribui trabalho a personas ou descreve a atividade do mantenedor em terceira pessoa; créditos concisos e documentos legais identificam autores quando necessário.

## Testes

```bash
python -m unittest discover -s translation-work/tests -v
python translation-work/toolkit.py doctor
python translation-work/toolkit.py check
git diff --check
```

Builds de teste usam diretórios temporários e textos sintéticos; não preenchem o corpus real. A fonte comparativa está em `reference/font-comparison.png`. Recursos nativos continuam pertencendo aos seus titulares; os documentos de licença/consentimento não concedem direitos sobre o jogo.

O padrão de licença do projeto se aplica somente aos direitos próprios. Não foi inventada uma licença de software separada; avisos e direitos de terceiros permanecem preservados. O documento inglês de permissão foi adaptado do modelo já existente em outro projeto do mesmo mantenedor; o repositório externo do prompt não estava disponível para confrontar uma versão canônica.

Resultados desta preparação: [relatório de engenharia](reports/engineering-validation.md). A geração aceita fica registrada no manifesto; repetir a importação da mesma versão não exige nova aprovação de origem.
