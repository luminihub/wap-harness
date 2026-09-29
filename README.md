# wap-harness

Uma extensão do Spec Kit que adiciona **validadores automáticos**. Depois de
cada `/speckit-implement`, um **gate** dirigido por config roda — contrato,
build/tipo, lint, testes+cobertura — e reporta verde/vermelho. É um validador,
**não** um loop autônomo: vermelho volta pra decisão humana.

Independente de stack: os quatro sensores são slots nomeados, preenchidos pelo
`harness.config.yml`. Vêm presets pra **Vue**, **Kotlin** e **Python**. O motor
do gate é **shell** (bash + PowerShell) — sem dependência permanente de Node,
mesmo em projeto back.

## Instalação (por projeto)

```bash
specify extension add harness --from <url-deste-repo>
/harness-setup --vue        # ou --kotlin / --python / (sem flag = detecta)
```

O `extension add` copia a extensão pra `.specify/extensions/harness/` e o Spec
Kit pluga os comandos e o hook `after_implement` no seu agente. O
`/harness-setup` escreve o `harness.config.yml` da stack e semeia os arquivos do
lado do projeto.

## Ciclo do dia a dia (automático daqui em diante)

```
/speckit-constitution
/speckit-specify → /speckit-plan → /speckit-tasks → /speckit-implement
   └─ gate dispara no after_implement → verde / vermelho
/harness-patterns    ← 1x, após o primeiro implement, preenche docs/patterns.md
```

## Comandos

| comando | quando | o quê |
|---|---|---|
| `speckit.harness.gate` | hook `after_implement` (auto) | roda o gate, reporta; nunca corrige |
| `speckit.harness.setup` | 1x, na instalação | escreve o `harness.config.yml`, semeia arquivos |
| `speckit.harness.patterns` | 1x, após o 1º implement | extrai padrões do próprio código do projeto |

## O gate (`harness.config.yml`)

```yaml
sensors:
  contrato: "bash harness/constitution-check.sh"
  build:    "npm run type-check"
  gate:     "npm run lint:check"
  eval:     "npm run test:cov"
coverage:
  source: "coverage/coverage-summary.json"
  field:  "lines"
  min:    80
```

O gate roda os quatro em ordem e passa só se **todos saírem 0**. Verde/vermelho
é decidido puramente pelo exit code. O % de cobertura é lido **só pra exibir** —
quem reprova abaixo do limite é o próprio sensor `eval` (thresholds do Vitest,
regras do jacoco, `--cov-fail-under`).

## Estrutura do repo

```
wap-harness/
├── extension.yml            # manifesto: comandos, config, hook after_implement
├── config-template.yml      # harness.config.yml genérico (especializado pelo setup)
├── commands/                # os 3 comandos (instruções pro agente)
├── scripts/
│   ├── bash/gate.sh         # o motor + read-coverage.sh
│   └── powershell/gate.ps1
├── presets/                 # vue.yml · kotlin.yml · python.yml
├── assets/design-system.md  # design system da WAP, fixado (só o --vue copia)
└── seeds/                   # copiado pro projeto pelo setup
    ├── harness/             # README, evaluator-checklist, constitution-check.sh
    ├── docs/patterns.md     # template vazio
    └── constitution-article.md
```

## Limitações da v0 (honesto)

- **Exibição de cobertura** lê o formato json-summary do Vitest e o formato flat
  do `coverage.json` do Python. **XML do jacoco (Kotlin) não é lido** — cobertura
  fica em branco ali. O verde/vermelho do gate não é afetado (o Gradle é dono do
  limite). Extrator de jacoco é um add da v1.
- **Sem painel ao vivo / `progress.json`** na v0 — o gate imprime uma tabela
  simples e um exit code. O painel multi-task é adição posterior.
- **Parsing do `harness.config.yml`** é um leitor mínimo pro formato fixo acima,
  não um parser YAML completo. Mantenha o arquivo nesse formato.

## O que isto NÃO faz

Sem loop autônomo, sem autocorreção, sem controle de tokens/iterações. O gate
valida e reporta; você decide o próximo passo.
