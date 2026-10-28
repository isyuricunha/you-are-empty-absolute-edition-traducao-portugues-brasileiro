"""Fail closed unless a PR explicitly contains the full checked consent statement."""
import json
import os
from pathlib import Path
import re

ATTESTATION = ('Declaro que posso licenciar minha contribuição original e concedo ao mantenedor uma licença não exclusiva, gratuita, '
              'para usar, editar e distribuir esse material sob CC BY-NC-SA 4.0 e repassar a autorização de integração oficial, '
              'inclusive em versões comerciais do jogo, com créditos, conforme CONTRIBUTING.md e GAME-DEVELOPER-PERMISSION.md. '
              'Mantenho minha autoria; não renuncio a direitos morais inalienáveis.')


def check_consent(body):
    normalized=re.sub(r'\s+',' ',body or '')
    return ('- [x] '+ATTESTATION in normalized or '- [X] '+ATTESTATION in normalized)


if __name__=='__main__':
    event=json.loads(Path(os.environ['GITHUB_EVENT_PATH']).read_text(encoding='utf-8'))
    if not check_consent(event['pull_request'].get('body')):
        raise SystemExit('Consentimento afirmativo completo ausente. Leia CONTRIBUTING.md e preencha pessoalmente a declaração do PR.')
    print('Declaração afirmativa presente; revisão de autoria, escopo e registro durável ainda necessária antes do merge.')
