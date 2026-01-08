# 📌 Visão Geral do Projeto

Este projeto foi desenvolvido como parte de um desafio técnico de análise de dados, com foco em engenharia de software, arquitetura de dados e entrega de valor analítico para RH e liderança. O sistema centraliza ingestão, análise e visualização de dados de engajamento de colaboradores, permitindo extração de insights, geração de relatórios e exploração criativa sobre clima organizacional.

- **Contexto:** Desafio realista, com dados de pesquisa de clima (em português), exigindo backend robusto, visualizações, API, EDA, análise de sentimento e automação.
- **Objetivo:** Prover uma solução completa, auditável e extensível para análise de engajamento, feedback e eNPS.
- **Problema Resolvido:** Reduzir o tempo e esforço para transformar dados brutos de pesquisa em insights acionáveis para RH e liderança.
- **Público-alvo:** Avaliadores técnicos, profissionais de RH, gestores e lideranças interessadas em cultura organizacional.

# 🧠 Decisões Técnicas e Assumptions

- **Stack:** Ruby on Rails 8.1.1, PostgreSQL, Chartkick/Chart.js, TailwindCSS, daisyUI, RSpec, RuboCop, Docker Compose.
- **Escolha do Rails:** Optou-se por Rails devido à produtividade, maturidade do ecossistema, integração nativa com asset pipeline, testes e automação.
- **Análise de Sentimento Léxica:** Implementada abordagem léxica (dicionário + regras) para explainability e performance, sem dependência de modelos ML pesados, garantindo transparência e baixo custo computacional.
- **Assumptions:**
  - Dataset pode conter campos nulos ou inconsistentes.
  - Campos textuais estão em português; pré-processamento considera acentuação e stopwords.
  - Métricas como eNPS seguem padrões internacionais.
- **Limitações:**
  - Análise de sentimento não captura ironia/sarcasmo.
  - Visualizações focadas em dados tabulares e gráficos estáticos.

# 🗂️ Estrutura do Projeto (Árvore)

```
app/
 ├── controllers/         # Lógica de API, dashboard e CRUD
 ├── models/              # ORM e validações
 ├── services/            # Lógica de negócio, EDA, sentimento, relatórios
 │    ├── sentiment/      # Análise de sentimento
 │    ├── reports/        # Geração de relatórios executivos
 │    └── insights/       # Explorações criativas e EDA
 ├── views/               # Templates e componentes visuais
 └── jobs/                # (Reservado para background jobs futuros)
spec/                     # Testes unitários, integração e sistema
infra/                    # Dockerfile, compose, configs, RuboCop
public/                   # Assets estáticos, data.csv
Makefile                  # Automação de tarefas
```

- **app/controllers/**: APIs REST, dashboard, CRUD.
- **app/services/**: Lógica de negócio, EDA, sentimento, relatórios.
- **spec/**: Testes RSpec (unit, service, request, integration).
- **infra/**: Infraestrutura (Docker, RuboCop, configs).
- **public/**: Arquivos estáticos e dataset.

# 🧪 Tasks Implementadas

- **Task 1 – Database setup**

  - _Objetivo:_ Estruturar dados do CSV em PostgreSQL.
  - _Abordagem:_ Migrations, seeds, validações, importação robusta.
  - _Resultado:_ Base relacional normalizada, pronta para queries e análises.
  - _Código:_ app/models/, db/migrate/, db/seeds.rb

- **Task 2 – Dashboard**

  - _Objetivo:_ Visualizar métricas-chave (área, feedback, eNPS).
  - _Abordagem:_ Rails views, Chartkick, filtros dinâmicos.
  - _Resultado:_ Dashboard interativo e responsivo.
  - _Código:_ app/controllers/dashboard_controller.rb, app/views/dashboard/

- **Task 3 – Test Suite**

  - _Objetivo:_ Garantir robustez e confiabilidade.
  - _Abordagem:_ RSpec, FactoryBot, cobertura de services, controllers e integrações.
  - _Resultado:_ Testes automatizados, fácil refatoração.
  - _Código:_ spec/

- **Task 4 – Docker Compose**

  - _Objetivo:_ Facilitar setup e portabilidade.
  - _Abordagem:_ Dockerfile multi-stage, compose.yml, Makefile wrappers.
  - _Resultado:_ Ambiente isolado, reprodutível e pronto para avaliação.
  - _Código:_ infra/Dockerfile, infra/compose.yml, Makefile

- **Task 5 – Exploratory Data Analysis**

  - _Objetivo:_ Explorar padrões e sumarizar dados.
  - _Abordagem:_ Service EDA, boxplots, distribuição de tenure.
  - _Resultado:_ Insights sobre tenure, feedback, outliers.
  - _Código:_ app/services/employee_eda_service.rb, spec/services/employee_eda_service_spec.rb

- **Task 6/7/8 – Visualizações (Company/Area/Employee)**

  - _Objetivo:_ Gráficos e comparativos em múltiplos níveis.
  - _Abordagem:_ Chartkick, views, presenters.
  - _Resultado:_ Visualizações claras, segmentação por área e colaborador.
  - _Código:_ app/presenters/, app/views/dashboard/, app/services/employee_profile_service.rb

- **Task 9 – Simple API**

  - _Objetivo:_ Expor dados via JSON.
  - _Abordagem:_ Namespaces versionados, serialização customizada, paginação.
  - _Resultado:_ API RESTful, endpoints para employees e respostas.
  - _Código:_ app/controllers/api/, spec/requests/api/

- **Task 10 – Sentiment Analysis**

  - _Objetivo:_ Classificar sentimento de comentários.
  - _Abordagem:_ Service léxico customizado, UnicodeUtils, PragmaticSegmenter.
  - _Resultado:_ Sentimento (positivo, negativo, neutro) por resposta.
  - _Código:_ app/services/sentiment/analyzer.rb, spec/services/sentiment_analyzer_spec.rb

- **Task 11 – Report Generation**

  - _Objetivo:_ Gerar relatórios executivos.
  - _Abordagem:_ Service de agregação, métricas eNPS, feedback, sentimento.
  - _Resultado:_ Relatório HTML com métricas-chave.
  - _Código:_ app/services/reports/employee_report_service.rb, spec/services/employee_report_service_spec.rb

- **Task 12 – Creative Exploration**
  - _Objetivo:_ Explorar relação entre tenure e sentimento.
  - _Abordagem:_ Exploração criativa via análise dos dados presentes.
  - _Resultado:_ Insights sobre engajamento por tempo de empresa.

# 📊 Análises, Relatórios e Visualizações

- **Relatórios:** Relatório executivo HTML disponível via dashboard.
- **Gráficos:** Feedback médio, eNPS, distribuição de tenure, sentimento por área.
- **Localização:** app/views/dashboard/, public/
- **Como visualizar:** Acesse o dashboard via navegador (porta 3000).

# 🎨 Front-end

- **Stack:** Tailwind CSS + daisyUI.
- **Motivo:** Produtividade, design consistente, responsividade e acessibilidade.
- **Componentes:** Cards, gráficos, tabelas, filtros, temas customizados.
- **UX:** Foco em clareza visual, contraste, responsividade e navegação fluida.
- **Mobile:** Todos os estilos e componentes foram pensados para garantir boa experiência também em dispositivos móveis (mobile-first), com navegação adaptada e responsiva.

# 📚 Documentação da API (Swagger)

Este projeto inclui documentação interativa da API utilizando Swagger (via rswag). A documentação permite explorar e testar os endpoints disponíveis de forma visual e prática.

- **Como acessar:**

  1. Certifique-se de que o servidor Rails está rodando (`rails s`).
  2. Acesse [http://localhost:3000/api-docs](http://localhost:3000/api-docs) no seu navegador.
  3. Explore os endpoints, parâmetros e exemplos de resposta diretamente pela interface.

- **Localização dos arquivos Swagger:**

  - Configuração: `config/initializers/rswag_api.rb`, `config/initializers/rswag_ui.rb`
  - Especificações: `spec/swagger_helper.rb`, `swagger/v1/`

- **Benefícios:**
  - Facilita o entendimento e testes da API.
  - Útil para integração com outros sistemas e validação de contratos.

# 🧪 Testes e Qualidade de Código

- **Estratégia:** RSpec para unitários, services, requests e integrações. FactoryBot para fixtures. Cobertura: controllers, services, EDA, sentimento, API.
- **Como rodar:** `bundle exec rspec`
- **Importância:** Garante refatoração segura, documentação viva e confiança na entrega.

# 🧹 RuboCop e Padrões de Código

- **Uso:** RuboCop com config Omakase, métricas customizadas.
- **Objetivo:** Padronizar, garantir legibilidade e evitar dívidas técnicas.
- **Como rodar:** `make rubocop-local`
- **Importância:** Essencial para times, code review e manutenção.

# 🐳 Docker e Docker Compose

- **Motivo:** Facilitar onboarding, isolar dependências e garantir reprodutibilidade.
- **Serviços:** db: PostgreSQL 16, web: Rails app
- **Como subir:** `make compose-up` ou `docker compose-build`
- **Variáveis:** Definidas em `.env.development` (exemplo incluso)
- **Benefícios:** Setup rápido, ambiente idêntico ao de produção

# 🛠️ Makefile

- **Motivo:** Simplificar comandos e evitar erros manuais.
- **Comandos disponíveis no Makefile:**
- `db-setup`: Prepara o banco de dados (rails db:setup)
- `db-reset`: Reseta o banco de dados (rails db:reset)
- `db-migrate`: Executa as migrações
- `test`: Executa a suíte de testes
- `rubocop`: Lint remoto (container)
- `rubocop-local`: Lint local
- `compose-up`: Sobe os containers
- `compose-down`: Para os containers
- `compose-build`: Build dos containers
- `compose-logs`: Logs dos containers
- `compose-bash`: Bash no container web
- `import-employees`: Importa colaboradores do CSV
- **Benefício:** Onboarding rápido

# ▶️ Como Rodar o Projeto

> **Versões utilizadas:**
>
> - Ruby: 3.2.0 (veja `.ruby-version` na raiz)
> - Rails: 8.1.1 (veja `Gemfile`)

## Execução Local (Recomendado)

1. Clone o repositório

2. Instale as dependências Ruby:

```sh
bundle install
```

3. Instale e configure o Tailwind CSS (apenas na primeira vez):

```sh
bin/rails tailwindcss:install
```

4. Garanta que o serviço do banco de dados (PostgreSQL) está rodando. Recomenda-se utilizar Docker para isolar dependências:

```sh
make compose-up
```

5. Crie e migre o banco de dados para os ambientes de desenvolvimento e teste:

```sh
rails db:create
rails db:migrate
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test
```

6. (Opcional) Importe os colaboradores do arquivo CSV:

```sh
rails import:employees
```

7. Execute a suíte de testes para garantir que o ambiente está funcionando:

```sh
bundle exec rspec
```

8. Inicie o servidor Rails para acessar o dashboard:

```sh
rails s
```

9. Acesse o dashboard em [http://localhost:3000](http://localhost:3000)

> **Nota profissional:**
>
> - O Docker é utilizado exclusivamente para o banco de dados, garantindo isolamento, reprodutibilidade e setup rápido.
> - Não é necessário que o servidor Rails esteja rodando para executar migrações, importar dados ou rodar testes. Basta que o banco esteja disponível.
> - Recomenda-se sempre rodar `make compose-up` antes de qualquer operação que dependa do banco.
> - O fluxo sugerido acima garante onboarding rápido, seguro e alinhado com boas práticas de engenharia sênior.

# 📦 Code and Files

- Todo o código, scripts, configs e documentação estão versionados neste repositório.
- Não há dependências externas ocultas.
- Serviços e assets inclusos.

# 📄 Documentação Adicional

- Relatórios HTML disponíveis no repositório.
- Visualizações e métricas acessíveis via dashboard.
- Observações e limitações documentadas nas seções acima.
