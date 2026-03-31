# Sistema-Fretes

Sistema web para gestao de operacoes de transporte, com foco em controle de fretes, motoristas, veiculos, manutencoes, abastecimentos e validacao de CNH.

## Visao Geral

O projeto foi construido em Rails 8 com PostgreSQL e interface Bootstrap. A aplicacao diferencia perfis de acesso (Gerente e Motorista), organiza operacoes em fluxo diario e oferece recursos como:

- cadastro e acompanhamento de fretes
- controle de frota e status de veiculos
- registro de manutencoes e abastecimentos
- vinculo e acompanhamento de CNH de funcionarios
- estimativa dinamica de preco de frete por distancia
- paginacao com Pagy (7 itens por pagina)

## Principais Funcionalidades

### 1. Gestao de Fretes

- cadastro de frete com rota (origem/destino), motorista, veiculo, preco e status
- fluxo de criacao em etapas (stepper)
- estimativa de preco baseada em distancia geocodificada
- listagem paginada e acoes de detalhar/editar/excluir

### 2. Gestao de Funcionarios e Perfis

- autenticacao com Devise
- separacao por cargo usando STI (`Funcionario`, `Motorista`, `Gerente`)
- visualizacao de dados pessoais e operacionais

### 3. Gestao de CNH

- cadastro e edicao de CNH por funcionario
- controle de categoria, validade e status
- uso do status/validade no fluxo de habilitacao de motorista

### 4. Gestao de Veiculos

- cadastro de dados da frota (placa, modelo, categoria, status, quilometragem)
- associacao com fretes, manutencoes e abastecimentos

### 5. Manutencoes e Abastecimentos

- registro de manutencoes por veiculo (tipo, datas, custo e oficina)
- registro de abastecimentos com combustivel, litros e preco
- suporte a comprovante de abastecimento via Active Storage

### 6. Dashboards e Listagens

- area de gerente com visao consolidada da operacao
- area de motorista com visao de operacoes vinculadas
- tabelas com componente compartilhado e paginacao consistente

## Arquitetura do Projeto

### Padrao

- **MVC (Rails):** controllers organizam fluxos HTTP, models concentram regras e views renderizam interface

## Tecnologias Utilizadas

- **Backend:** Ruby on Rails 8
- **Banco de dados:** PostgreSQL
- **Autenticacao:** Devise
- **Paginacao:** Pagy
- **Geolocalizacao e distancia:** Geocoder
- **Validacao de CPF/CNPJ:** cpf_cnpj
- **Frontend Rails:** Turbo + Stimulus + Importmap
- **UI/CSS:** Bootstrap 5 + Bootstrap Icons + Sass
- **Upload de arquivos:** Active Storage
- **Infra dev opcional:** Docker + Docker Compose

## Como Rodar o Projeto Localmente

Voce pode executar com Docker (mais simples para ambiente padrao) ou nativamente.

---

### Opcao 1: Rodar com Docker (recomendado)

#### Requisitos

- Docker
- Docker Compose

#### Passos

1. Na raiz do projeto, suba os containers:

```bash
docker compose up --build
```

2. Em outro terminal, prepare o banco:

```bash
docker compose exec app bin/rails db:prepare
```

3. Acesse a aplicacao:

- App: `http://localhost:3000`
- Adminer (opcional): `http://localhost:8080`

---

### Opcao 2: Rodar sem Docker (nativo)

#### Requisitos

- Ruby 3.3.x
- PostgreSQL
- Node.js 20+
- Yarn

#### Passos

1. Instale dependencias Ruby e JS:

```bash
bundle install
yarn install
```

2. Defina variaveis para banco local (exemplo):

```bash
export DATABASE_HOST=localhost
export POSTGRES_USER=admin
export POSTGRES_PASSWORD=root
```

3. Prepare o banco:

```bash
bin/rails db:prepare
```

4. Gere os assets CSS:

```bash
yarn build:css
```

5. Rode o servidor Rails:

```bash
bin/rails server -p 3000
```

6. Em paralelo (opcional, durante desenvolvimento), rode o watcher de CSS:

```bash
yarn watch:css
```

## Comandos Uteis

```bash
# rodar testes
bin/rails test

# limpar logs e temporarios
bin/rails log:clear tmp:clear

# preparar banco rapidamente
bin/rails db:prepare
```

