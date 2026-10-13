# 🐾 PetStoreRobot140 — Automação de Testes de API

## 📌 Sobre o projeto

Este projeto tem como objetivo desenvolver e executar testes automatizados de API utilizando Robot Framework e RequestsLibrary, tendo como referência a API Swagger PetStore.

A automação é voltada à validação de endpoints, respostas HTTP e dados retornados pela API, aplicando conceitos de testes funcionais e verificação de contratos e comportamentos esperados.

O projeto faz parte do meu portfólio de Quality Assurance (QA), demonstrando conhecimentos práticos em testes de API, automação e organização de casos de teste.

## 🎯 Objetivos

- Automatizar testes funcionais de API REST.
- Validar respostas e códigos de status HTTP.
- Verificar dados retornados nos formatos JSON.
- Testar operações relacionadas a pets, pedidos e usuários, conforme os cenários implementados.
- Organizar os testes utilizando Robot Framework.
- Praticar a reutilização de keywords e dados de teste externos.

## 🛠️ Tecnologias utilizadas

- **Python** — ambiente de execução.
- **Robot Framework** — framework de automação de testes.
- **RequestsLibrary** — biblioteca para realizar requisições HTTP.
- **API Swagger PetStore** — API utilizada como ambiente de testes.
- **JSON** — formato de dados para requisições e respostas.
- **Git e GitHub** — versionamento e compartilhamento do projeto.

## 🧪 Cenários de teste

| Funcionalidade | Objetivo |
|---|---|
| Pets | Validar operações e respostas relacionadas a pets. |
| Store | Verificar operações relacionadas a pedidos. |
| Users | Validar operações relacionadas a usuários, caso implementadas. |
| Status HTTP | Conferir os códigos de resposta esperados. |
| Respostas JSON | Validar a estrutura e os dados retornados. |
| Dados de teste | Utilizar arquivos externos para alimentar cenários automatizados. |

## ⚙️ Pré-requisitos

- Python instalado.
- Robot Framework.
- RequestsLibrary.
- Acesso à internet para comunicação com a API.

## 🚀 Como executar o projeto

### 1. Clone o repositório

```bash
git clone https://github.com/Swellhenrique/PetStoreRobot140.git
```

### 2. Acesse a pasta

```bash
cd PetStoreRobot140
```

### 3. Crie um ambiente virtual

```bash
python -m venv venv
```

### 4. Ative o ambiente virtual

No Windows PowerShell:

```powershell
.\venv\Scripts\Activate.ps1
```

### 5. Instale as dependências

```bash
pip install robotframework robotframework-requests
```

Se o projeto possuir um arquivo `requirements.txt`, prefira instalar as dependências declaradas nele:

```bash
pip install -r requirements.txt
```

### 6. Execute os testes

```bash
robot -d results .
```

O comando executa os arquivos de teste Robot Framework encontrados no diretório informado e salva os resultados na pasta `results`.

**Observação:** ajuste o comando de execução conforme a estrutura real do repositório e os diretórios que contêm os arquivos `.robot`.

## 📊 Relatórios de execução

O Robot Framework gera relatórios que permitem analisar os resultados dos testes:

- **report.html** — resumo da execução.
- **log.html** — detalhes das etapas e das falhas.
- **output.xml** — resultados estruturados para processamento posterior.

## 📚 Aprendizados

Este projeto contribui para o desenvolvimento de habilidades em:

- Testes automatizados de API REST.
- Métodos HTTP e códigos de status.
- Validação de respostas e dados JSON.
- Automação com Robot Framework e RequestsLibrary.
- Organização e reutilização de casos de teste.
- Utilização de arquivos externos para dados de teste.
- Análise de falhas e relatórios de execução.

## 👨‍💻 Autor

**Swell Henrique**

Estudante de Análise e Desenvolvimento de Sistemas, com foco em Quality Assurance (QA), testes de software e automação.

- **GitHub:** https://github.com/Swellhenrique

---

⭐ Projeto desenvolvido para praticar automação de testes de API e fortalecer meu portfólio na área de QA.
