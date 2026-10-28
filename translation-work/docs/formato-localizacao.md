# Formato e contratos

DS2 usa recursos soltos. O parser gerencia `ui_strings.txt`: uma chave `STR_*`, espaços/tabulações, valor entre aspas, espaços opcionais e terminador original. Linhas vazias e comentários `//` são preservados. Chaves duplicadas e sintaxe desconhecida falham; não se tenta interpretar Lua como texto localizável. O round-trip inglês reconstrói bytes idênticos.

O valor EN mantém escapes nativos literais; JSONL usa escapes JSON por fora. Chave, caminho, categoria, evidência contextual e fingerprint são imutáveis. Histórico é contexto revisável, nunca PTBR automaticamente ativo. A posição de linha orienta reconstrução, mas não define identidade. O fingerprint sem a posição permite preservar traduções após reordenação. Mudanças no contexto imutável invalidam a unidade.

O arquivo original era ASCII, compatível com Windows-1252. O teste de acentos mostrou que os bytes são usados como índices na fonte original cirílica. A proposta mantém essa codificação e substitui as células correspondentes no atlas. UTF-8 nativo não é assumido. Aspas, escapes e tags devem permanecer válidos; variáveis mantêm multiplicidade. Nenhum teste estrutural certifica gramática ou layout.

A textura é TGA true-color não comprimida, 1024×1024, 32 bits BGRA, 16×16 células de 64×64. O adaptador respeita origem vertical do header e preserva header, footer e pixels fora das células de acentos. `.size` tem largura normalizada por código; as letras acentuadas recebem a largura da letra-base. A alteração não muda o registro da fonte ou a lógica do jogo. O atual alfabeto suportado é ASCII imprimível mais os acentos latinos definidos em `native.ACCENTS`; pontuação especial é rejeitada até ter suporte comprovado.

`fonts.lua` aponta menu, estado desabilitado e botões para a mesma textura. Não foi encontrado seletor de gênero/falante na tabela UI. `hud.lua` aponta documentos por textura e áudio; não se deve inferir autor ou gênero pela chave. Não há extração de fala ou implantação de legendas neste perfil.

Os arquivos de contexto em `reference/native/` são evidência da inspeção inicial. Atualizações que alterem a estrutura da interface, notas ou uso de fontes exigem nova inspeção, além da sincronização normal dos três recursos gerenciados.
