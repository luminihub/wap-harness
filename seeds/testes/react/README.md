# Receita de testes — React + Vite (Vitest + Testing Library)

Usada pelo `/speckit-harness-setup --react` quando o projeto ainda não tem suíte
de testes. É a configuração em uso no `wap-waaw-chat-web`.

## Arquivos

- `vitest.config.ts` → raiz do projeto. Reaproveita o `vite.config.ts` (plugins,
  alias `@/`, CSS Modules) com `mergeConfig`; ambiente `jsdom`; cobertura v8 com
  `json-summary` (o que o gate lê).
- `src/test/setup.ts` → matchers do jest-dom e `cleanup()` depois de cada teste.
- Incluir `vitest.config.ts` no `include` do `tsconfig.node.json` e `coverage` no
  `.gitignore`.

## Dependências (dev, versões fixas)

```bash
npm install -D --save-exact vitest @vitest/coverage-v8 \
  @testing-library/react @testing-library/dom @testing-library/user-event \
  @testing-library/jest-dom jsdom
```

Escolha versões publicadas há pelo menos duas semanas e **compatíveis com o Node
do projeto** (`.nvmrc` e a imagem Docker), olhando o `engines` de cada pacote:

| Node do projeto | jsdom | @testing-library/jest-dom |
|---|---|---|
| 20 | até 29.x | até 6.9.x |
| 22+ | atual | atual |

Se o `npm install` (npm 10.9) falhar com `Cannot read properties of null
(reading 'edgesOut')` — bug do npm ao resolver os peers opcionais do Vitest —,
instale com `npx -y npm@11 install …`; o lockfile continua válido para o
`npm ci` do npm 10 (conferir com `npm ci` no Node do CI).

## Scripts no `package.json`

```json
"test": "vitest run",
"test:watch": "vitest",
"test:cov": "vitest run --coverage"
```

## CI

No workflow de PR, `npm test` depois do lint.

## Cobertura (catraca)

Projeto que começa agora tem cobertura baixa. Não comece com `thresholds` de 80%
(o CI reprova de saída): defina o limite no valor atual, arredondado para baixo,
e suba a cada entrega. O limite nunca desce.

## TDD

O teste que falha vem antes do código: rodar `npm run test:watch`, escrever o
teste, ver vermelho pelo motivo certo, implementar o mínimo, ver verde.
