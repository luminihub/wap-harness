<!-- wap-design-system: v1 -->
# WAP Digital Design System

> Diretriz corporativa para criação de produtos digitais WAP.  
> Este documento define a base compartilhada de marca, interface e experiência. Regras específicas de cada produto devem ser documentadas separadamente, sem alterar os fundamentos globais.
>
> **Versão:** 1.3.3 · **Status:** estável · **Última revisão:** 19/08/2026  
> **Escopo:** web responsiva, sistemas internos, portais, dashboards e aplicativos WAP.

## 1. Objetivo

Este `design.md` deve orientar o design e a implementação de todos os produtos digitais da WAP: sistemas internos, portais, dashboards, aplicativos, experiências de clientes e ferramentas operacionais.

O sistema busca garantir:

- identidade WAP reconhecível em qualquer produto;
- consistência entre jornadas e equipes;
- interfaces claras para operações simples ou densas;
- acessibilidade e responsividade desde o início;
- componentes reutilizáveis e decisões previsíveis;
- liberdade para cada produto evoluir sem fragmentar a experiência da marca.

## 2. Como usar este documento

Estas regras são a base, não uma especificação fechada de tela.

- **Fundamentos e acessibilidade são obrigatórios.**
- **Componentes devem ser reutilizados antes de criar variantes locais.**
- **Padrões de produto podem estender esta base**, mas devem usar os mesmos tokens e comportamentos.
- **Exceções precisam de justificativa**, registro e validação de design.
- **O Figma e o código devem usar os mesmos nomes de tokens e componentes.**

### 2.1 Linguagem normativa

Os termos abaixo têm significado obrigatório em todo o documento:

| Termo | Significado |
|---|---|
| **MUST** | regra obrigatória; não pode ser ignorada sem exceção formal aprovada |
| **MUST NOT** | prática proibida |
| **SHOULD** | padrão recomendado; pode mudar quando houver justificativa registrada |
| **SHOULD NOT** | prática a evitar; exige justificativa quando usada |
| **MAY** | escolha opcional dependente do contexto |

Quando uma regra não trouxer marcador explícito, deve ser interpretada como **SHOULD**. Acessibilidade, privacidade, segurança e uso de tokens semânticos são **MUST** por padrão.

### 2.2 Ordem de precedência

Em caso de conflito, seguir esta ordem:

1. acessibilidade, segurança e requisitos legais;
2. este `design.md`;
3. componente estável do design system;
4. documentação específica do produto;
5. especificação da tela;
6. preferência local de implementação.

Uma decisão de produto pode especializar o sistema, mas **MUST NOT** redefinir silenciosamente um token ou mudar o comportamento de um componente global.

Cada produto deve manter uma documentação complementar com:

- propósito e público;
- arquitetura de informação;
- fluxos e regras de negócio;
- papéis e permissões;
- estados específicos do domínio;
- métricas de sucesso;
- exceções aprovadas ao design system.

## 3. Princípios de experiência

### Clareza operacional

O usuário deve entender onde está, o que aconteceu e qual é a próxima ação. Hierarquia, rótulos e feedback têm prioridade sobre ornamentação.

### Eficiência sem perda de contexto

Produtos WAP podem lidar com alto volume de dados. Busca, filtros, tabelas, atalhos e ações em lote devem acelerar o trabalho sem esconder informações importantes.

### Confiança em cada ação

Estados, datas, responsáveis e consequências precisam ser explícitos. Processos críticos devem oferecer confirmação, rastreabilidade e recuperação quando possível.

### Consistência entre produtos

Um componente com a mesma aparência deve manter o mesmo comportamento. Novas jornadas devem parecer parte do mesmo ecossistema.

### Acessibilidade por padrão

A experiência deve funcionar com teclado, leitor de tela, zoom, contraste adequado e diferentes capacidades motoras ou cognitivas.

### Responsividade intencional

Mobile não é desktop comprimido. Conteúdo deve reorganizar, priorizar e, quando necessário, assumir outro padrão de interação.

## 4. Personalidade visual

A linguagem WAP é:

- **confiável:** estrutura estável, feedback explícito e uso disciplinado de cor;
- **direta:** textos curtos, ações objetivas e pouca ornamentação;
- **tecnológica:** interfaces precisas, atuais e orientadas a dados;
- **humana:** linguagem acessível, erros explicativos e suporte à recuperação;
- **robusta:** adequada tanto para portais simples quanto para operações complexas.

Evitar:

- excesso de cores, gradientes ou sombras decorativas;
- linguagem vaga ou excessivamente técnica;
- telas densas sem agrupamento e hierarquia;
- animações que atrasem tarefas;
- componentes diferentes para resolver o mesmo problema.

## 5. Fundações visuais

### 5.1 Tipografia

A família principal é **Plus Jakarta Sans**. Use fallback `Arial, sans-serif` quando a fonte não estiver disponível.

| Token sugerido | Tamanho / linha | Peso | Uso |
|---|---:|---:|---|
| `display/lg` | 32 / 40 px | 600 | títulos de experiências institucionais |
| `heading/lg` | 25 / 32 px | 600 | título principal de página |
| `heading/md` | 20 / 24 px | 600 ou 700 | títulos de página, modal e cartão destacado |
| `heading/sm` | 16 / 24 px | 600 ou 700 | títulos de seção e cartão |
| `body/md` | 16 / 24 px | 400 ou 500 | textos explicativos e formulários amplos |
| `body/sm` | 13 / 20 px | 400 ou 500 | conteúdo padrão de sistemas |
| `label/sm` | 13 / 20 px | 600 ou 700 | botões, labels, abas e cabeçalhos |
| `caption` | 12 / 16 px | 400 ou 500 | metadados auxiliares |

Regras:

- títulos e botões usam sentence case;
- corpo de texto deve permanecer legível com zoom de `200%`;
- evitar texto com menos de `12 px`;
- códigos, datas e unidades não devem quebrar quando isso alterar o significado;
- limitar parágrafos longos a aproximadamente `70` caracteres por linha;
- usar peso tipográfico, espaço e posição antes de recorrer a mais cores.

### 5.2 Cores

Cor deve ser escolhida por **função e par de contraste**, nunca isoladamente. Todo fundo **MUST** declarar seu token de conteúdo correspondente (`on-*`). É proibido inferir que uma cor será legível apenas porque seu nome contém `text`, `primary` ou um número alto.

#### Marca e ação

| Token | Valor | Uso principal |
|---|---|---|
| `primary/900` | `#012B4D` | navegação global e texto de alta ênfase |
| `primary/800` | `#024374` | estados profundos e divisores sobre fundo escuro |
| `primary/600` | `#0775C5` | links de texto normal sobre branco, bordas ativas e navegação selecionada |
| `primary/500` | `#0A8CE9` | indicadores, foco e destaques gráficos; não usar em texto normal sobre branco |
| `primary/400` | `#59A7F0` | progresso e apoio visual |
| `primary/100` | `#D6E9FD` | superfícies de progresso futuro |
| `primary/50` | `#E6F2FE` | fundo de ações e destaques secundários |
| `action/600` | `#1D76D2` | CTA principal |
| `action/50` | `#E8F2FF` | fundo informativo ou de ação suave |
| `action/900` | `#052B54` | texto sobre fundo de ação suave |

#### Tokens de conteúdo sobre superfícies (`on-*`)

| Token | Valor | Uso obrigatório |
|---|---|---|
| `on/light` | `#090D11` | conteúdo principal sobre branco e superfícies claras |
| `on/light-muted` | `#5E656B` | conteúdo secundário sobre branco e superfícies claras |
| `on/dark` | `#FFFFFF` | conteúdo sobre `primary/900`, `primary/800`, `primary/600` e `action/600` |
| `on/brand-soft` | `#012B4D` | conteúdo sobre `primary/50`, `primary/100` e `primary/400` |
| `on/success` | `#183A00` | texto sobre superfície de sucesso |
| `on/warning` | `#4B2800` | texto sobre superfície de aviso |
| `on/info` | `#052B54` | texto sobre superfície informativa |
| `on/error` | `#7A271A` | texto sobre superfície de erro |

Componentes **MUST** consumir o par completo, por exemplo `background: primary/900` + `color: on/dark`. Não é permitido receber apenas `backgroundColor` e escolher texto por aproximação visual.

#### Neutros

| Token | Valor | Uso principal |
|---|---|---|
| `text/900` | `#090D11` | texto principal |
| `text/600` | `#1E262C` | títulos e alta ênfase |
| `text/400` | `#5E656B` | labels e metadados |
| `text/300` | `#8E9397` | placeholder não essencial e elementos gráficos; não usar em texto informativo sobre superfícies claras |
| `text/200` | `#B2B6B9` | controles inativos e bordas fortes |
| `text/100` | `#D3D5D7` | divisores |
| `text/50` | `#E6E8E9` | bordas suaves e fundos neutros |
| `surface/100` | `#FFFFFF` | cartões, modais e campos |
| `surface/90` | `#F5F5F5` | fundo da aplicação |
| `alpha/10` | `#0000001A` | bordas discretas |
| `alpha/20` | `#00000033` | bordas e overlays leves |
| `alpha/50` | `#00000080` | conteúdo auxiliar sobre fundos claros |

#### Semânticas

| Semântica | Fundo | Ênfase | Texto |
|---|---|---|---|
| Sucesso | `#EBF7E6` | `#4A9800` | `#183A00` |
| Aviso | `#FDF1E7` | `#C16F00` | `#4B2800` |
| Informação | `#E8F2FF` | `#1D76D2` | `#052B54` |
| Neutro | `#E6E8E9` | `#5E656B` | `#090D11` |
| Erro/destrutivo | `#FDECEC` | `#B42318` | `#7A271A` |

#### Interação

| Token | Valor | Uso |
|---|---|---|
| `focus/ring` | `#0A8CE9` | anel de foco sobre superfícies claras |
| `focus/offset` | `#FFFFFF` | separação entre foco e componente |
| `disabled/background` | `#E6E8E9` | superfície desabilitada |
| `disabled/content` | `#8E9397` | texto e ícone desabilitados |
| `border/control` | `#8E9397` | limite de controle sobre branco (`3.10:1`) |
| `border/control-strong` | `#5E656B` | limite de controle sobre superfície cinza (`5.43:1`) |
| `overlay/default` | `#090D1133` | bloqueio de fundo de dialog |
| `overlay/strong` | `#090D1180` | bloqueio de alta ênfase |

Todo produto também deve definir tokens de **erro/destrutivo** validados para contraste AA antes da implementação. Cores semânticas não podem ser substituídas por cores de marca apenas por preferência visual.

#### Requisitos mínimos de contraste

| Elemento | Contraste mínimo |
|---|---:|
| Texto normal, até `23 px` regular ou abaixo de `18.66 px` bold | `4.5:1` |
| Texto grande, a partir de `24 px` regular ou `18.66 px` bold | `3:1` |
| Ícones informativos e controles interativos | `3:1` contra o fundo adjacente |
| Bordas necessárias para reconhecer input, botão ou estado | `3:1` contra a superfície adjacente |
| Indicador de foco | `3:1` entre focado/não focado e superfície adjacente |
| Texto crítico recomendado pela WAP | `7:1`, sempre que possível |

Os valores devem ser medidos sobre a **cor final renderizada**, depois de transparência, overlay, gradiente, imagem, hover, disabled e composição de camadas. A declaração “WCAG AA” sem medição do par real **MUST NOT** ser aceita como validação.

#### Pares aprovados

| Fundo | Conteúdo | Razão | Permitido para |
|---|---|---:|---|
| `surface/100` | `on/light` | `19.49:1` | todo texto, ícone e controle |
| `surface/100` | `on/light-muted` | `5.92:1` | texto secundário normal |
| `surface/90` | `on/light` | `17.88:1` | todo texto, ícone e controle |
| `surface/90` | `on/light-muted` | `5.43:1` | texto secundário normal |
| `primary/900` | `on/dark` | `14.44:1` | todo texto, ícone e controle |
| `primary/800` | `on/dark` | `10.21:1` | todo texto, ícone e controle |
| `primary/600` | `on/dark` | `4.82:1` | texto normal e controles |
| `action/600` | `on/dark` | `4.59:1` | texto normal e CTA |
| `primary/50` | `on/brand-soft` | `12.72:1` | todo texto, ícone e controle |
| `primary/100` | `on/brand-soft` | `11.65:1` | todo texto, ícone e controle |
| `primary/400` | `on/brand-soft` | `5.65:1` | texto normal e controles |
| superfície de sucesso | `on/success` | `11.54:1` | todo texto |
| superfície de aviso | `on/warning` | `11.80:1` | todo texto |
| superfície informativa | `on/info` | `12.55:1` | todo texto |
| superfície de erro | `on/error` | `8.62:1` | todo texto |

Esses pares são a lista segura inicial. Um par não listado **MUST** ser medido e registrado antes do uso.

#### Pares proibidos ou restritos

| Combinação | Razão | Regra |
|---|---:|---|
| `primary/500` sobre branco | `3.53:1` | **MUST NOT** para texto normal; permitido somente para texto grande, foco ou elemento gráfico |
| `text/300` sobre branco | `3.10:1` | **MUST NOT** para texto informativo; restrito a placeholder não essencial |
| `text/300` sobre `surface/90` | `2.84:1` | **MUST NOT** para texto |
| branco sobre `primary/400` | `2.56:1` | **MUST NOT** para texto ou ícone necessário |
| branco sobre `primary/500` | `3.53:1` | **MUST NOT** para texto normal |
| `primary/800` sobre `primary/900` | `1.42:1` | **MUST NOT** para divisor ou controle necessário |
| ênfase semântica sobre fundo semântico suave | `3.28–4.06:1` | **MUST NOT** para texto normal, exceto `error/600`; usar o token `on-*` |

#### Regras obrigatórias

- nunca comunicar estado somente por cor;
- usar rótulo textual e, quando útil, ícone;
- componentes com fundo escuro **MUST** usar `on/dark`, salvo par alternativo medido e aprovado;
- componentes com fundo claro **MUST** usar `on/light`, `on/light-muted` ou o `on-*` semântico correspondente;
- texto primário e secundário **MUST** atender `4.5:1`; placeholder pode ter menor contraste somente se label e instrução permanecerem legíveis;
- conteúdo desabilitado não é justificativa para esconder informação essencial; explicar indisponibilidade em texto com contraste válido;
- borda de `alpha/10` **MUST NOT** ser o único recurso para identificar um campo;
- hover, pressed, selected, loading e error **MUST** manter os mínimos e ser testados separadamente;
- foco **MUST** ser visível em superfícies claras e escuras; usar offset quando necessário;
- texto sobre imagem **MUST** usar scrim ou overlay que garanta contraste em toda a área do texto;
- gradiente **MUST** ser medido no ponto de menor contraste;
- transparência **MUST** ser composta contra o fundo final antes da medição;
- logotipo **MUST** usar a versão clara ou escura prevista, sem recoloração arbitrária;
- não usar cores semânticas como decoração;
- temas adicionais devem preservar a função dos tokens, não apenas seus nomes.

#### Algoritmo para cor dinâmica

Quando a cor de fundo vier de usuário, gráfico, imagem ou dado dinâmico:

1. calcular a luminância relativa sRGB do fundo final;
2. calcular contraste contra `on/light` e `on/dark`;
3. escolher apenas a opção que atingir o mínimo do elemento;
4. se nenhuma atingir, ajustar o fundo ou aplicar superfície/scrim opaco até atingir;
5. registrar o par final em teste automatizado.

É proibido escolher branco ou preto usando um limiar visual simplificado sem calcular a razão de contraste.

Para cálculo automatizado, converter cada canal sRGB `c` de `0–255` para `s = c/255`, linearizar com `s/12.92` quando `s ≤ 0.04045` ou `((s + 0.055)/1.055)^2.4` nos demais casos. A luminância é `L = 0.2126R + 0.7152G + 0.0722B`; o contraste é `(LmaisClaro + 0.05) / (LmaisEscuro + 0.05)`.

#### Contrato mínimo para código

Produtos web **MUST** consumir tokens por variáveis, tema ou pacote compartilhado. Hexadecimais diretos em componentes são proibidos quando houver token equivalente.

```css
:root {
  --wap-color-primary-900: #012b4d;
  --wap-color-primary-600: #0775c5;
  --wap-color-primary-500: #0a8ce9;
  --wap-color-action-600: #1d76d2;
  --wap-color-text-900: #090d11;
  --wap-color-text-400: #5e656b;
  --wap-color-surface-100: #ffffff;
  --wap-color-surface-90: #f5f5f5;
  --wap-color-error-600: #b42318;
  --wap-color-focus-ring: #0a8ce9;
  --wap-color-on-light: #090d11;
  --wap-color-on-light-muted: #5e656b;
  --wap-color-on-dark: #ffffff;
  --wap-color-on-brand-soft: #012b4d;
  --wap-color-on-success: #183a00;
  --wap-color-on-warning: #4b2800;
  --wap-color-on-info: #052b54;
  --wap-color-on-error: #7a271a;
  --wap-color-border-control: #8e9397;
  --wap-color-border-control-strong: #5e656b;

  --wap-space-1: 4px;
  --wap-space-2: 8px;
  --wap-space-3: 12px;
  --wap-space-4: 16px;
  --wap-space-6: 24px;
  --wap-space-8: 32px;
  --wap-space-12: 48px;
  --wap-space-16: 64px;

  --wap-radius-sm: 8px;
  --wap-radius-md: 12px;
  --wap-radius-lg: 20px;
  --wap-radius-full: 9999px;

  --wap-control-height-sm: 32px;
  --wap-control-height-md: 48px;
  --wap-content-max-width: 1200px;
  --wap-focus-width: 2px;
  --wap-motion-fast: 120ms;
  --wap-motion-default: 200ms;
}
```

### 5.3 Espaçamento

Escala base:

| Token | Valor |
|---|---:|
| `space/1` | 4 px |
| `space/2` | 8 px |
| `space/3` | 12 px |
| `space/4` | 16 px |
| `space/5` | 20 px |
| `space/6` | 24 px |
| `space/8` | 32 px |
| `space/12` | 48 px |
| `space/16` | 64 px |

#### Regra de composição

- todo espaçamento **MUST** usar um token da escala;
- valores arbitrários **MUST NOT** ser usados para corrigir desalinhamentos locais;
- elementos do mesmo grupo usam distância menor que a distância entre grupos;
- padding interno e gap entre filhos são decisões diferentes e **MUST** ser declarados separadamente;
- componentes repetidos **MUST** compartilhar padding e alinhamento, mesmo quando o conteúdo variar;
- ícones e labels **MUST** ser alinhados por caixa ou linha de base, não “no olho”;
- margens externas **SHOULD** pertencer ao layout pai; componente reutilizável **SHOULD NOT** impor margem externa;
- áreas vazias **MUST** comunicar hierarquia; não adicionar espaço apenas para preencher tela grande.

#### Escala por relação

| Relação | Token comum | Exemplos |
|---|---|---|
| Ícone + label | `space/2` | botão, item de menu, chip |
| Label + campo | `space/2` ou `space/3` | formulário |
| Título + descrição | `space/2` | cabeçalho e cartão |
| Itens do mesmo grupo | `space/3` ou `space/4` | campos relacionados e ações |
| Grupos dentro de cartão | `space/4` ou `space/6` | seções internas |
| Card + card | `space/4` ou `space/6` | listas e dashboards |
| Seção + seção | `space/8` ou `space/12` | estrutura de página |
| Conteúdo + limite da página | `space/4` mobile, `space/6` tablet, `space/8` desktop | gutters |

#### Densidade de componentes

| Densidade | Altura de controle | Padding horizontal | Gap interno | Uso |
|---|---:|---:|---:|---|
| Confortável | `48 px` | `16 px` | `8 px` | padrão para formulários e touch |
| Compacta | `40 px` | `12 px` | `8 px` | sistemas desktop densos |
| Muito compacta | `32 px` visual | `8 px` | `4 px` | tabela desktop; alvo real ainda `44 px` quando touch |

Um produto **MUST** escolher uma densidade dominante por região. Misturar alturas sem função semântica é proibido.

#### Padding por superfície

| Superfície | Mobile | Tablet | Desktop |
|---|---:|---:|---:|
| Página | `16–20 px` | `24 px` | `24–32 px` |
| Card padrão | `16 px` | `20–24 px` | `20–24 px` |
| Modal/dialog | `16–20 px` | `24 px` | `24 px` |
| Drawer | `16 px` | `20–24 px` | `24 px` |
| Seção de formulário | `16 px` | `20–24 px` | `24 px` |

O padding **MUST** reduzir de maneira consistente entre breakpoints. Não remover padding em mobile para “fazer caber”; reorganizar o conteúdo.

#### Ritmo vertical de página

```text
Page
├── Global navigation
├── Page header                gap: space/6–8
├── Context/actions            gap: space/4–6
├── Main section
│   ├── Section header         gap: space/3–4
│   └── Section content
└── Next main section          gap: space/8–12
```

Títulos, cards, tabelas e ações que compartilham uma borda visual **MUST** alinhar à mesma linha de grid.

#### Validação de espaçamento

- nenhum elemento **MUST** encostar na borda do viewport;
- componentes irmãos equivalentes **MUST** ter gaps iguais;
- texto **MUST NOT** tocar ícone, borda ou indicador de estado;
- conteúdo com duas linhas **MUST** manter padding, sem aumentar a caixa por posicionamento absoluto;
- erro e ajuda **MUST** reservar ou criar espaço sem sobrepor o próximo campo;
- sticky header/footer **MUST** considerar sua própria altura no espaço de rolagem;
- safe areas **MUST** ser aplicadas no mobile;
- layout **MUST** ser verificado com conteúdo curto, longo, vazio e ampliado em `200%`.

### 5.4 Forma, borda e elevação

- raio padrão de controles e cartões: `12 px`;
- raio de modal destacado: `20 px`;
- chips, avatares e indicadores circulares: `9999 px`;
- borda decorativa de superfície: `1 px solid #E6E8E9`; só pode ser usada quando a superfície também for percebida por espaço, preenchimento ou elevação;
- borda necessária de controle sobre branco: `1 px solid border/control`;
- borda necessária de controle sobre cinza: `1 px solid border/control-strong`;
- sombra padrão: `0 1px 2px rgba(0, 0, 0, 0.05)`;
- overlay: `rgba(9, 13, 17, 0.20)` com blur opcional de `5 px`;
- elevação indica hierarquia funcional, não decoração.

Regras de acabamento visual:

- um componente **MUST** ter uma forma principal clara; não acumular borda, sombra e fundo forte sem função;
- elementos no mesmo nível **MUST** compartilhar raio, elevação e densidade;
- raio do elemento filho **MUST** ser igual ou menor que o raio do pai;
- sombras **MUST NOT** substituir contraste necessário de borda ou foco;
- estados interativos **MUST NOT** deslocar conteúdo, alterar dimensões ou causar layout shift;
- superfícies aninhadas **MUST** possuir distinção clara por padding, tom ou elevação; borda quase invisível não é suficiente;
- divisores decorativos podem ter baixo contraste; divisores necessários para compreender estrutura **MUST** atingir `3:1` ou ser reforçados por espaçamento e cabeçalho.

### 5.5 Iconografia e imagens

- a família oficial de ícones de todos os produtos digitais WAP é **Phosphor Icons**;
- Figma e código **MUST** usar o mesmo nome de ícone do catálogo Phosphor e registrar o peso aplicado;
- tamanhos preferenciais: `16`, `20` e `24 px`;
- manter espessura e estilo visual consistentes dentro da mesma experiência;
- não misturar Phosphor com outra biblioteca de ícones na mesma interface;
- ícones de ação devem ter nome acessível;
- ícones decorativos ficam ocultos de leitores de tela;
- usar fotografia WAP com propósito de marca, contexto ou orientação, nunca para competir com tarefas operacionais;
- respeitar proporção e área de proteção do logotipo; não recriar ou distorcer a marca.

### 5.6 Movimento

- duração recomendada: `120–240 ms` para feedback e transições de interface;
- usar curvas suaves e previsíveis;
- animação deve explicar mudança de estado ou hierarquia;
- evitar movimento contínuo em telas operacionais;
- respeitar `prefers-reduced-motion`.

### 5.7 Camadas, overlays e z-index

O z-index **MUST** usar tokens semânticos. Valores arbitrários como `9999` são proibidos.

| Token | Valor base | Camada |
|---|---:|---|
| `z/base` | `0` | conteúdo normal |
| `z/sticky` | `100` | headers e ações sticky |
| `z/dropdown` | `200` | menus, selects e popovers |
| `z/overlay` | `300` | scrim/overlay bloqueante |
| `z/drawer` | `400` | drawer e bottom sheet |
| `z/dialog` | `500` | modal/dialog |
| `z/toast` | `600` | notificações globais |
| `z/critical` | `700` | aviso sistêmico crítico aprovado |

Regras:

- cada overlay abre um novo contexto de empilhamento controlado;
- dropdown ou tooltip originado dentro de dialog **MUST** permanecer acima do dialog e abaixo de toasts globais;
- apenas uma superfície modal bloqueante **SHOULD** estar aberta por vez;
- dialogs empilhados **MUST NOT** exceder dois níveis e exigem justificativa;
- overlay **MUST** cobrir a viewport inteira, inclusive áreas com scroll;
- conteúdo abaixo de modal **MUST** ficar inerte para ponteiro, teclado e leitor de tela;
- sticky elements **MUST NOT** cobrir foco, mensagens de erro ou âncoras navegadas.

### 5.8 Temas e dark mode

O sistema atual tem tema claro como referência. Dark mode **MUST NOT** ser criado invertendo hexadecimais ou reaproveitando tokens de texto como superfícies.

Para adicionar um tema:

1. preservar os nomes semânticos (`surface`, `on-*`, `border`, `action`);
2. redefinir cada valor por tema;
3. recalcular todos os pares e estados;
4. validar imagens, logos, sombras, gráficos e overlays;
5. respeitar preferência do sistema e permitir escolha persistente quando o produto exigir;
6. impedir flash de tema incorreto no carregamento;
7. testar alto contraste e forced colors separadamente.

Um tema só pode ser marcado como estável quando possuir a mesma cobertura de componentes e contraste do tema claro.

## 6. Layout e responsividade

Responsividade é um contrato de reorganização, não apenas redução de tamanho. Todos os produtos **MUST** definir e validar os três contextos principais: mobile, tablet e desktop. Wide é uma extensão do desktop.

### 6.1 Breakpoints normativos

| Contexto | Intervalo CSS | Viewports de validação | Colunas | Gutter |
|---|---:|---|---:|---:|
| Mobile | `320–599 px` | `360 × 800`, `390 × 844` | 4 | `16 px` |
| Tablet | `600–1023 px` | `768 × 1024`, `834 × 1194` | 8 | `24 px` |
| Desktop | `1024–1439 px` | `1280 × 800`, `1366 × 768` | 12 | `24–32 px` |
| Wide | `≥1440 px` | `1440 × 900`, `1920 × 1080` | 12 | `32 px` |

Os limites são defaults corporativos. Um componente **MAY** mudar antes do breakpoint quando seu conteúdo deixar de ser legível. O layout **MUST NOT** criar scroll horizontal na página; apenas regiões intencionais, como tabela ou tabs, podem rolar horizontalmente.

### 6.2 Regras para mobile

- estrutura principal **MUST** usar uma coluna;
- padding lateral **MUST** ser de no mínimo `16 px`;
- controles de formulário **MUST** ocupar a largura disponível, salvo controles curtos como quantidade;
- CTA principal **SHOULD** ocupar a largura disponível;
- duas ações **MAY** ficar lado a lado somente se cada uma mantiver largura legível e alvo de `44 px`;
- navegação lateral **MUST** virar drawer ou navegação equivalente;
- ações menos importantes **SHOULD** migrar para menu contextual;
- cards de metadados **MUST** usar uma ou duas colunas;
- modal curto **SHOULD** virar bottom sheet; formulário longo **MUST** virar página ou dialog em tela cheia;
- tabs **MUST NOT** quebrar texto; devem rolar horizontalmente;
- toolbar **MUST** priorizar título, ação principal e até uma ação secundária;
- tabelas **SHOULD** virar cards; scroll horizontal só é aceito quando comparação de colunas for essencial;
- conteúdo fixo no rodapé **MUST** respeitar safe areas e não cobrir campos focados pelo teclado virtual;
- hover **MUST NOT** ser necessário para descobrir ou executar uma ação.

### 6.3 Regras para tablet

- estrutura **SHOULD** usar uma ou duas colunas conforme a tarefa;
- padding lateral **MUST** ser de no mínimo `24 px`;
- sidebar **MAY** ficar recolhida, temporária ou persistente conforme espaço e frequência de uso;
- formulários **SHOULD** limitar campos a `560–640 px`, mesmo quando houver mais largura;
- cards de dados **SHOULD** usar duas ou três colunas;
- tabelas **MAY** permanecer tabulares se as colunas essenciais couberem sem compressão;
- colunas secundárias **MAY** ser movidas para expansão de linha ou detalhe;
- modais **SHOULD** usar largura entre `480–640 px`; tarefas longas continuam em página;
- ações primárias permanecem visíveis e ações terciárias **MAY** ir para overflow;
- layouts **MUST** funcionar em orientação retrato e paisagem quando o dispositivo alvo permitir rotação;
- interação **MUST** funcionar por toque, teclado e ponteiro, sem depender de hover.

### 6.4 Regras para desktop e wide

- conteúdo **SHOULD** ser centralizado com máximo de `1200 px`; dashboards podem usar largura maior quando justificado;
- navegação global tem altura base de `48 px`;
- sidebar persistente **MAY** ser usada em produtos com múltiplas áreas recorrentes;
- grids **MAY** usar até 12 colunas;
- formulários **SHOULD NOT** esticar campos de texto além de `640 px` sem necessidade;
- tabelas densas **MAY** usar modo compacto, cabeçalho fixo e ações em lote;
- ação principal da página **SHOULD** ficar próxima ao título ou no final lógico do formulário;
- conteúdo auxiliar **MAY** usar painel lateral, drawer ou segunda coluna;
- largura extra **MUST** melhorar leitura ou comparação, não apenas aumentar espaços vazios;
- em `≥1440 px`, margens crescem e o conteúdo mantém largura controlada, salvo experiências analíticas aprovadas.

### 6.5 Matriz de transformação por componente

| Componente | Mobile | Tablet | Desktop |
|---|---|---|---|
| Navegação global | marca + menu + ação prioritária | marca + menu parcial | navegação e conta expandidas |
| Sidebar | drawer temporário | recolhida ou temporária | persistente quando necessária |
| Cabeçalho de página | empilhado | flexível em 1–2 linhas | título e ações lado a lado |
| Toolbar/filtros | resumo + painel de filtros | controles essenciais + overflow | controles visíveis |
| Grid de dados | 1–2 colunas | 2–3 colunas | até 6 colunas de metadados |
| Tabela | cards ou scroll intencional | tabela reduzida/expansível | tabela completa |
| Modal | bottom sheet ou tela cheia | `480–640 px` | `464–720 px` conforme tarefa |
| Drawer | largura quase total | `400–480 px` | `400–560 px` |
| Tabs | rolagem horizontal | rolagem se necessário | linha completa |
| Stepper | vertical ou resumido | vertical/horizontal | horizontal |
| Ações de formulário | sticky quando longo | rodapé da seção | inline ou rodapé |
| Cards | empilhados | 2 colunas | 2–4 colunas |

### 6.6 Regras de reflow e conteúdo

- nenhum texto **MUST** quebrar letra a letra;
- códigos, valores monetários, datas e unidades **SHOULD** permanecer íntegros;
- labels **MUST** continuar associados aos valores após reflow;
- conteúdo truncado **MUST** ter uma forma acessível de leitura completa;
- informação não pode desaparecer entre breakpoints sem alternativa equivalente;
- ordem visual e ordem do DOM **MUST** permanecer coerentes;
- zoom de `200%` e largura equivalente a `320 px` **MUST** manter as funções essenciais;
- imagens **MUST** preservar proporção e usar recorte definido por produto;
- densidade compacta **MUST NOT** reduzir alvos interativos abaixo de `44 px` em dispositivos touch.

### 6.7 Foco responsivo e modalidades de entrada

Breakpoint não define modalidade de entrada. Um celular pode receber teclado externo; um tablet pode combinar touch, caneta, trackpad e teclado; um desktop pode usar touch ou tecnologia assistiva. Portanto, foco **MUST** ser definido pela capacidade de entrada e pelo estado do componente, nunca apenas pela largura da viewport.

| Contexto | Entradas que devem ser suportadas | Contrato de foco |
|---|---|---|
| Mobile | touch, teclado externo, switch control e leitor de tela | touch não depende de hover; teclado e switch exibem foco visível; teclado virtual não cobre campo, label, erro nem CTA relacionado |
| Tablet | touch, caneta, teclado e ponteiro | todos os controles funcionam sem hover; `:focus-visible` permanece claro em modo híbrido e após rotação ou split view |
| Desktop | teclado, mouse, trackpad e tecnologia assistiva | ordem de tabulação segue a tarefa; hover e foco são estados diferentes; skip link alcança o conteúdo principal |
| Wide | mesmas entradas do desktop | aumento de espaço ou colunas não cria saltos na ordem de foco nem separa visualmente controle e conteúdo associado |

#### Aparência e contraste do foco

- todo controle interativo operado por teclado **MUST** exibir `focus-visible` com anel mínimo de `2 px` e contraste de pelo menos `3:1` contra a superfície adjacente e o estado não focado;
- o token `focus/ring` pode ser usado somente quando atingir esse contraste no fundo real; em superfície incompatível, usar outro token aprovado ou anel duplo com `focus/offset`;
- foco **MUST NOT** depender apenas de mudança de cor: contorno, espessura, sublinhado ou forma também deve tornar o estado perceptível;
- `outline: none` e equivalentes **MUST NOT** ser aplicados globalmente; só podem remover o indicador nativo quando um indicador substituto válido estiver renderizado;
- o anel **MUST NOT** ser cortado por `overflow`, borda arredondada, header sticky, drawer, modal ou outra camada;
- hover **MUST NOT** substituir foco, e foco **MUST NOT** permanecer artificialmente após toque quando a plataforma não o exige;
- ícone, texto e borda dentro do controle focado mantêm seus próprios requisitos de contraste; o anel não corrige conteúdo ilegível.

Implementação web de referência:

```css
:where(a, button, input, select, textarea, [tabindex]):focus-visible {
  outline: var(--wap-focus-width) solid var(--wap-color-focus-ring);
  outline-offset: 2px;
}

/* Hover só complementa a interação quando existe ponteiro preciso. */
@media (hover: hover) and (pointer: fine) {
  /* aplicar estados hover sem remover focus-visible */
}

/* Breakpoint não substitui a detecção de modalidade. */
@media (pointer: coarse) {
  /* controles interativos preservam alvo mínimo de 44 × 44 px */
}
```

#### Ordem, reflow e preservação de contexto

- a ordem de foco **MUST** seguir a ordem lógica da tarefa e permanecer coerente com a ordem visual em todos os breakpoints;
- CSS `order`, grid areas e reposicionamento visual **MUST NOT** produzir uma sequência de tabulação diferente da leitura;
- quando tabela vira cards, sidebar vira drawer, modal vira tela cheia ou toolbar vira painel, o controle equivalente mantém sua posição lógica na sequência;
- se o elemento focado continuar existindo após resize, rotação ou reflow, o foco permanece nele; se deixar de existir, mover foco para o equivalente mais próximo, título da região ou gatilho — nunca silenciosamente para `body`;
- abrir modal, drawer, sheet, menu ou popover move foco para um destino seguro, restringe-o quando o padrão exigir e o devolve ao gatilho ao fechar;
- mudança de rota move foco para o título da página ou início do conteúdo principal; carregamento, atualização e inserção de itens **MUST NOT** roubar foco;
- após excluir o item focado, mover foco para o próximo item, para o anterior ou para o contêiner com anúncio do resultado;
- âncoras e destinos programáticos usam margem de scroll suficiente para não ficarem atrás de headers ou ações sticky.

#### Mobile, teclado virtual e orientação

- ao abrir o teclado virtual, campo focado, label, ajuda, erro e CTA relacionado permanecem visíveis dentro da viewport útil e das safe areas;
- scroll automático **MUST** ser previsível, usar margem e não reposicionar o cursor; fechar o teclado não deve provocar salto de conteúdo;
- troca entre portrait, landscape, split view, teclado acoplado e teclado externo preserva valor, seleção, foco lógico e posição útil;
- bottom navigation, FAB, toast e ações sticky **MUST NOT** cobrir o indicador de foco;
- gesto nunca é o único meio de alcançar ou acionar conteúdo; toda ação por swipe, drag ou long press possui alternativa focável;
- componentes somente leitura podem permanecer focáveis quando seu conteúdo ou ação auxiliar precisar ser acessado; controles realmente desabilitados não entram na ordem de foco.

#### Matriz mínima de teste

Em interfaces web responsivas, validar pelo menos `390`, `768`, `1280` e `1440 px` com:

1. `Tab` e `Shift+Tab` em toda a sequência;
2. `Enter`, `Space`, setas, `Home`, `End` e `Esc` quando aplicáveis ao padrão;
3. touch sem dependência de hover no mobile e tablet;
4. teclado externo no mobile/tablet quando o produto suportar esse uso;
5. abertura e fechamento de overlays com captura e devolução de foco;
6. resize, zoom de `200%`, mudança de orientação e abertura do teclado virtual;
7. contraste e recorte do anel em superfícies claras, escuras, semânticas e sobrepostas.

### 6.8 Hierarquia de página

Uma tela típica pode conter:

1. navegação global;
2. breadcrumb ou ação de retorno;
3. título, descrição e ações da página;
4. busca, filtros ou resumo;
5. conteúdo principal;
6. ações locais ou paginação;
7. feedback e ajuda contextual.

Nem todas as telas precisam de todos os níveis. Remova estruturas sem função real.

### 6.9 Contratos específicos para mobile

As regras abaixo complementam os breakpoints. Em aplicativos nativos, respeitar primeiro as convenções e APIs da plataforma; em web mobile/PWA, reproduzir o comportamento sem simular controles nativos de forma enganosa.

#### Drawer navigation

- usar para navegação secundária ou produtos com mais destinos do que cabem na barra inferior;
- abre pela ação de menu; swipe de borda **MAY** complementar, mas nunca ser o único gatilho;
- largura recomendada: `min(88vw, 360px)`;
- usa `z/drawer`, overlay bloqueante, foco preso e fundo inerte;
- item ativo, conta e ação de fechar permanecem claros;
- swipe para fechar exige limiar de distância/velocidade e oferece animação de retorno quando cancelado;
- fechar preserva a posição e devolve foco ao botão de menu.

#### Bottom sheet

- usar para escolhas, filtros e ações curtas relacionadas ao contexto atual;
- alturas: conteúdo, média e quase tela cheia; altura muda com drag apenas quando isso ajudar a tarefa;
- handle visual não substitui botão/ação acessível de fechar;
- swipe down **MAY** fechar somente quando não houver perda de dados ou ação crítica;
- respeita safe area inferior e teclado virtual;
- conteúdo rolável e gesto de dismiss **MUST** coordenar prioridade para evitar conflito;
- formulário longo ou fluxo com várias etapas usa página em tela cheia.

#### Bottom navigation bar

- usar para `3–5` destinos primários de mesma hierarquia;
- cada item possui ícone, label persistente e alvo mínimo de `44 × 44 px`;
- item ativo usa forma, texto e/ou ícone além de cor;
- ordem e quantidade não mudam entre sessões sem decisão de produto;
- não usar para ações contextuais nem mais de cinco destinos;
- badge possui valor acessível e formato limitado (`9+`, `99+`) quando necessário;
- altura inclui `env(safe-area-inset-bottom)`/safe area nativa;
- ao selecionar o destino já ativo, produto **MAY** voltar ao topo, mas deve documentar esse comportamento.

#### Safe areas, notch e barras do sistema

- toda superfície edge-to-edge **MUST** aplicar safe insets em conteúdo e ações interativas;
- web responsiva **MUST** declarar `<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">` quando usar layout edge-to-edge;
- `viewport-fit=cover` só pode ser usado com `env(safe-area-inset-*)` aplicado corretamente;
- header, bottom navigation, FAB, toast, sheet e teclado consideram inset superior/inferior;
- background pode alcançar a borda física; texto e controle não;
- status bar escolhe ícones claros ou escuros pelo contraste real do fundo;
- mudança de rota, tema ou sheet **MUST** atualizar a aparência da status bar sem flash ilegível;
- validar notch, Dynamic Island, cantos arredondados e home indicator em dispositivo real.

#### Gestos

- gestos complementam controles visíveis e **MUST NOT** ser o único caminho para ação essencial;
- swipe horizontal não pode conflitar com navegação do sistema, carrossel ou scroll de tabela;
- long press oferece feedback imediato e alternativa por botão/menu;
- pinch zoom **MUST NOT** ser bloqueado em conteúdo comum; mapas/imagens devem fornecer controles alternativos;
- drag and drop possui estado de início, alvo, sucesso, cancelamento e alternativa por teclado;
- gesto destrutivo exige confirmação ou desfazer;
- áreas gestuais mantêm alvo mínimo e não ocupam zonas reservadas do sistema sem tratamento específico.

#### Teclado virtual e viewport

- usar tipo de input e `inputmode` corretos: email, tel, numeric, decimal, url, search e date;
- campo focado, label, ajuda, erro e CTA relacionado **MUST** permanecer visíveis quando o teclado abrir;
- layout reage à viewport visível; footer sticky **MUST NOT** ficar atrás ou sobre o teclado;
- scroll automático usa margem para não encostar o campo no topo;
- `Enter/Next/Done` avança ou conclui conforme a ordem do formulário;
- não fechar teclado após cada validação ou atualização de estado;
- preservar valores e foco em mudança de orientação, retorno do background e erro de submissão;
- autocomplete usa tokens apropriados e não deve ser desativado sem motivo de segurança comprovado.

#### Pull to refresh

- usar somente quando atualizar o conteúdo inteiro for uma expectativa natural;
- gesto começa apenas no topo da região rolável e não conflita com sheet ou overscroll do sistema;
- indicador mostra resistência, limiar, carregamento, sucesso ou erro;
- após disparo, bloquear chamadas duplicadas até conclusão;
- manter conteúdo existente durante atualização sempre que possível;
- oferecer botão equivalente quando atualização manual for importante;
- não usar em formulários, editores ou páginas com mudanças não salvas.

#### Infinite scroll, carregar mais e paginação

| Padrão | Usar quando | Evitar quando |
|---|---|---|
| Infinite scroll | exploração contínua e itens homogêneos | usuário precisa alcançar footer, comparar posição ou retomar página exata |
| Carregar mais | mobile, controle de consumo e preservação de contexto | conjunto muito pequeno ou paginação legal/operacional |
| Paginação | tabelas, auditoria, busca e posição determinística | exploração casual com poucos controles |

- informar loading, fim da lista, erro e opção de tentar novamente;
- preservar posição ao abrir item e retornar;
- URL/estado deve representar filtros e página quando compartilhamento for relevante;
- infinite scroll **MUST** permitir acesso ao footer por alternativa de navegação;
- novos itens **MUST NOT** deslocar inesperadamente o conteúdo que o usuário está lendo.

#### Formulários mobile

- uma coluna por padrão; campos relacionados curtos podem dividir linha somente quando permanecerem legíveis;
- labels ficam visíveis acima do campo; placeholder não é label;
- altura mínima `48 px`, texto de input mínimo `16 px` em web mobile para evitar zoom automático;
- máscara **MUST** aceitar colar, editar e apagar naturalmente;
- seletor nativo **SHOULD** ser preferido para data/hora quando oferecer melhor experiência;
- CTA pode ser sticky, mas respeita teclado e safe area;
- validação inline ocorre após blur ou tentativa de avanço, salvo feedback seguro durante digitação;
- mensagem de erro fica próxima do campo e resumo de erros leva foco ao primeiro problema;
- campos suportam autofill, gerenciador de senhas e conteúdo gerado pelo sistema.

#### Tabelas e dados no mobile

Escolher explicitamente uma estratégia:

1. **Card:** melhor para leitura item a item; label e valor permanecem associados.
2. **Scroll horizontal:** apenas quando comparar colunas é essencial; primeira coluna pode ser sticky.
3. **Linha expansível:** mantém campos essenciais visíveis e revela detalhes sob demanda.
4. **Resumo + detalhe:** lista curta com navegação para tela completa.

- nunca comprimir colunas até quebrar texto letra a letra;
- manter ordenação, filtro, seleção e ações acessíveis;
- headers sticky **MUST** considerar topbar e safe area;
- ação por swipe requer alternativa visível e desfazer quando destrutiva;
- dados monetários, datas, IDs e unidades preservam formatação e alinhamento.

#### Touch targets e espaçamento entre alvos

- alvo interativo mínimo: `44 × 44 px`; Android nativo **SHOULD** considerar `48 × 48 dp`;
- espaço recomendado entre alvos independentes: mínimo `8 px`;
- ícone visual pode ter `16–24 px`, mas sua área interativa deve ser maior;
- ações destrutivas não ficam coladas a ações frequentes sem separação ou confirmação;
- alvo **MUST** incluir toda a área visual esperada e não apenas o glifo;
- estilus ou mouse podem ganhar precisão extra, mas não reduzem o requisito para dedo;
- validar com toque real, não somente emulador ou cursor.

#### Floating action button (FAB)

- usar para uma única ação primária frequente e contextual ao conteúdo atual;
- tamanho visual recomendado: `56 px`; versão pequena `40 px` somente com alvo efetivo mínimo;
- posição padrão no canto inferior final, respeitando gutter, bottom navigation e safe area;
- **MUST NOT** cobrir conteúdo, paginação, toast, teclado ou controles;
- esconder/revelar com scroll apenas quando a ação permanecer encontrável;
- FAB expandido inclui label; ícone sozinho exige nome acessível;
- não usar simultaneamente com outro CTA primário concorrente na mesma viewport.

#### Long press e menu contextual

- long press **MUST** oferecer feedback visual/háptico antes de abrir o menu;
- ação equivalente deve existir em menu visível, botão ou tela de detalhe;
- menu aparece próximo ao objeto sem sair da safe area;
- fechar por toque fora, `Esc`, seleção ou mudança de contexto;
- ações destrutivas ficam separadas e seguem confirmação/desfazer;
- seleção de texto nativa **MUST NOT** ser bloqueada sem necessidade.

#### Feedback háptico

- háptico complementa feedback visual/sonoro; nunca é o único sinal;
- usar intensidade leve para seleção, média para conclusão e padrão de erro apenas em falha relevante;
- não vibrar em scroll, hover, loading contínuo ou cada caractere digitado;
- respeitar preferências do sistema, modo silencioso e APIs nativas;
- web **MUST NOT** assumir disponibilidade de vibração;
- sequências longas ou repetitivas são proibidas.

#### Mudança de orientação

- preservar rota, dados, foco lógico, expansão, modal e posição de scroll;
- reorganizar grid conforme largura, sem simplesmente escalar a interface;
- teclado, sheet, vídeo, câmera e gráficos recebem comportamento específico documentado;
- rotação **MUST NOT** submeter formulário, fechar tarefa ou apagar seleção;
- bloquear orientação somente quando a tarefa tecnicamente exigir e houver justificativa;
- validar portrait e landscape em tablet e nos fluxos mobile que suportem rotação.

## 7. Navegação

### Barra global

- fundo `primary/900` e altura mínima de `48 px`;
- logo WAP em versão apropriada ao fundo;
- produto e seção atual claramente identificáveis;
- área de usuário pode conter avatar, nome, configurações e saída;
- em mobile, reduzir itens visíveis e mover ações secundárias para menu;
- texto e ícones sobre a barra usam `on/dark`;
- `primary/800` sobre `primary/900` **MUST NOT** representar separador necessário (`1.42:1`); usar branco com opacidade final validada ou reforçar a separação com espaço.

### Navegação lateral

Use em produtos com várias áreas recorrentes. Deve oferecer:

- item ativo inequívoco;
- ícone acompanhado de texto na versão expandida;
- grupos com nomes orientados à tarefa;
- modo recolhido apenas quando os ícones forem reconhecíveis e tiverem tooltip;
- persistência da preferência quando apropriado.

### Breadcrumb e retorno

- breadcrumb serve hierarquia com três ou mais níveis;
- ação “Voltar” serve fluxo recente ou contexto pai direto;
- não usar os dois quando comunicarem exatamente a mesma coisa;
- preservar filtros e posição de rolagem ao retornar para listas.

### Abas

- altura base de `48 px`;
- aba ativa: texto Bold em `primary/600` e borda inferior de `2 px`;
- aba inativa: texto Regular em `text/900`;
- usar para alternar visões irmãs, não para etapas obrigatórias;
- em mobile, permitir rolagem horizontal e manter a aba ativa visível.

## 8. Componentes

### 8.0 Contrato global de componentes

Todo componente compartilhado **MUST** declarar:

1. propósito e critérios de uso;
2. anatomia e nomes das partes;
3. variantes e tamanhos permitidos;
4. estados visuais e comportamentais;
5. transformação mobile, tablet e desktop;
6. teclado, foco e semântica acessível;
7. conteúdo permitido e limites de texto;
8. tokens utilizados;
9. eventos e API pública no código;
10. vínculo entre Figma, Storybook e implementação.

#### Matriz mínima de estados

| Estado | MUST definir | Regra |
|---|---|---|
| Default | aparência e conteúdo | estado inicial utilizável |
| Hover | feedback de ponteiro | não pode ser a única indicação de ação |
| Focus visible | anel de `2 px` | obrigatório para teclado |
| Active/pressed | resposta imediata | não altera dimensões do layout |
| Selected | seleção persistente | diferente de hover e focus |
| Disabled | aparência e semântica | indisponível ao teclado e ponteiro |
| Loading | indicador e label | mantém largura e evita duplo envio |
| Error | semântica e mensagem | explica como recuperar |
| Read-only | conteúdo legível | diferente de disabled quando copiável |

#### Anatomia de referência

```text
Component
├── Container
├── Leading element (opcional)
├── Content
│   ├── Label
│   ├── Value
│   └── Supporting text (opcional)
├── Trailing element (opcional)
└── Feedback region (opcional)
```

Partes equivalentes **MUST** manter nomes consistentes entre componentes. Nomes baseados em posição de uma tela, como `box-3` ou `frame-final`, são proibidos na biblioteca global.

#### Contrato visual obrigatório

Antes de publicar um componente, sua documentação **MUST** incluir:

| Propriedade | Obrigatório registrar |
|---|---|
| Superfície | token de fundo em cada variante e estado |
| Conteúdo | token `on-*` correspondente para texto e ícone |
| Contraste | razão medida de cada par relevante |
| Espaçamento | padding X/Y, gap e alinhamento por tamanho |
| Dimensão | altura mínima, largura mínima/máxima e comportamento com texto longo |
| Forma | raio, borda e elevação |
| Estados | default, hover, focus, active, selected, disabled, loading e error aplicáveis |
| Responsividade | transformação em mobile, tablet e desktop |

Um componente **MUST NOT** ser considerado pronto se sua cor do conteúdo depender da herança acidental do elemento pai.

### 8.1 Botões

| Variante | Aparência | Uso |
|---|---|---|
| Primário | fundo `action/600`, texto `on/dark` | principal ação de avanço |
| Secundário | fundo `primary/50`, borda `primary/600`, texto `primary/900` | ação paralela ou retorno |
| Terciário | sem fundo, texto `primary/600` | ação de baixa ênfase |
| Destrutivo | tokens de erro | ação com impacto negativo |
| Ícone | superfície conforme contexto | ação reconhecível e compacta |

Tamanhos:

- padrão: `48 px` de altura;
- compacto: `32 px`, apenas em contextos densos;
- alvo interativo real: mínimo `44 × 44 px`.

Regras:

- uma ação primária dominante por região;
- cada variante **MUST** declarar pares aprovados para default, hover, active, focus e disabled;
- botão preenchido escuro **MUST** usar `on/dark`; botão suave claro **MUST** usar `on/brand-soft` ou outro `on-*` aprovado;
- hover e active **MUST** alterar o fundo sem reduzir texto abaixo de `4.5:1`;
- ícone e label usam `space/2`; padding horizontal mínimo é `space/4` no tamanho padrão e `space/3` no compacto;
- usar verbo específico: “Salvar alterações”, “Enviar convite”, “Excluir item”;
- estado loading mantém a largura e bloqueia duplo envio;
- botão desabilitado não substitui explicação quando o usuário precisa saber o motivo;
- ações destrutivas irreversíveis exigem confirmação proporcional ao risco.

### 8.2 Campos e formulários

- label visível acima do campo;
- altura base de `48 px`;
- padding horizontal de `16 px`;
- raio de `12 px`;
- gap de `space/2` entre label e controle; valores de `10 px` **MUST NOT** ser criados fora da escala;
- placeholder em `text/300`; valor em `text/900`;
- controle sobre branco usa `border/control`; sobre `surface/90`, usa `border/control-strong`;
- label e valor **MUST** atingir `4.5:1`; placeholder não substitui label;
- foco **MUST** usar anel de `2 px`, offset quando necessário e contraste de `3:1`;
- erro usa superfície/conteúdo `error` e **MUST** manter label, mensagem e borda identificáveis sem depender só da cor;
- texto de ajuda e erro abaixo do controle;
- campo opcional pode exibir “Opcional” ao lado do label;
- não usar placeholder como único label;
- agrupar campos relacionados e dividir formulários longos em seções;
- preservar valores após erro de validação;
- validar no momento adequado, sem interromper digitação comum;
- validação durante digitação só deve confirmar requisitos objetivos e **MUST NOT** anunciar erro a cada tecla;
- erro aparece após blur, tentativa de avanço ou submissão, conforme risco e complexidade;
- mensagem identifica o problema e a correção: “Informe um e-mail válido”, não apenas “Inválido”;
- resumo de erros no topo **MUST** apontar e mover foco para o primeiro campo inválido quando o formulário for longo;
- sucesso de campo **SHOULD** ser exibido apenas quando útil para reduzir incerteza;
- validação assíncrona mostra loading, impede corrida de respostas e preserva o valor digitado.

Controles suportados devem compartilhar a mesma linguagem: input, textarea, select, autocomplete, date picker, checkbox, radio, switch e upload.

### 8.3 Busca e filtros

- busca deve explicar o que pode ser encontrado;
- filtros aplicados ficam visíveis e removíveis;
- oferecer “Limpar filtros” quando houver múltiplos critérios;
- atualizar contagem ou resultado após aplicação;
- manter estado ao abrir um item e retornar;
- em mobile, filtros extensos podem abrir em painel ou bottom sheet;
- debounce e busca automática não devem impedir envio manual ou navegação por teclado.

### 8.4 Cartões

- fundo branco, raio `12 px`, borda suave e sombra pequena;
- padding de `16–24 px` conforme densidade;
- card padrão usa conteúdo `on/light`; metadado usa `on/light-muted`, nunca `text/300` como texto informativo;
- gap entre título e descrição é `space/2`; entre cabeçalho e corpo, `space/4–6`;
- título, conteúdo e ações têm regiões claras;
- evitar cartões dentro de cartões sem necessidade hierárquica;
- cartões clicáveis precisam de foco, hover e alvo integral coerentes;
- metadados podem usar grids responsivos.

### 8.5 Chips, tags e status

- altura base de `32 px`;
- padding horizontal de `8 px`;
- raio completo;
- texto em `label/sm` ou `body/sm`;
- status usa cores semânticas;
- cada status **MUST** usar a superfície semântica com seu token `on-*`; a cor de ênfase serve para ícone ou borda, não para texto normal quando falhar `4.5:1`;
- tag categórica não deve parecer status operacional;
- chips interativos precisam de estados de foco, seleção e remoção;
- chip removível **MUST** exibir label e botão de remoção separado, com nome acessível “Remover {label}”;
- remover um chip atualiza o resultado imediatamente ou oferece desfazer;
- grupo de chips selecionáveis **MUST** expor seleção programaticamente e permitir teclado;
- no mobile, chips podem rolar horizontalmente somente quando a lista completa continuar acessível.

### 8.6 Tabelas e listas de dados

- cabeçalho em `label/sm`;
- célula principal em `body/sm`;
- metadado em `body/sm` regular e `on/light-muted`;
- altura recomendada de linha: `56–64 px`;
- divisores em `text/100`;
- números comparáveis alinhados à direita;
- ações ficam na última coluna ou menu contextual;
- ordenação, seleção e expansão devem ser explícitas;
- cabeçalho pode ser fixo em conjuntos extensos;
- oferecer paginação ou carregamento progressivo adequado ao volume;
- em mobile, priorizar lista de cartões; usar scroll horizontal apenas quando a comparação entre colunas for essencial.

### 8.7 Paginação

- informar intervalo e total quando disponíveis;
- permitir escolher itens por página em operações densas;
- oferecer anterior/próxima e, quando necessário, primeira/última;
- controles indisponíveis devem ser programaticamente desabilitados;
- manter filtros e ordenação ao trocar de página.

### 8.8 Modal, dialog, drawer e bottom sheet

- **Dialog informativo:** mensagem curta e uma ação de confirmação;
- **Dialog de confirmação:** descreve objeto, consequência e ações nomeadas;
- **Modal de tarefa:** interação curta que não exige URL própria;
- **Drawer:** contexto complementar sem abandonar a página;
- **Bottom sheet:** escolhas ou ações curtas no mobile;
- modal curto usa largura recomendada de `464 px`; conteúdo médio pode usar até `720 px`;
- padding é `16–20 px` no mobile e `24 px` em tablet/desktop; raio padrão `20 px`;
- título, descrição, conteúdo e rodapé formam regiões distintas com gaps da escala;
- dialog **MUST** possuir nome acessível e, quando aplicável, descrição;
- ao abrir, o foco vai ao título, primeiro campo ou ação segura conforme a tarefa;
- prender o foco, tornar o fundo inerte e devolver o foco ao gatilho ao fechar;
- fechar por botão e `Esc`; clique no overlay apenas quando não houver risco de perda;
- confirmação destrutiva **MUST NOT** fechar por clique acidental no overlay;
- ações usam ordem previsível; cancelar à esquerda/início e confirmar à direita/fim;
- conteúdo rolável mantém header e ações perceptíveis, sem dois scrolls concorrentes;
- formulário longo, ajuda extensa ou tarefa que precisa de histórico **MUST** usar página própria;
- animação segue `120–240 ms` e respeita movimento reduzido.

### 8.9 Alertas, banners e toasts

- alerta inline permanece próximo da origem do problema;
- banner comunica condição relevante para toda a página;
- toast confirma resultado breve e não bloqueante;
- erros que exigem ação não podem existir apenas em toast;
- incluir título, mensagem e ação somente quando necessários;
- toast informativo/sucesso sem ação pode fechar entre `4–6 s`;
- toast com ação **MUST** permanecer ao menos `8 s` ou até interação;
- erro que exige decisão **MUST** persistir e não depender apenas de toast;
- usuário pode pausar dismissal ao passar ponteiro, focar ou usar leitor de tela;
- empilhar no máximo três toasts visíveis; os demais entram em fila;
- região de toast usa `aria-live="polite"`; erro urgente pode usar anúncio assertivo com parcimônia;
- fechamento manual possui alvo de `44 × 44 px` e nome acessível;
- toast **MUST NOT** cobrir navegação, CTA, campo focado ou teclado virtual.

### 8.10 Stepper, timeline e progresso

- stepper representa etapas de um processo;
- timeline representa eventos em ordem temporal;
- progresso determinado informa percentual ou etapas; indeterminado informa atividade;
- concluído, atual e futuro devem ser distinguíveis por cor, ícone e texto;
- stepper linear **MUST** indicar etapa atual, total e possibilidade de retorno;
- wizard **MUST** preservar dados ao navegar entre etapas e validar somente o necessário para avançar;
- etapa opcional, concluída, atual, futura e com erro usam texto e ícone além de cor;
- barra determinada expõe valor atual e máximo; spinner representa duração indeterminada;
- progresso circular **SHOULD** ser usado apenas quando o espaço for restrito;
- em mobile, preferir stepper vertical, título “Etapa X de Y” ou resumo horizontal rolável;
- nunca inventar precisão de progresso quando o sistema não a conhece;
- operações longas **MUST** explicar o que está acontecendo e se o usuário pode sair da tela.

### 8.11 Upload de arquivos

- informar formatos, quantidade e tamanho máximo antes do envio;
- permitir seleção por botão e drag and drop no desktop;
- mostrar nome, tipo, tamanho, progresso, sucesso e erro por arquivo;
- permitir cancelar e remover quando a regra de negócio autorizar;
- validar conteúdo no servidor, não apenas extensão;
- não depender apenas de ícone para identificar ação ou estado.

### 8.12 Estado vazio, spinner e skeleton

- vazio deve explicar por que não há conteúdo e oferecer a próxima ação quando existir;
- diferenciar primeiro uso, nenhum resultado e erro de carregamento;
- ação síncrona curta usa feedback inline; acima de `300 ms`, mostrar indicador sem piscar;
- spinner serve espera indeterminada e **MUST** vir com label quando o contexto não for óbvio;
- skeleton serve conteúdo estrutural e preserva dimensões para evitar layout shift;
- loading progressivo prioriza título, ação e conteúdo essencial antes do secundário;
- skeleton não deve imitar texto pixel a pixel nem ser anunciado repetidamente por leitor de tela;
- após limite definido pelo produto, loading **MUST** migrar para mensagem de demora ou erro recuperável;
- conteúdo atualizado em segundo plano permanece disponível e recebe indicador não bloqueante.

### 8.13 Tooltip e popover

**Tooltip** explica brevemente um elemento; **popover** contém informação complementar ou ações. Tooltip **MUST NOT** conter interação.

- tooltip aparece após `400–700 ms` no hover e imediatamente no foco por teclado;
- fecha ao remover hover/foco, pressionar `Esc` ou tocar fora no caso de popover;
- conteúdo deve ser curto, sem informação essencial disponível somente ali;
- posicionamento preferencial: topo, direita, baixo, esquerda; o componente reposiciona para não sair da viewport;
- seta aponta ao gatilho sem cobrir seu foco;
- tooltip usa `role="tooltip"` e vínculo programático ao gatilho;
- popover gerencia foco conforme seu conteúdo, preserva ordem de teclado e retorna foco ao fechar;
- no mobile, tooltip acionado apenas por hover **MUST** virar ajuda persistente, botão de informação ou popover por toque;
- animação usa `motion/fast` e **MUST NOT** atrasar a leitura por teclado.

### 8.14 Dropdown, select e menu

- `select` escolhe valor de formulário; `menu` executa ação; `combobox` pesquisa e seleciona;
- gatilho **MUST** indicar estado expandido, valor atual e relação com o painel;
- abrir por clique/toque, `Enter`, `Space`, `ArrowDown` ou `ArrowUp` conforme o padrão;
- `Esc` fecha e devolve foco; setas navegam; `Home/End` alcançam extremos; busca por digitação é suportada;
- lista longa **SHOULD** oferecer busca, virtualização e estado sem resultado;
- opção pode conter label, descrição, ícone e marcador de seleção, preservando alinhamento;
- item desabilitado informa indisponibilidade quando isso for relevante;
- menu de ação **MUST NOT** ser implementado como select;
- painel respeita `z/dropdown`, reposiciona na viewport e limita altura com scroll interno único;
- no mobile, lista extensa **SHOULD** virar bottom sheet com busca e ação explícita de concluir quando houver multiseleção.

### 8.15 Accordion

- usar para conteúdo complementar em seções, não para esconder informação crítica ou etapas obrigatórias;
- título da seção é um botão completo com indicador de expansão;
- `aria-expanded` e relação com o painel são obrigatórios;
- `Enter` e `Space` alternam o painel; foco permanece no título;
- produto define se uma ou várias seções podem ficar abertas;
- estado aberto **MUST** ser preservado quando o usuário retorna ao contexto, se relevante;
- animação **MUST NOT** depender de altura fixa e respeita movimento reduzido;
- conteúdo fechado não participa da ordem de foco;
- no mobile, toda a linha do cabeçalho deve ser tocável com mínimo `44 px`.

### 8.16 Rating e avaliação

- usar somente quando avaliação quantitativa fizer sentido para o domínio;
- declarar escala (`1–5`, `0–10`), significado dos extremos e se zero significa “sem avaliação”;
- estrelas são representação visual; controle **MUST** possuir label e valor textual acessível;
- teclado permite navegar e selecionar sem exigir ponteiro;
- hover mostra prévia, mas seleção só ocorre após confirmação do usuário;
- modo somente leitura diferencia média, valor individual e quantidade de avaliações;
- permitir limpar somente quando a regra de negócio autorizar;
- em touch, cada opção mantém alvo mínimo de `44 × 44 px`.

### 8.17 Divider e separador

- divider separa grupos relacionados e **MUST NOT** substituir espaço ou título de seção;
- variantes permitidas: sólida, tracejada e com label central; criar outra variante exige caso recorrente;
- orientação horizontal ou vertical deve ser programaticamente identificável quando semântica;
- divisor decorativo fica oculto de tecnologia assistiva;
- divisor necessário para compreender controles ou regiões **MUST** ter `3:1` ou ser reforçado por espaço e heading;
- label de divisor usa `on/light-muted`, fundo sólido atrás do texto e padding `space/2`;
- em mobile, preferir espaço e agrupamento antes de multiplicar linhas visuais.

### 8.18 Ícones do sistema

- **Phosphor Icons é a única família padrão de iconografia do WAP Digital Design System**;
- o catálogo oficial do Phosphor é a fonte de verdade para nome, desenho, `viewBox`, pesos e espelhamento; Figma e código **MUST** apontar para o mesmo ícone semântico;
- adaptadores recomendados: `@phosphor-icons/react` em React, `@phosphor-icons/web` em HTML/JavaScript e `PhosphorSwift` em SwiftUI; outras stacks **MUST** consumir assets versionados de `@phosphor-icons/core` por um wrapper WAP;
- dependências comunitárias só podem ser adotadas após análise de manutenção, licença e compatibilidade; mesmo nesse caso, a geometria visual continua sendo Phosphor;
- importações devem ser seletivas ou compatíveis com tree shaking; **MUST NOT** carregar o catálogo inteiro no bundle;
- o peso padrão é `regular`; `fill` é reservado para seleção, favorito, avaliação preenchida ou estado equivalente; `duotone` é permitido apenas em empty states, onboarding e ilustrações a partir de `32 px`;
- pesos `thin` e `light` **MUST NOT** ser usados em controles ou navegação; `bold` exige justificativa de ênfase e consistência em toda a região;
- tamanhos permitidos: `16`, `20`, `24` e `32 px`; exceções devem ser documentadas;
- tamanho padrão: `20 px` em controles, `16 px` em interfaces densas, `24 px` em navegação ou destaque e `32 px` apenas em comunicação visual;
- espessura, peso, cantos e área óptica devem ser consistentes dentro da mesma região;
- ícone herda token de conteúdo da superfície; cor hardcoded no SVG é proibida, salvo logo/ilustração de marca;
- ícone sozinho em ação usa botão com alvo mínimo `44 × 44 px`, tooltip no desktop e nome acessível;
- ícone acompanhado de texto é decorativo quando o label já nomeia a ação;
- ícones decorativos usam `aria-hidden="true"`; ícones informativos possuem alternativa textual perceptível por tecnologia assistiva;
- o botão, link ou controle — nunca o SVG isolado — recebe foco, interação e nome acessível;
- **MUST NOT** usar emoji, caractere Unicode, Font Awesome, Material Icons, Lucide, Heroicons ou SVG artesanal como substituto de ícone do sistema;
- se o Phosphor não possuir o conceito necessário, primeiro combinar ícone + texto; um ícone WAP customizado exige revisão do Design System, grade óptica compatível e registro no catálogo;
- não escolher ícone apenas por semelhança visual: o nome semântico e o significado no contexto **MUST** ser documentados;
- ícones de direção **MUST** usar a capacidade `mirrored` ou equivalente quando a direção depender de locale RTL;
- mudança de peso entre `regular` e `fill` **MUST NOT** ser o único indicador de estado; combinar com label, forma, posição ou nome acessível;
- cada produto **MUST** registrar a versão do pacote Phosphor e atualizar por pull request com inspeção visual das mudanças de geometria.

#### Mapeamento mínimo de ícones

| Conceito WAP | Nome Phosphor preferencial | Peso padrão | Observação |
|---|---|---|---|
| Buscar | `MagnifyingGlass` | `regular` | decorativo quando houver placeholder ou label visível |
| Menu | `List` | `regular` | usar somente para abrir navegação compacta |
| Mais opções | `DotsThree` | `regular` | orientação horizontal por padrão |
| Voltar / avançar | `ArrowLeft` / `ArrowRight` | `regular` | espelhar quando o locale exigir |
| Editar | `PencilSimple` | `regular` | não usar para criar novo item |
| Excluir | `Trash` | `regular` | combinar com linguagem e tratamento destrutivo |
| Baixar | `DownloadSimple` | `regular` | informar formato ou consequência quando relevante |
| Ajuda | `Question` | `regular` | não substituir label de conteúdo crítico |
| Favorito / avaliação | `Star` | `regular` / `fill` | seleção também precisa de estado acessível |
| Fechar | `X` | `regular` | nome acessível inclui a superfície fechada quando necessário |

Checklist de implementação:

- nome do ícone existe no catálogo Phosphor da versão adotada;
- tamanho, peso e cor usam tokens ou propriedades do componente WAP;
- SVG não possui cor hardcoded nem listener de clique isolado;
- ação tem target mínimo, foco visível e nome acessível;
- ausência do asset falha no build ou teste visual, nunca silenciosamente;
- snapshot ou Storybook valida estado padrão, hover, active, focus, disabled e contraste.

#### Contrato de presença de ícones

| Superfície | Regra Phosphor |
|---|---|
| Navegação principal e sidebar | destino recorrente usa ícone + label; modo recolhido preserva tooltip e nome acessível |
| Salvar, visualizar, excluir, filtrar, buscar, enviar, baixar e copiar | ação usa o ícone semântico correspondente quando isso acelera reconhecimento; label permanece visível por padrão |
| Botão apenas com ícone | permitido somente para ação convencional, com nome acessível, tooltip no desktop e alvo mínimo |
| Paginação direcional | usa `CaretLeft` e `CaretRight`; número de página permanece texto |
| Breadcrumb | separador usa `CaretRight`; o ícone é decorativo e oculto da tecnologia assistiva |
| Accordion e tree view | usa `CaretDown` com rotação de estado; **MUST NOT** usar `+`, `−` ou caractere Unicode |
| Alertas e estados | usa ícone semântico Phosphor + título + mensagem; nunca depender apenas do ícone ou da cor |
| Links de download ou destino externo | usa `DownloadSimple`, ícone de arquivo ou `ArrowSquareOut` quando a consequência precisar de reforço |
| Segmented control de visualização | lista, grade e mapa usam `Rows`, `GridFour` e `MapTrifold`, sempre acompanhados de label |
| Tabs, números de página, IDs de registros e escolhas binárias | texto é suficiente; adicionar ícone sem função reconhecível é proibido |
| Empty state | pode usar um ícone Phosphor de domínio em `32 px`, acompanhado de título, explicação e próxima ação |

Regras de cobertura:

- cada revisão do Storybook **MUST** verificar símbolos Unicode usados como ícone e substituí-los por Phosphor;
- toda referência `data-icon` ou `<use>` **MUST** resolver para um símbolo existente e falhar visivelmente em desenvolvimento quando estiver ausente;
- o sprite ou bundle de produção contém somente os ícones utilizados;
- ícones inseridos ao lado de labels são decorativos e recebem `aria-hidden="true"`;
- a ausência intencional de ícone segue a tabela acima e não deve ser tratada como componente incompleto.

### 8.19 Avatar

- tamanhos recomendados: `24`, `32`, `40`, `48` e `64 px`;
- imagem usa recorte circular, `object-fit: cover` e texto alternativo adequado ao contexto;
- fallback usa iniciais determinísticas, no máximo dois caracteres, e par de cor com contraste aprovado;
- ausência de imagem **MUST NOT** mostrar asset quebrado;
- indicador de presença não depende apenas de cor e não cobre conteúdo essencial;
- avatar clicável possui alvo mínimo `44 × 44 px` e estado de foco;
- grupo de avatares mostra limite visível e contador acessível para excedentes;
- não inferir gênero, cargo ou identidade pela imagem.

### 8.20 Links

- link inline usa `primary/600` sobre branco, sublinhado por padrão e contraste mínimo `4.5:1`;
- `primary/500` **MUST NOT** ser usado para texto normal sobre branco;
- link de navegação pode usar peso, sublinhado/indicador e estado ativo, sem depender apenas de cor;
- links externo, download e nova janela **SHOULD** indicar consequência com texto ou ícone acessível;
- hover, visited, focus e active permanecem distinguíveis e com contraste válido;
- link desabilitado **SHOULD** ser removido da interação; se exibido, explicar indisponibilidade;
- texto do link descreve o destino; evitar “clique aqui”;
- botão **MUST NOT** ser estilizado como link quando executa ação crítica, e link **MUST NOT** ser usado para submeter formulário.

### 8.21 Copiar para área de transferência

- gatilho informa exatamente o que será copiado e possui nome acessível;
- após sucesso, exibir feedback “Copiado” por `2–4 s`, sem alterar largura do componente;
- falha **MUST** mostrar alternativa para seleção manual;
- conteúdo sensível exige confirmação ou regra específica e **MUST NOT** ser copiado automaticamente;
- preservar formatação somente quando ela fizer parte do valor;
- no desktop, pode usar tooltip/toast; no mobile, feedback deve permanecer visível sem cobrir o conteúdo;
- copiar **MUST NOT** disparar navegação, seleção ou outra ação inesperada.

### 8.22 Controles de seleção: checkbox, radio e switch

#### Checkbox

- usar checkbox para zero, uma ou várias seleções independentes;
- label visível **MUST** ser clicável e descrever o efeito, não apenas repetir “selecionar”;
- estados obrigatórios: unchecked, checked, indeterminate, hover, focus, pressed, disabled e error;
- estado indeterminado representa seleção parcial e **MUST NOT** ser usado como terceiro valor persistente;
- grupos relacionados usam `fieldset` e `legend` ou equivalente nativo;
- `Space` alterna o checkbox; `Tab` move entre controles focáveis;
- caixa visual pode ter `20–24 px`, mas o alvo real permanece `44 × 44 px` em touch;
- erro de grupo aparece após o conjunto e é associado programaticamente a ele.

#### Radio

- usar radio para escolher exatamente uma opção em conjunto pequeno e visível;
- quando seleção for obrigatória, o grupo **MUST** declarar isso antes da interação;
- setas movem e selecionam entre opções; `Home/End` alcançam extremos quando suportado;
- `Tab` entra e sai do grupo uma única vez, respeitando o padrão nativo da plataforma;
- não oferecer opção “nenhuma” implícita; quando permitido, usar uma opção textual explícita;
- grupos longos, pesquisáveis ou com descrições complexas **SHOULD** usar select, combobox ou página de escolha.

#### Switch

- usar switch somente para estado booleano que entra em vigor imediatamente;
- ação que exige confirmação, envio ou processamento **MUST** usar checkbox + botão ou botão explícito;
- label descreve a configuração; texto auxiliar pode comunicar “Ativado/Desativado”, sem depender da posição ou cor;
- `Space` alterna o estado e o componente expõe `checked`/`aria-checked` corretamente;
- loading bloqueia nova alternância e mantém o estado anterior até confirmação do sistema;
- falha restaura o valor anterior e apresenta mensagem recuperável próxima ao controle.

### 8.23 Campos especializados e grupos de entrada

#### Textarea

- usar para conteúdo multilinha; altura inicial acompanha a tarefa e permite redimensionamento quando apropriado;
- limite de caracteres, quando existir, fica visível antes do fim e é anunciado sem interromper digitação;
- contador **MUST NOT** substituir instrução sobre formato ou objetivo;
- crescimento automático possui altura máxima e depois usa scroll interno previsível.

#### Senha

- oferece ação acessível para mostrar/ocultar sem mover o cursor nem alterar o valor;
- requisitos aparecem antes da submissão e atualizam sem comunicar sucesso apenas por cor;
- permitir colar, gerenciadores de senha e autocomplete apropriado;
- força de senha **MUST NOT** impor regras não explicadas nem bloquear senhas longas válidas.

#### Número, moeda e quantidade

- identificadores, CEP, documentos e códigos **MUST NOT** usar campo numérico quando zeros iniciais forem significativos;
- quantidade pode usar stepper `−/+` somente com input editável e limites explícitos;
- moeda exibe formatação local sem corromper o valor durante edição;
- prefixo e sufixo visuais não entram no valor acessível; unidade permanece anunciada no label ou descrição;
- validar mínimo, máximo, casas decimais e separador conforme locale.

#### OTP, PIN e código de verificação

- aceitar colagem do código completo e preenchimento automático da plataforma;
- preferir um único campo semântico com apresentação segmentada quando possível;
- não mover foco de forma imprevisível nem apagar todos os dígitos por um erro;
- informar expiração, reenvio e canal mascarado; nunca expor o código em logs ou exemplos;
- tentativa, reenvio e bloqueio seguem requisitos de segurança do produto.

#### Input group, prefixo e ação acoplada

- prefixo, sufixo, unidade e botão acoplado compartilham uma borda e um nome de grupo coerentes;
- ação acoplada mantém alvo mínimo e foco próprio; ícone decorativo não entra na ordem de foco;
- erro, ajuda e label pertencem ao grupo completo, não apenas ao input interno;
- múltiplos campos visualmente unidos **MUST** continuar distinguíveis e navegáveis com zoom de `200%`.

### 8.24 Date picker, time picker e range picker

- usar controle nativo da plataforma quando ele atender locale, acessibilidade e regra de negócio;
- input textual e calendário compartilham o mesmo valor, label, erro e formato esperado;
- datas de interface usam `DD/MM/AAAA`; valor técnico usa ISO 8601 quando aplicável;
- timezone de seleção, armazenamento e exibição **MUST** ser explícito em operações distribuídas;
- calendário permite teclado por setas, `Home/End`, `PageUp/PageDown`, `Enter/Space` e `Esc` conforme o padrão;
- hoje, selecionado, intervalo, indisponível e foco são estados diferentes e não dependem só de cor;
- datas indisponíveis informam o motivo quando isso afetar a decisão;
- range picker identifica início e fim, impede intervalos inválidos e oferece limpeza explícita;
- seleção de horário declara formato `24 h`, granularidade e restrições;
- no mobile, picker nativo ou sheet em tela adequada **SHOULD** substituir calendário desktop comprimido.

### 8.25 Segmented control

- usar para alternar entre `2–5` opções mutuamente exclusivas e curtas dentro do mesmo contexto;
- não usar como substituto de tabs quando cada opção representa uma seção navegável;
- seleção atual usa forma, texto e/ou ícone além de cor;
- setas navegam entre segmentos; `Home/End` alcançam extremos quando aplicável;
- labels truncadas, grupos extensos ou opções com descrição **MUST** migrar para radio, select ou tabs;
- em mobile, cada segmento mantém altura mínima de `44 px` e texto legível sem reduzir fonte.

### 8.26 Slider e range

- usar slider somente quando a escolha aproximada dentro de um intervalo for aceitável;
- valor exato importante **MUST** possuir input numérico equivalente;
- exibir mínimo, máximo, valor atual, unidade e passos significativos;
- setas ajustam um passo; `PageUp/PageDown` ajustam incremento maior; `Home/End` alcançam limites;
- slider de intervalo possui dois controles nomeados e impede cruzamento ambíguo;
- trilha preenchida, thumb, foco, disabled e erro mantêm contraste mínimo de `3:1`;
- touch target do thumb é no mínimo `44 × 44 px`, mesmo quando o indicador visual for menor;
- atualização cara **SHOULD** ocorrer ao finalizar o gesto, com prévia leve durante movimento.

### 8.27 Toolbar, command bar e ações em lote

- toolbar agrupa ações relacionadas ao conteúdo imediatamente abaixo ou selecionado;
- ordem prioriza ação principal, ações frequentes e overflow; não esconder ação crítica sem alternativa clara;
- botões somente com ícone possuem nome acessível e tooltip no desktop;
- setas podem navegar dentro de toolbar quando implementada como widget composto; `Tab` entra e sai do grupo;
- ações em lote aparecem apenas após seleção, informam quantidade e escopo e preservam seleção após erro recuperável;
- ação destrutiva em lote mostra quantidade, objetos afetados e consequência antes da confirmação;
- no mobile, toolbar pode virar sticky action bar, menu de overflow ou bottom sheet sem perder nenhuma ação;
- toolbar fixa **MUST NOT** cobrir foco, mensagens, última linha da tabela ou teclado virtual.

### 8.28 Listas, description list, data grid e tree view

#### Lista e item de lista

- item declara área clicável, conteúdo principal, metadados, status e ações sem criar alvos sobrepostos;
- lista selecionável diferencia hover, foco, seleção e item ativo;
- swipe action no mobile possui botão/menu equivalente e não dispara ação destrutiva sem confirmação ou desfazer;
- virtualização preserva foco, posição, anúncio de quantidade e retorno ao item anterior.

#### Description list

- usar para pares estáveis de termo e valor, detalhes técnicos e resumos de registro;
- termo e valor permanecem associados após reflow; valor ausente usa `—`;
- no mobile, pares empilham sem separar label do valor;
- ações não são colocadas no lugar do valor; ficam em região própria e nomeada.

#### Data grid

- usar somente quando células exigirem navegação bidimensional, edição, seleção ou operações avançadas;
- tabela apenas de leitura **MUST NOT** virar data grid sem necessidade;
- declarar célula ativa, linha/coluna, modo de edição e seleção para tecnologia assistiva;
- setas navegam células; `Enter/F2` inicia edição; `Esc` cancela; `Tab` segue fluxo documentado;
- ordenação, redimensionamento, fixação e visibilidade de colunas possuem controle acessível;
- virtualização **MUST** manter contagem, índices, foco e leitura coerentes;
- mobile usa cards, detalhe progressivo ou experiência dedicada; grid desktop comprimido é último recurso.

#### Tree view

- usar para hierarquia real com expansão e seleção, não para lista visualmente indentada;
- setas direita/esquerda expandem, recolhem e navegam pai/filho; setas verticalmente mudam o item;
- nível, estado expandido, seleção e quantidade de filhos são programaticamente expostos;
- lazy loading mantém foco no nó e anuncia carregamento, sucesso ou erro;
- busca em árvore revela o caminho do resultado e preserva contexto ancestral.

### 8.29 Calendar e scheduler

- calendar representa datas; scheduler combina recursos, horários, duração e conflitos;
- oferecer visualizações dia, semana, mês ou agenda apenas quando cada uma apoiar uma decisão real;
- evento possui título, início, fim, timezone, status e nome acessível;
- sobreposição, indisponibilidade e conflito usam forma/texto além de cor;
- criação por drag possui alternativa por formulário e teclado;
- foco de teclado percorre controles e eventos em ordem previsível; “Hoje” retorna ao período atual;
- no mobile, visualização agenda ou dia **SHOULD** substituir grade semanal comprimida;
- atualizações em tempo real preservam seleção e não movem o evento focado sem anúncio;
- impressão, exportação e compartilhamento respeitam filtros, timezone e permissões.

### 8.30 KPI, stat, gráficos e legenda

- KPI mostra nome, valor, unidade, período, comparação e origem quando necessário;
- variação positiva/negativa depende do significado do negócio, não apenas do sinal matemático;
- cor **MUST NOT** ser o único meio de distinguir série, status ou direção;
- gráficos possuem título, descrição, unidade, período, fonte e alternativa tabular ou textual;
- legenda é interativa apenas quando pode ocultar/mostrar séries e então precisa de foco e estado selecionado;
- tooltip de gráfico também deve ser alcançável sem ponteiro ou ter equivalente persistente;
- eixos, labels e valores mantêm contraste e não podem depender de rotação ilegível;
- dados ausentes, parciais, estimados ou atrasados são explicitamente marcados;
- em mobile, reduzir séries, oferecer scroll intencional ou trocar para lista/tabela resumida.

### 8.31 Carousel, galeria e media viewer

- usar carousel somente quando itens formarem sequência ou coleção explorável; conteúdo essencial **MUST NOT** depender dele;
- autoplay é desativado por padrão; quando existir, oferece pausa persistente e respeita movimento reduzido;
- controles anterior/próximo usam ícones do sistema, nomes acessíveis e estado disabled nos extremos;
- indicador informa posição e total; dots possuem nome acessível quando forem controles;
- teclado, swipe e botões visíveis chegam aos mesmos itens;
- foco **MUST NOT** mover automaticamente quando o slide muda;
- galeria preserva proporção, zoom permitido e descrição de imagens informativas;
- media viewer em overlay gerencia foco, `Esc`, zoom, download e retorno ao item de origem;
- no mobile, swipe complementa — nunca substitui — controles ou navegação acessível.

### 8.32 Command palette e busca de comandos

- usar em produtos densos como atalho para ações e destinos existentes, nunca como único caminho;
- abre por botão visível e atalho documentado; atalho **MUST NOT** conflitar com navegador ou tecnologia assistiva;
- implementa dialog nomeado com busca, grupos, estado vazio, recentes e resultados ordenados;
- setas navegam, `Enter` executa, `Esc` fecha e foco retorna ao gatilho;
- cada resultado identifica se navega, executa, cria ou altera contexto;
- ação destrutiva ou irreversível **MUST** abrir confirmação separada;
- resultados respeitam permissões e não revelam recursos sensíveis;
- no mobile, pode virar busca de ações em tela cheia, com teclado virtual e safe areas tratados.

### 8.33 Central de notificações

- usar para histórico persistente; toast/snackbar continua reservado a feedback temporário;
- item possui tipo, título, resumo, timestamp, origem, estado lido/não lido e destino quando existir;
- contador não lido possui nome acessível e formato limitado (`9+`, `99+`);
- marcar como lido, arquivar e ações em lote oferecem feedback e desfazer quando adequado;
- notificações críticas não podem ser silenciosamente descartadas nem existir apenas na central;
- ordem, agrupamento e retenção são documentados pelo produto;
- atualização em tempo real não rouba foco nem desloca o item em leitura;
- no mobile, central pode ser página ou sheet; lista mantém alvo mínimo e safe area.

### 8.34 Context menu, action sheet e swipe actions

- context menu oferece ações sobre um objeto e abre por botão, clique secundário ou atalho de teclado;
- clique secundário e long press **MUST** ter gatilho visível equivalente;
- menu posiciona-se próximo ao objeto sem sair da viewport e devolve foco ao fechar;
- action sheet é a adaptação mobile para ações curtas; inclui título/contexto quando houver risco de ambiguidade;
- ação destrutiva fica separada visualmente, nomeia o objeto e pode exigir confirmação;
- swipe action revela no máximo ações essenciais e possui botão/menu equivalente;
- gesto parcial retorna ao estado anterior; gesto concluído fornece feedback, desfazer ou confirmação;
- menus não misturam seleção de valor com execução de ação.

### 8.35 Utilitários estruturais

#### Skip link

- é o primeiro controle focável e leva ao conteúdo principal ou região operacional relevante;
- aparece visualmente no foco, não fica atrás de header e usa par de contraste aprovado;
- produtos com múltiplas regiões densas **MAY** oferecer links para navegação, conteúdo e filtros.

#### Scroll area

- usar scroll interno somente quando a altura da região for intencional e perceptível;
- evitar scroll aninhado no mesmo eixo;
- foco e navegação programática revelam o elemento inteiro com margem para sticky headers;
- início, fim e conteúdo adicional não dependem apenas da aparência da barra de rolagem.

#### Sticky action bar

- fixa ações essenciais somente quando o conteúdo longo justificá-la;
- reserva espaço equivalente no fim da página e respeita safe area e teclado virtual;
- não cobre erro, toast, campo focado, paginação ou última linha;
- em zoom/reflow, ações empilham ou entram em overflow sem reduzir alvo ou fonte.

#### Overlay, scrim e superfície inerte

- overlay usa tokens `overlay/default` ou `overlay/strong`, cobre toda a viewport e bloqueia o fundo;
- fundo recebe comportamento inerte para ponteiro, teclado e leitor de tela;
- clique no scrim fecha apenas quando não houver perda ou consequência crítica;
- scrim não substitui borda, elevação, nome acessível nem gestão de foco da superfície modal.

### 8.36 Catálogo global obrigatório

O catálogo abaixo é a lista mínima que agentes, designers e desenvolvedores **MUST** consultar antes de criar um componente. Ele contém `76` componentes e padrões reutilizáveis. “Obrigatório” significa que a decisão de usar, compor ou descartar deve ser consciente; não significa que todo produto implementará todos eles.

| Família | Componentes e padrões cobertos |
|---|---|
| Fundações e ações (`10`) | button, icon button, link, icon, avatar, badge/status, chip/tag, divider, focus indicator, skip link |
| Formulários (`18`) | text input, textarea, checkbox, radio, switch, select, combobox/autocomplete, search, password, number/quantity, date picker, time picker, date range picker, slider/range, segmented control, rating, upload/dropzone, OTP/PIN |
| Navegação (`13`) | global nav/app shell, app bar/top bar, sidebar, navigation rail, drawer navigation, bottom navigation, breadcrumb, tabs, pagination, stepper/wizard, menu/context menu, command palette, back action |
| Conteúdo e dados (`14`) | card, list/list item, description list, accordion, table, data grid, tree view, calendar/scheduler, KPI/stat, chart/legend, timeline, carousel/gallery, empty state, toolbar/bulk action bar |
| Feedback e overlays (`13`) | alert, banner, toast/snackbar, notification center, progress bar, spinner, skeleton, modal/dialog, drawer, bottom sheet, tooltip, popover, overlay/scrim |
| Mobile e sistema (`8`) | FAB, pull-to-refresh, swipe actions, long-press menu, safe-area container, sticky action bar, scroll area, keyboard accessory/viewport handling |

Regras de catálogo:

- nomes em inglês podem existir na API; documentação e conteúdo de produto usam português do Brasil;
- antes de criar componente local, verificar composição de itens do catálogo;
- ausência de exemplo visual **MUST NOT** ser interpretada como permissão para inventar comportamento;
- componente não aplicável ao produto deve ser marcado como “não necessário”, não removido do catálogo global;
- componente específico de domínio fica fora desta lista até demonstrar reutilização em mais de um produto;
- cada implementação registra maturidade: experimental, beta, estável ou depreciada;
- Figma, código, Storybook e este arquivo **MUST** manter o mesmo nome conceitual e versão.

### 8.37 Cobertura dos itens sugeridos no showcase de referência

Todos os `32` itens listados em “Itens Sugeridos para Validação” no arquivo `design-system-showcase_2 1.html` estão cobertos. Esta matriz é normativa e impede regressão documental.

| Item do showcase | Cobertura neste documento | Status |
|---|---|---|
| Modais & Dialogs | 8.8 Modal, dialog, drawer e bottom sheet | Coberto |
| Tooltips & Popovers | 8.13 Tooltip e popover | Coberto |
| Dropdowns & Menus | 8.14 Dropdown, select e menu | Coberto |
| Accordion | 8.15 Accordion | Coberto |
| Stepper / Wizard | 8.10 Stepper, timeline e progresso | Coberto |
| Toast / Notificações | 8.9 Alertas, banners e toasts; 8.33 Central de notificações | Coberto |
| Spinners & Loading | 8.12 Estado vazio, spinner e skeleton | Coberto |
| Skeleton Screens | 8.12 Estado vazio, spinner e skeleton | Coberto |
| Rating / Stars | 8.16 Rating e avaliação | Coberto |
| Chips / Tags Removíveis | 8.5 Chips, tags e status | Coberto |
| Divider / Separador | 8.17 Divider e separador | Coberto |
| Ícones do Sistema | 8.18 Ícones do sistema | Coberto |
| Avatar | 8.19 Avatar | Coberto |
| Progress Bar | 8.10 Stepper, timeline e progresso | Coberto |
| Link Styling | 8.20 Links | Coberto |
| Copy to Clipboard | 8.21 Copiar para área de transferência | Coberto |
| Drawer Navigation | 6.9 Drawer navigation | Coberto |
| Bottom Sheet Dialog | 6.9 Bottom sheet; 8.8 overlays | Coberto |
| Bottom Navigation Bar | 6.9 Bottom navigation bar | Coberto |
| Safe Area / Notch Support | 6.9 Safe areas, notch e barras do sistema | Coberto |
| Gesture Handling | 6.9 Gestos | Coberto |
| Mobile Keyboard Handling | 6.7 foco responsivo; 6.9 teclado virtual | Coberto |
| Pull to Refresh | 6.9 Pull to refresh | Coberto |
| Infinite Scroll / Pagination | 6.9 carregamento de listas; 8.7 Paginação | Coberto |
| Mobile Form Patterns | 6.9 Formulários mobile; 8.2 formulários | Coberto |
| Mobile Table / Data Display | 6.9 Tabelas e dados no mobile | Coberto |
| Touch Target Sizing | 6.9 Touch targets; 12 Acessibilidade | Coberto |
| Status Bar Styling | 6.9 Safe areas, notch e barras do sistema | Coberto |
| Floating Action Button (FAB) | 6.9 Floating action button | Coberto |
| Long Press Context Menu | 6.9 Long press; 8.34 Context menu | Coberto |
| Haptic Feedback Patterns | 6.9 Feedback háptico | Coberto |
| Orientation Change Handling | 6.7 foco responsivo; 6.9 orientação | Coberto |

## 9. Padrões de tela

### Autenticação

- combinar identidade WAP com formulário direto;
- suportar recuperação de acesso e SSO quando aplicável;
- senha possui alternância de visibilidade e requisitos claros;
- erros não revelam existência de contas;
- nunca preencher credenciais reais em protótipos, fixtures ou builds.

### Lista ou catálogo

- título e ação principal;
- busca e filtros;
- resultado em tabela, lista ou cards conforme comparação necessária;
- ordenação e paginação persistentes;
- estados loading, vazio, sem resultado e erro.

### Detalhe

- retorno ao contexto anterior;
- identidade do registro, status e ações principais;
- resumo antes de informação aprofundada;
- abas ou seções para conteúdo extenso;
- histórico e autoria quando houver impacto operacional.

### Dashboard

- começar por perguntas e decisões, não por quantidade de gráficos;
- métricas exibem definição, período e unidade;
- cores de gráfico não conflitam com semânticas de status;
- permitir inspeção e acesso ao dado de origem;
- incluir estado sem dados e atualização temporal.

### Operações orientadas a dados

- tabelas **MUST** declarar coluna principal, colunas comparáveis e colunas dispensáveis no mobile;
- filtros **MUST** poder ser revisados e removidos;
- seleção em lote **MUST** informar quantidade e escopo;
- atualização em tempo real **MUST** informar quando o dado foi atualizado;
- conflito de edição **MUST** preservar o trabalho do usuário e oferecer comparação ou recarga;
- valores ausentes usam `—`, nunca zero inventado;
- ordenação **MUST** definir tratamento de valores ausentes;
- exportação **MUST** respeitar filtros, permissões, locale e timezone atuais;
- gráficos **MUST** oferecer unidade, período, fonte e alternativa tabular quando necessária;
- densidade compacta **MAY** ser oferecida como preferência, sem reduzir acessibilidade.

### Permissões e ações críticas

- conteúdo sem permissão **MUST** seguir a política do produto: ocultar quando sua existência for sensível ou desabilitar com explicação quando for útil;
- ação indisponível **SHOULD** explicar requisito ou perfil necessário;
- confirmação **MUST** nomear a ação, o objeto afetado e a consequência;
- exclusão irreversível de alto impacto **SHOULD** exigir confirmação reforçada;
- ações em lote **MUST** mostrar quantidade e escopo antes da execução;
- operações demoradas **MUST** informar progresso ou processamento em segundo plano;
- histórico **MUST** registrar autoria e horário quando a rastreabilidade for requisito do domínio;
- impersonação ou troca de contexto **MUST** permanecer visualmente evidente.

### Criação e edição

- informar objetivo e consequência;
- dividir formulários longos por assunto;
- manter ações consistentes: cancelar à esquerda, avançar/salvar à direita;
- prevenir perda acidental de dados;
- confirmar resultado e indicar próximo passo.

### Configurações

- separar preferências reversíveis de mudanças críticas;
- explicar escopo: usuário, equipe, conta ou organização;
- salvar automaticamente apenas quando o feedback for inequívoco;
- registrar mudanças sensíveis quando necessário.

## 10. Estados e feedback obrigatórios

Toda experiência de dados deve considerar:

- carregamento inicial;
- atualização em segundo plano;
- conteúdo vazio;
- busca sem resultados;
- erro recuperável;
- erro de permissão;
- indisponibilidade temporária;
- ação em andamento;
- sucesso;
- validação parcial ou total;
- sessão expirada;
- perda de conexão;
- conflito de edição ou dado desatualizado, quando aplicável.

O sistema deve sempre responder às perguntas: “o que aconteceu?”, “meus dados foram salvos?” e “o que posso fazer agora?”.

## 11. Conteúdo e linguagem

### Voz

- clara, direta e profissional;
- acolhedora sem excesso de informalidade;
- orientada à ação;
- específica sobre problemas e consequências.

### Regras

- usar português do Brasil e sentence case;
- preferir verbos concretos: “Salvar”, “Enviar”, “Revisar”, “Tentar novamente”;
- evitar “OK”, “Sim” ou “Não” quando a ação puder ser nomeada;
- explicar erros e como corrigi-los;
- usar `—` quando não houver valor;
- datas: `DD/MM/AAAA`; horas: `HH:mm`; sempre definir timezone em operações distribuídas;
- números e unidades seguem convenção local e mantêm espaço entre valor e unidade;
- siglas são explicadas no primeiro uso quando o público puder não conhecê-las;
- não expor credenciais, tokens, dados pessoais ou informações sensíveis em exemplos.

### Localização e formatação

- locale padrão: `pt-BR`;
- produtos **MUST** registrar timezone de exibição e armazenamento;
- datas de interface usam `DD/MM/AAAA`; APIs **SHOULD** usar ISO 8601;
- horas usam formato `24 h` (`HH:mm`);
- moeda usa `R$ 1.234,56` quando BRL;
- porcentagem usa vírgula decimal conforme locale;
- unidades **MUST** manter espaço entre número e símbolo: `20 kg`, `15 km`;
- mensagens **MUST** suportar pluralização;
- layouts **MUST** tolerar expansão de texto de pelo menos `30%`;
- conteúdo traduzido **MUST NOT** depender de concatenação de fragmentos;
- nomes, documentos, endereços e telefones **MUST NOT** assumir tamanho fixo.

## 12. Acessibilidade

O mínimo esperado é WCAG 2.2 nível AA.

- contraste adequado em texto, ícones e estados de foco;
- alvo interativo mínimo de `44 × 44 px`;
- navegação completa por teclado;
- foco visível de pelo menos `2 px`;
- ordem de foco acompanha a leitura;
- headings preservam hierarquia sem saltos arbitrários;
- campos possuem label, ajuda e erro programaticamente associados;
- modais prendem foco e anunciam nome e descrição;
- tabelas possuem caption/contexto e cabeçalhos associados;
- status e gráficos oferecem equivalente textual;
- imagens têm texto alternativo quando informativas;
- conteúdo funciona com zoom de `200%` sem perda de função;
- reflow funciona em largura equivalente a `320 px` quando aplicável;
- movimento reduzido é respeitado;
- mensagens importantes não dependem somente de cor, posição ou som.

## 13. Privacidade, segurança e confiança

- coletar e exibir apenas dados necessários à tarefa;
- mascarar informações sensíveis por padrão;
- nunca usar dados reais em protótipos ou documentação pública;
- explicar por que uma permissão ou dado é necessário;
- ações críticas devem mostrar escopo e consequência;
- logout e expiração de sessão precisam de comportamento previsível;
- erros de autenticação não devem facilitar enumeração de contas;
- uploads exigem validação e tratamento seguro;
- logs e históricos devem equilibrar rastreabilidade e privacidade.

## 14. Implementação e governança

### Tokens

- tokens semânticos são a API visual do sistema;
- componentes não devem usar hex diretamente quando existir token equivalente;
- Figma, código e documentação usam o mesmo nome conceitual;
- temas alteram valores, não a intenção do token;
- mudanças globais precisam de migração e registro de impacto.

### Quality gates automatizados

Todo pacote ou produto que implemente o design system **MUST** executar em CI:

1. teste de contraste dos pares de tokens aprovados;
2. teste de contraste de cada estado dos componentes;
3. detecção de cores e espaçamentos arbitrários fora dos tokens;
4. teste automatizado de acessibilidade nas telas críticas;
5. captura visual nos viewports `390`, `768`, `1280` e `1440 px`;
6. regressão visual de componentes estáveis;
7. validação de overflow, clipping e layout shift com texto ampliado;
8. teste end-to-end da sequência de foco e de abertura/devolução de foco em overlays nos breakpoints críticos.

Falha em contraste de texto, controle, foco ou erro **MUST** bloquear merge. Teste automatizado não substitui revisão com teclado, leitor de tela, zoom e inspeção visual.

### Componentes

Cada componente reutilizável deve documentar:

- propósito e quando usar;
- anatomia;
- variantes e tamanhos;
- estados: default, hover, focus, active, disabled, loading e error;
- comportamento responsivo;
- teclado e atributos acessíveis;
- exemplos corretos e incorretos;
- API no código e vínculo com o componente do Figma.

### Maturidade

| Nível | Uso permitido | Garantia |
|---|---|---|
| Experimental | protótipos e validação | pode mudar sem migração |
| Beta | produto controlado | API quase estável; feedback obrigatório |
| Estável | produção | versionamento e migração documentados |
| Depreciado | manutenção temporária | substituto e prazo de remoção definidos |

Produtos **MUST NOT** depender de componente experimental em fluxo crítico sem aceite explícito do responsável pelo produto.

### Versionamento e mudança

- design system **MUST** seguir versionamento semântico;
- correção compatível incrementa patch;
- nova capacidade compatível incrementa minor;
- remoção, renomeação ou mudança comportamental incompatível incrementa major;
- toda mudança **MUST** registrar motivo, componentes/tokens afetados e orientação de migração;
- componente depreciado **MUST** informar substituto e data-alvo de remoção;
- divergência entre Figma e código **MUST** ser tratada como defeito do sistema.

### Processo de contribuição

1. registrar problema recorrente e produtos afetados;
2. verificar se composição de componentes existentes resolve o caso;
3. propor anatomia, estados, conteúdo e comportamento responsivo;
4. validar acessibilidade e tokens;
5. testar em pelo menos dois contextos reais;
6. publicar como experimental ou beta;
7. promover a estável após evidência de reutilização;
8. registrar a decisão e atualizar changelog.

### Extensões por produto

Um produto pode criar componentes de domínio quando:

1. não existe padrão global equivalente;
2. o caso se repete no próprio produto;
3. a solução reutiliza tokens e primitivas globais;
4. acessibilidade e responsividade foram validadas;
5. nome e documentação descrevem o conceito, não uma tela específica.

Se o padrão aparecer em mais de um produto, deve ser avaliado para promoção ao design system global.

## 15. Regras para agentes de IA e geração de interfaces

Ao criar ou modificar um produto WAP, agentes e ferramentas generativas:

- **MUST** ler este arquivo antes de propor ou implementar interface;
- **MUST** identificar o contexto alvo: mobile, tablet e desktop;
- **MUST** usar tokens, componentes e templates existentes;
- **MUST** consultar o catálogo global da seção 8.36 antes de criar ou nomear um componente;
- **MUST** informar se o componente foi reutilizado, composto, estendido ou criado como exceção local;
- **MUST** escolher fundo e conteúdo como um par aprovado (`surface` + `on-*`), nunca como cores independentes;
- **MUST** informar a razão de contraste dos pares novos ou dinâmicos;
- **MUST** usar apenas tokens de espaçamento e declarar padding, gap e alinhamento dos componentes criados;
- **MUST** implementar loading, vazio, erro, sucesso, disabled e focus quando aplicáveis;
- **MUST** preservar semântica, teclado e nomes acessíveis;
- **MUST** aplicar o contrato de foco por modalidade de entrada, sem presumir que breakpoint equivale a touch ou ponteiro;
- **MUST** preservar foco lógico em reflow, resize, rotação, troca de orientação e transformação de componentes;
- **MUST** verificar reflow em `390`, `768`, `1280` e `1440 px` quando o produto for web responsivo;
- **MUST** aplicar os contratos mobile de safe area, teclado, touch target, gestos e orientação quando houver experiência mobile;
- **MUST** selecionar corretamente entre dialog, drawer, bottom sheet, tooltip, popover, select e menu;
- **MUST NOT** inventar cores, sombras, raios, breakpoints ou tipografia quando houver token;
- **MUST NOT** usar `primary/500` ou `text/300` como texto normal sobre branco;
- **MUST NOT** usar uma cor escura sobre fundo escuro ou clara sobre fundo claro sem razão de contraste medida;
- **MUST NOT** usar transparência, gradiente ou imagem sem testar a cor final renderizada;
- **MUST NOT** corrigir composição com valores arbitrários fora da escala de espaçamento;
- **MUST NOT** copiar dimensões fixas de desktop para mobile;
- **MUST NOT** ocultar informação essencial apenas para fazer o layout caber;
- **MUST NOT** usar dados pessoais ou credenciais reais em exemplos;
- **SHOULD** preferir composição a criar componente novo;
- **SHOULD** declarar qualquer exceção e sua justificativa no handoff;
- **SHOULD** comparar implementação e fonte visual antes de concluir.

### Saída mínima esperada

Uma entrega gerada **MUST** informar:

1. componentes e tokens reutilizados;
2. regras responsivas aplicadas;
3. estados implementados;
4. verificações de acessibilidade realizadas;
5. exceções ou decisões específicas do produto;
6. tamanhos de viewport validados;
7. pares de cor e razões de contraste validados;
8. tokens de padding e gap aplicados;
9. componentes mobile e comportamento de teclado/gestos aplicados;
10. estados de overlay, loading e feedback temporário validados;
11. sequência e preservação de foco validadas por viewport e modalidade de entrada;
12. cobertura do catálogo global e justificativa para componentes locais.

## 16. Checklist de qualidade

Antes de liberar uma experiência:

- [ ] Usa tokens globais e Plus Jakarta Sans.
- [ ] Reutiliza componentes existentes.
- [ ] O catálogo global da seção 8.36 foi consultado antes de criar componente novo.
- [ ] Checkbox, radio, switch, select, menu e tabs não foram usados como substitutos semânticos entre si.
- [ ] Possui hierarquia clara e uma ação principal por região.
- [ ] Funciona em mobile, tablet e desktop relevantes ao produto.
- [ ] Não comprime tabelas ou grids de forma ilegível.
- [ ] Implementa loading, vazio, erro, sucesso e ausência de permissão.
- [ ] Mantém dados e filtros quando o usuário retorna ao contexto anterior.
- [ ] Pode ser operada por teclado e possui foco visível.
- [ ] A sequência de foco acompanha a ordem visual e a tarefa em cada breakpoint.
- [ ] Foco permanece ou recebe destino lógico após reflow, resize, rotação, exclusão e mudança de rota.
- [ ] O anel de foco atinge `3:1`, não é cortado e continua visível em superfícies claras, escuras e semânticas.
- [ ] Mobile e tablet foram testados com touch e, quando suportado, teclado externo; desktop foi testado com teclado e ponteiro.
- [ ] Atende contraste e demais requisitos WCAG 2.2 AA.
- [ ] Cada superfície usa um token `on-*` aprovado ou possui medição registrada.
- [ ] Texto normal atinge `4.5:1`; texto grande e controles atingem `3:1`.
- [ ] Default, hover, active, selected, focus, disabled e error foram testados separadamente.
- [ ] Texto sobre imagem, transparência e gradiente foi medido no pior ponto.
- [ ] Não usa `primary/500` nem `text/300` como texto normal sobre branco.
- [ ] Textos seguem a voz WAP e explicam a próxima ação.
- [ ] Não contém credenciais nem dados sensíveis de exemplo.
- [ ] Ações críticas têm confirmação e consequência explícita.
- [ ] Componentes estão alinhados entre Figma e código.
- [ ] Foi validada nos tamanhos de tela definidos pelo produto.
- [ ] Foi validada em mobile, tablet e desktop ou possui justificativa de escopo.
- [ ] Componentes possuem estados default, hover, focus, active, disabled, loading e error quando aplicáveis.
- [ ] Não há valores visuais arbitrários onde existe token.
- [ ] Padding, gap e alinhamento usam a escala e permanecem consistentes entre componentes equivalentes.
- [ ] Conteúdo curto, longo, vazio e com zoom de `200%` não quebra o espaçamento.
- [ ] Permissões e ações críticas comunicam escopo e consequência.
- [ ] Datas, números, unidades e timezone seguem as regras do produto.
- [ ] Modais, drawers, sheets, menus e popovers respeitam foco, `Esc`, overlay e z-index.
- [ ] Todo overlay devolve foco ao gatilho ou a um destino lógico quando o gatilho deixa de existir.
- [ ] Toasts possuem duração, fila, anúncio acessível e não cobrem ações.
- [ ] Loading diferencia spinner, skeleton, atualização progressiva e demora excessiva.
- [ ] Tooltips não contêm interação e possuem alternativa adequada no mobile.
- [ ] Links, ícones, avatares, chips e copy-to-clipboard seguem seus contratos.
- [ ] Mobile respeita safe areas, status bar e teclado virtual.
- [ ] Teclado virtual, barras sticky, bottom navigation, FAB e toasts não cobrem o elemento focado.
- [ ] Todos os alvos touch têm `44 × 44 px` e espaçamento suficiente.
- [ ] Gestos possuem alternativa visível e não conflitam com gestos do sistema.
- [ ] Listas preservam posição e usam conscientemente paginação, carregar mais ou infinite scroll.
- [ ] Formulários usam tipos de teclado, autofill e validação apropriados.
- [ ] Portrait e landscape preservam estado quando rotação for suportada.
- [ ] Fluxos mobile críticos foram testados em pelo menos um dispositivo real por plataforma suportada.

## 17. Decisões que cada produto deve registrar

1. público, contexto de uso e dispositivos prioritários;
2. navegação e arquitetura de informação;
3. papéis, permissões e escopo das ações;
4. status, transições e cores semânticas usadas;
5. formatos de data, número, moeda e timezone;
6. densidade de tabela e estratégia mobile;
7. regras de erro, conflito e recuperação;
8. dados sensíveis e política de mascaramento;
9. componentes específicos do domínio;
10. métricas de experiência e critérios de aceite;
11. estratégia de overlay e camadas;
12. navegação mobile e destinos primários;
13. gestos, haptics e alternativas acessíveis;
14. estratégia de loading e carregamento de listas;
15. suporte a tema, orientação e dispositivos reais;
16. modalidades de entrada suportadas e destinos de foco em navegação, reflow e overlays.

## 18. Changelog

### 1.3.3 — 19/08/2026

- corrigida a demonstração visual da escala Phosphor no Storybook para exibir o mesmo glifo em `16`, `20`, `24` e `32 px` reais;
- reforçada a distinção entre tamanho óptico do glifo e alvo interativo mínimo de `44 × 44 px`;
- adaptada a amostra para quatro colunas em tablet/desktop e duas colunas em mobile.

### 1.3.2 — 19/08/2026

- criado contrato de presença de ícones por superfície e tipo de ação;
- padronizados navegação, ações, paginação, breadcrumb, accordion, alerts, links e segmented control com Phosphor;
- definida a ausência intencional de ícones em tabs, números de página, IDs e escolhas que já são claras por texto;
- adicionada validação obrigatória para símbolos Unicode, referências inexistentes e carregamento desnecessário do catálogo completo.

### 1.3.1 — 19/08/2026

- definida **Phosphor Icons** como família oficial de ícones para todos os produtos digitais WAP;
- documentados pesos permitidos, tamanhos, acessibilidade, RTL, performance, versionamento e exceções;
- adicionados adaptadores recomendados por stack e mapeamento semântico mínimo;
- proibida a mistura com outras bibliotecas e formalizado o processo para ícones WAP customizados.

### 1.3.0 — 19/08/2026

- auditados e confirmados os `32` itens sugeridos pelo showcase de referência;
- adicionada matriz normativa que liga cada sugestão à seção correspondente;
- criado catálogo global obrigatório com `76` componentes e padrões;
- adicionados contratos de checkbox, radio, switch, textarea, senha, números, OTP/PIN e input groups;
- documentados date/time/range picker, segmented control, slider e controles de quantidade;
- adicionados toolbar, ações em lote, listas, description list, data grid e tree view;
- documentados calendar/scheduler, KPI, gráficos, carousel, galeria e media viewer;
- adicionados command palette, central de notificações, context menu, action sheet e swipe actions;
- formalizados skip link, scroll area, sticky action bar, overlay e superfície inerte;
- ampliadas regras para agentes e checklist para impedir criação duplicada ou semanticamente incorreta.

### 1.2.1 — 14/08/2026

- criado contrato responsivo de foco para touch, teclado, ponteiro e tecnologias assistivas;
- definido que breakpoint não determina modalidade de entrada;
- documentados contraste, aparência, recorte, ordem e preservação de foco durante reflow;
- adicionadas regras para overlays, rotas, exclusão, teclado virtual, orientação e componentes responsivos;
- ampliados requisitos para agentes, saída mínima e checklist com matriz de teste por viewport.

### 1.2.0 — 14/08/2026

- incorporados os itens sugeridos pelo showcase de referência;
- aprofundados dialogs, drawers, bottom sheets, chips, toasts, stepper, progresso, spinner e skeleton;
- adicionados tooltip, popover, dropdown, menu, accordion, rating, divider, ícones, avatar, links e copy-to-clipboard;
- criado contrato de z-index, overlays e política para dark mode;
- adicionados drawer mobile, bottom navigation e safe areas/notch;
- documentados gestos, teclado virtual, pull-to-refresh, infinite scroll e formulários mobile;
- adicionadas estratégias de tabelas mobile, touch targets, FAB, long press, haptics, status bar e rotação;
- ampliadas validação de formulários, regras para agentes, decisões por produto e checklist de dispositivos reais.

### 1.1.0 — 13/08/2026

- corrigido contrato de contraste com limites mensuráveis WCAG 2.2 AA;
- adicionados tokens de conteúdo `on-*` vinculados às superfícies;
- documentados pares aprovados, restritos e proibidos com razões calculadas;
- definido algoritmo obrigatório para cores dinâmicas, imagens, transparências e gradientes;
- corrigido uso inadequado de `primary/500`, `text/300` e separadores escuros;
- adicionados tokens de borda de controle com contraste suficiente;
- formalizadas regras de composição, densidade, padding, gaps e ritmo vertical;
- ampliados contratos de botões, formulários, cartões, status, tabelas e agentes de IA;
- ampliado checklist para validar contraste e espaçamento em todos os estados.

### 1.0.0 — 10/08/2026

- estabelecido contrato normativo `MUST/SHOULD/MAY`;
- adicionados tokens de erro, interação e exemplo para código;
- definidas regras completas para mobile, tablet, desktop e wide;
- adicionada matriz responsiva por componente;
- formalizados anatomia, estados e maturidade de componentes;
- adicionados padrões de dados, permissões, localização e ações críticas;
- criadas regras para agentes de IA, versionamento e contribuição.
