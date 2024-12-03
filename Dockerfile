# Usando a imagem base do Python
FROM python:3.12-slim

# Não criar um ambiente (foi opção de projeto)
ENV POETRY_VIRTUALENVS_CREATE=false

# Definindo o diretório de trabalho
WORKDIR /app

# Copiando arquivos para o container
COPY pyproject.toml /app
COPY poetry.lock /app
COPY . /app

# Instala as dependências necessárias
RUN pip install poetry

# Instalações do Poetry correndo em paralelo
RUN poetry config installer.max-workers 10

# Configurações do Poetry para instalar sem perguntas
RUN poetry install --no-interaction --no-ansi
