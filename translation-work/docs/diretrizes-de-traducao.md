# Diretrizes de tradução da interface

## Escopo e revisão

As 165 unidades da interface foram traduzidas e revisadas em 27/10/2026, com autorização expressa do mantenedor para realizar também o trabalho linguístico. A revisão abrange sentido, consistência, acentuação e estrutura. Teste visual da fonte e das telas continua pendente. Notas em imagens, áudio e vídeos não integram este corpus.

## Estilo

- Português brasileiro direto e natural. Comandos curtos, geralmente no infinitivo: Salvar, Carregar, Recarregar, Voltar.
- Manter caixa alta nos botões que a utilizam na fonte inglesa. Nas demais opções, usar maiúscula inicial e nomes próprios conforme necessário.
- Usar salvamento para o arquivo/estado salvo; salvar e carregar para ações. Diferenciar sair da partida/voltar ao menu de fechar o jogo.
- Usar rótulos usuais de configuração, sem explicar conceitos técnicos dentro de botões. Preservar siglas reconhecíveis, como HUD, FPS e MSAA.
- Não remover acentos para contornar a fonte. O build inclui a adaptação do atlas, ainda sujeita a teste visual.
- Não atribuir voz ou gênero a mensagens de sistema. A concordância das opções de qualidade segue o substantivo qualidade.

## Estrutura protegida

Preservar todas as chaves, tags de cor e escapes literais `\n`. Não inserir quebras físicas dentro do valor nativo, aspas sem escape ou caracteres sem suporte da fonte. O workspace permanece UTF-8 e o build nativo usa Windows-1252 sem BOM.

## Decisões contextualizadas

- `STR_BIND_ATTACK2`: Ataque secundário. O identificador aponta para `*attack2`, botão direito, e o manual descreve ataque secundário. A tradução não reproduz o rótulo inglês impreciso Repeat Attack.
- `STR_OPTIONS_GAME_INCREASED_MINIMUM` e `STR_OPTIONS_GAME_MOLOTOV_THROW_DISTANCE`: Maior distância mínima / de arremesso de molotovs. São duas linhas consecutivas do mesmo rótulo no script; foram revisadas como uma frase única.
- `STR_OPTIONS_CAPTION`: BOAS-VINDAS. Preserva WELCOME do arquivo original, mesmo sendo o cabeçalho da janela de opções. Não foi alterada a intenção do recurso por suposição.
- Confirmações de exclusão e substituição mencionam o salvamento, para não sugerir apagar a instalação do jogo.
- Mauser, PPSh, OK, Normal, Bilinear, Trilinear e Console foram mantidos deliberadamente quando já adequados em português. Igualdade com EN não significa ausência de revisão.

## Conferência em jogo pendente

Verificar o menu principal, as telas de salvar/carregar, opções avançadas, lista de controles e confirmações. Conferir especialmente Ç/ç, Ã/ã, Õ/õ, vogais acentuadas, os dois rótulos de molotov e eventuais cortes em opções longas. A validação da toolkit não substitui essa conferência.
