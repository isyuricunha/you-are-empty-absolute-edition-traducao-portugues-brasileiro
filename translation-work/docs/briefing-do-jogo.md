# Briefing de You Are Empty: Absolute Edition

## Identidade e fontes

FPS da Digital Spray Studios e Mandel ArtPlains, com trabalho de relançamento creditado a Jordan Freeman Group / ZOOM Platform Media. A edição atual é publicada por Strategy First e BillionTech e saiu na Steam em 27/10/2026, AppID **4760480**. A instalação inspecionada informa build **26256132**, idioma inglês. Essas referências delimitam o corpus, não garantem compatibilidade futura.

Fontes consultadas em 27/10/2026:

- [Página oficial na Steam](https://store.steampowered.com/app/4760480/You_Are_Empty_Absolute_Edition/): identidade, cenário, recursos e responsáveis.
- [Manual oficial disponibilizado pela Steam](https://store.steampowered.com/manual/4760480), também presente como `Manual (English).pdf` na instalação. O PDF é composto por imagens; foram lidas visualmente as páginas indicadas abaixo. A numeração impressa fica uma página atrás da posição no PDF.
- `EN/gameres/scripts/you_are_empty/ui/ui_strings.txt`: fonte primária da interface efetivamente extraída.
- `translation-work/reference/native/gameres/scripts/you_are_empty/hud/hud.lua`: vínculos entre notas, imagens e áudio.
- `translation-work/reference/native/gameres/scripts/you_are_empty/ui/`: uso dos identificadores, fontes e controles.
- `translation-work/reference/notes-inventory.json`: inventário derivado dos scripts; os nomes dos arquivos são evidência técnica, não uma transcrição da narrativa.

## Cenário e tom

A apresentação oficial situa a ação numa Kyiv soviética alternativa dos anos 1950, marcada por desaparecimentos e criaturas monstruosas. O contraste entre propaganda, ciência e abandono é central à apresentação. O tom permite estranheza e humor sombrio, mas isso não autoriza acrescentar piadas ou explicações aos rótulos de interface.

O escopo atual é funcional. Os textos extraídos não contêm diálogos narrativos extensos, facções nomeadas ou uma cronologia da catástrofe. Não preencher essas lacunas com deduções de nomes russos de arquivos. A apresentação pública deve manter os spoilers mínimos.

## Pessoas verificadas no manual

O capítulo 9 do manual, páginas impressas **13–14** (PDF **14–15**), apresenta três figuras de apoio:

- **Kulibin**: inventor rural que procura entender os acontecimentos e oferece conselhos ao protagonista. O manual usa pronomes masculinos. Isso é evidência sobre esse personagem, não sobre qualquer pessoa mencionada por ele.
- **General Secretary**: figura situada no topo da hierarquia partidária, descrita como calma e prudente e disposta a cooperar. O texto inglês usa masculino. O título institucional exige decisão de glossário se passar a integrar o corpus.
- **Ballet-Dancer**: personagem artístico associado ao caminho de saída do edifício da ópera. O manual usa masculino. Sua aparência e seu nome funcional não devem substituir a evidência textual.

Esses personagens não foram encontrados como falantes das 165 unidades de interface. Não vincular automaticamente seus gêneros a mensagens do sistema. Não há evidência extraída que permita identificar o nome ou o gênero variável do jogador; os registros deixam interlocutores e referentes desconhecidos.

## Progressão e documentos

O capítulo 13, páginas impressas **30–31** (PDF **31–32**), explica que documentos incluem notas, cartas e trechos de diários. Parte deles contém dicas de progressão; outros acrescentam informações de mundo. O manual descreve uma indicação de nova nota e, nos controles originais, leitura por F1 e navegação por colchetes. Para a edição atual, o usuário pode ter redefinido essas teclas: traduções devem acompanhar as opções de controle, sem inserir atalhos fixos onde a fonte não os traz.

Os scripts confirmam **29 chamadas concretas de HUD_NOTE**, cada uma com referência de textura e áudio. Todas as texturas foram localizadas. Há identificadores como `masha`, `medVladimir`, `liuda` e `radioHead`, mas um identificador isolado não comprova autoria, falante, destinatário ou gênero. A pessoa que escreveu, a pessoa que lê a nota em áudio e alguém citado na nota podem ser diferentes. Expor essas lacunas à revisão, em vez de afirmar identidades.

As notas são texturas TGA; não existem neste corpus como frases inglesas editáveis. A tradução delas requer transcrição conferida, análise da imagem e edição separada. Não declarar a história traduzida porque a interface está preenchida. Não há suporte de legendas comprovado nesta implementação.

## Interface e terminologia de jogo

O arquivo possui rótulos de iniciar/carregar/salvar, dificuldades, controles, qualidade gráfica e mensagens de confirmação. Os seguintes pares são **problemas de contexto**, não escolhas obrigatórias de português:

| Fonte/identificador | Contexto comprovado | Atenção para revisão |
| --- | --- | --- |
| `Save`, `Load`, `Quicksave`, `Quickload` | operações de partidas salvas | distinguir ação, nome de arquivo e mensagem de resultado |
| `STR_BIND_USE` | comando de interação | conferir consistência entre menu de controles e dicas |
| `STR_BIND_SELECT_SPANNER` | seleção de arma; EN `Wrench` | o ID não é uma tradução pronta |
| `STR_BIND_SELECT_OBREZ` | EN `Shotgun` | preservar ID, revisar o termo visível pela fonte inglesa |
| `STR_BIND_SELECT_GRENADE` | EN `Molotov cocktail` | não traduzir o identificador como se ele fosse o texto |
| `STR_BIND_SELECT_THUNDER` | EN `Electric gun` | terminologia de arma experimental, sem nome próprio comprovado |
| `STR_OPTIONS_GAME_FOV` | campo de visão | rótulo curto de configuração |
| `STR_OPTIONS_ADVANCED_MSAA` | amostras de antisserrilhamento | sigla técnica protegida por contexto; decidir explicação no glossário |
| `STR_OPTIONS_GAME_REDUCED_CAMERA_BOB` | movimento da câmera | evitar confundir câmera e recuo da arma |
| `STR_OPTIONS_GAME_MOLOTOV_THROW_DISTANCE` | distância de arremesso | conferir o texto em conjunto com a opção de mínimo aumentado |

O capítulo 4 do manual, página impressa **5** (PDF **6**), mostra a separação entre disparar, ataque secundário, recarregar, usar, pular e agachar. Os nomes e atalhos antigos servem de contexto, não de autoridade sobre a configuração moderna. O próprio manual conserva instruções antigas de DVD/Windows; não copiar esses requisitos para a documentação de instalação da tradução.

## Fonte, sintaxe e limites

O menu usa `RodchenkoCTT.tga`, atlas de 16×16 células. As posições estendidas da textura original contêm cirílico; bytes Windows-1252 como Ç, Õ e É exibiram símbolos errados no teste realizado antes da criação do repositório. A amostra confirmou carregamento e encaixe dos cinco botões, mas não aprovou os glifos novos.

A adaptação de fonte mantém o desenho das letras-base e sua caixa visual. A textura original usa versões semelhantes a maiúsculas também para várias minúsculas; não atribuir esse efeito a um erro do texto. A correção precisa ser vista em jogo antes de afirmar compatibilidade visual.

Preservar identificadores `STR_*`, tags `<color ...>...</color>`, escapes literais `\n`, variáveis e a estrutura de aspas. O workspace é UTF-8; o arquivo nativo é construído em Windows-1252 sem BOM. Validação estrutural não detecta todos os cortes de interface nem garante correção gramatical.

## Orientação para o trabalho linguístico

Ler este briefing antes do lote. Criar as diretrizes e o glossário como decisões linguísticas revisáveis. Trabalhar apenas no campo PTBR; registrar dúvidas de contexto. No perfil atual não há motivos para atribuir fala, relações ou gêneros a rótulos de sistema. Uma futura ampliação para documentos e áudio deverá criar evidência por unidade, distinguindo quem fala, quem é interpelado e quem é descrito.

Permanecem fora de comprovação: transcrição integral das notas, roteiro dos vídeos, nomes completos dos demais personagens, correspondência exata entre todas as vozes e pessoas e compatibilidade visual da nova fonte em jogo. O inventário torna essas pendências visíveis; não as resolve por inferência.
