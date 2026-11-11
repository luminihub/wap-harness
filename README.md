# wap-harness

Uma extensão do Spec Kit que adiciona **validadores automáticos**. Depois de
cada `/speckit-implement`, um **gate** dirigido por config roda — contrato,
build/tipo, lint, testes+cobertura — e reporta verde/vermelho. É um validador,
**não** um loop autônomo: vermelho volta pra decisão humana.

Independente de stack: os quatro sensores são slots nomeados, preenchidos pelo
`harness.config.yml`. Vêm presets pra **Vue**, **React**, **Kotlin (Gradle)**, **Kotlin (Maven)** e **Python**. O motor
do gate é **shell** (bash + PowerShell) — sem dependência permanente de Node,
mesmo em projeto back.

## Instalação (por projeto)

```bash
specify extension add harness --from https://github.com/luminihub/wap-harness
/speckit-harness-setup --vue        # ou --react / --kotlin / --kotlin-maven / --python / (sem flag = detecta)
```

O `extension add` copia a extensão pra `.specify/extensions/harness/` e o Spec
Kit pluga os comandos e o hook `after_implement` no seu agente. O
`/speckit-harness-setup` escreve o `harness.config.yml` da stack — conferindo cada
sensor contra o que o projeto já tem (scripts do `package.json`, plugins do `pom.xml`)
— e semeia os arquivos do lado do projeto, sem duplicar `patterns.md` nem design
system que já existam. Testado com o Spec Kit 0.16.4.

## Ciclo do dia a dia (automático daqui em diante)

```
/speckit-constitution
/speckit-specify → /speckit-plan → /speckit-tasks → /speckit-implement
   └─ gate dispara no after_implement → verde / vermelho
/speckit-harness-patterns    ← 1x, após o primeiro implement, preenche .specify/memory/patterns.md
```

## Comandos

| comando | quando | o quê |
|---|---|---|
| `/speckit-harness-gate` | hook `after_implement` (auto) | roda o gate, reporta; nunca corrige |
| `/speckit-harness-setup` | 1x, na instalação | escreve o `harness.config.yml`, semeia arquivos |
| `/speckit-harness-patterns` | 1x, após o 1º implement | extrai padrões do próprio código do projeto |

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

Opcional no mesmo arquivo:

```yaml
env:
  JAVA_HOME: "/usr/lib/jvm/java-25-openjdk-amd64"   # JDK do projeto (vai primeiro no PATH)
```

`env.JAVA_HOME` que não existe na máquina (ex.: no CI) é ignorado com aviso.

**Os quatro sensores são obrigatórios.** Sensor vazio (ou `skip`) reprova o gate
como "não configurado" — projeto sem build, lint ou teste nunca fica verde.

O gate roda os quatro em ordem e passa só se **todos saírem 0**. Verde/vermelho
é decidido puramente pelo exit code. O % de cobertura é lido **só pra exibir** —
quem reprova abaixo do limite é o próprio sensor `eval` (thresholds do Vitest,
regras do jacoco, `--cov-fail-under`).

## Testes: obrigatórios, em TDD

O artigo da constituição semeado pelo setup exige **teste antes do código (TDD)**
e cobertura em **catraca** (o limite começa na cobertura atual e só sobe). O
checklist do avaliador confere que o teste do bug falhou antes da correção.

Projeto ainda sem suíte ou sem lint: o setup **monta** —
- **React/Vite:** `seeds/testes/react/` (Vitest + Testing Library, `vitest.config.ts`
  que reaproveita o `vite.config.ts`, versões por versão de Node, contorno do bug do
  npm 10.9 com os peers do Vitest);
- **Kotlin/Maven:** `seeds/testes/kotlin-maven/jacoco-plugin.xml` (gera o
  `jacoco.csv` lido pelo gate) e `ktlint-plugin.xml` (lint).

Não existe sensor "pulado": o que falta é instalado, não desligado.

## Fora do Spec Kit (trabalho direto na branch)

O hook `after_implement` só dispara dentro do `/speckit-implement`. Quando o time
trabalha direto em branches de feature/fix, rode o gate **antes do commit/push** e
no workflow de PR — assim a mesma régua vale pra todo mundo:

```bash
bash .specify/extensions/harness/scripts/bash/gate.sh
```

```yaml
# .github/workflows/pull-request.yml — passo extra depois do checkout + toolchain
      - name: wap-harness gate
        run: bash .specify/extensions/harness/scripts/bash/gate.sh
```

## Estrutura do repo

```
wap-harness/
├── extension.yml            # manifesto: comandos, config, hook after_implement
├── config-template.yml      # harness.config.yml genérico (especializado pelo setup)
├── commands/                # os 3 comandos (instruções pro agente)
├── scripts/
│   ├── bash/gate.sh         # o motor + read-coverage.sh
│   └── powershell/gate.ps1
├── presets/                 # vue.yml · react.yml · kotlin.yml · kotlin-maven.yml · python.yml
├── assets/design-system.md  # design system da WAP, fixado (só --vue / --react copiam)
└── seeds/                   # copiado pro projeto pelo setup
    ├── harness/             # README, evaluator-checklist, constitution-check.sh
    ├── docs/patterns.md     # template vazio (vai pra .specify/memory/patterns.md se não existir)
    ├── testes/              # receitas: react/ (Vitest) · kotlin-maven/ (jacoco, ktlint)
    └── constitution-article.md
```

## Limitações da v0 (honesto)

- **Exibição de cobertura** lê o json-summary do Vitest, o `coverage.json` do
  Python e o **`jacoco.csv`** (Kotlin/Java). **XML do jacoco não é lido** — aponte
  `coverage.source` pro CSV. O verde/vermelho do gate não depende disso (o sensor
  `eval` é dono do limite).
- **Sem painel ao vivo / `progress.json`** na v0 — o gate imprime uma tabela
  simples e um exit code. O painel multi-task é adição posterior.
- **Parsing do `harness.config.yml`** é um leitor mínimo pro formato fixo acima,
  não um parser YAML completo. Mantenha o arquivo nesse formato.

## O que isto NÃO faz

Sem loop autônomo, sem autocorreção, sem controle de tokens/iterações. O gate
valida e reporta; você decide o próximo passo.
