# Cobertura e teste — pacote local de 28/10/2026

Documento técnico interno. O README público contém somente apresentação,
informações da tradução e orientações de instalação e suporte.

## Conteúdo do pacote

| Conteúdo | Registros |
|---|---:|
| Interface | 165 |
| Nomes de fases | 24 |
| Notas e cartas em imagens | 29 |
| Diagramas de controle | 3 |
| Legenda parcial do vídeo final | 1 |
| Total | 222 |

`PTBR/` e `PTBR.zip` contêm 58 recursos nativos nos caminhos do jogo inglês.
O atlas dos três controles conta como um arquivo. Os dois arquivos de fonte
completam o conjunto. Os originais estão preservados no repositório.

SHA-256 do ZIP:
`66578b999671ded6f4af9683fa3ca0c6e9869f5ed621598d85783813e0af5931`.

## Verificações realizadas

- 33 testes passaram, incluindo migração incremental, recuperação transacional,
  preservação das traduções, invalidação de artes e verificações dos formatos.
- `doctor` e `verify-output` passaram no Windows/Python 3.14.8.
- ZIP com 58 caminhos sem duplicatas; CRC e SHA-256 de cada entrada correspondem a PTBR/.
- Texto e arte das 29 notas e dos três diagramas revisados visualmente em resolução nativa.
- Cabeçalho, rodapé, dimensões e alfa das artes TGA conferidos automaticamente.
- Região inferior não usada do atlas de controle preservada byte a byte em RGBA.
- Hashes dos 31 EXE/DLL protegidos permanecem iguais. Nenhum deles integra o pacote.
- A aplicação do pacote e do vídeo foi autorizada pelo mantenedor. A publicação pelo Actions também foi autorizada em 28/10.

O mantenedor confirmou que o conteúdo instalado funciona até o ponto testado.
Isso não equivale a uma revisão exaustiva de toda a campanha.

## Limitações e recorte confirmado pelo mantenedor

- **Preset 1/2/3:** são literais compilados no executável. A análise estática
  registrou seus endereços e referências. Não foi identificada uma substituição
  suportada por recursos; ficam originais, sem alteração de binários ou hooks.
  Evidência: `reference/preset-static-analysis.json`.
- **Diálogos:** não foi localizada uma faixa textual de legendas. Foram
  inventariados 69 possíveis áudios de fala; os 17 contêineres de vídeo
  inspecionados não contêm faixa nativa de texto. Três arquivos com extensão AVI
  são WebM/VP9. A presença de texto desenhado nos próprios quadros não foi
  concluída por essa inspeção estrutural. As falas permanecem originais;
  não houve transcrição, dublagem nem implementação de um sistema de legendas.
  Evidências: `reference/dialogue-resource-audit.json` e `subtitle-api-search.json`.
- **Fora do pacote por orientação expressa:** carregamento, detalhes pequenos,
  rótulos incidentais, mostradores e cartazes decorativos. A busca adicional foi
  encerrada a pedido do mantenedor. Não se declara cobertura desses elementos.
- Botões antigos em texturas com referência apenas no atualizador não foram
  incluídos. Se algum for observado durante o jogo, a evidência permite reabrir
  o item; ausência na busca não é prova universal de desuso.

## Testes que o mantenedor deve fazer

1. Abrir o jogo em inglês e conferir menus, opções e acentos.
2. Ler a nota de Masha e navegar pelas notas/cartas: verificar letras, cortes,
   margens e troca entre páginas. Conferir especialmente a ordem do trem e o
   bilhete rasgado do radioamador, cujo final permanece incompleto como no original.
3. Alternar os três perfis de controle: conferir diagramas, comandos e setas.
   O nome compilado do perfil na lista permanece em inglês.
4. Conferir nomes de fases ao carregar partidas, incluindo os acentuados.
5. Carregar um salvamento e jogar normalmente, observando novos problemas de
   legibilidade ou de abertura de notas. Registrar captura e local se ocorrerem.

A instalação de teste foi autorizada e realizada; futuras aplicações continuam
dependendo de autorização.
