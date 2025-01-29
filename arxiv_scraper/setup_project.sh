#!/bin/bash

# Cria os diretórios principais
#mkdir -p arxiv_scraper/arxiv_scraper/data

# Cria os arquivos principais do projeto
touch arxiv_scraper/arxiv_scraper/__init__.py
touch arxiv_scraper/arxiv_scraper/scraper.py
touch arxiv_scraper/arxiv_scraper/storage.py
touch arxiv_scraper/arxiv_scraper/config.py
touch arxiv_scraper/arxiv_scraper/utils.py
touch arxiv_scraper/requirements.txt
touch arxiv_scraper/README.md
touch arxiv_scraper/setup.py
touch arxiv_scraper/.gitignore
touch arxiv_scraper/Bumpfile
touch arxiv_scraper/Makefile
touch arxiv_scraper/pre-commit-config.yaml

# Cria um arquivo CSV de exemplo
touch arxiv_scraper/arxiv_scraper/data/arxiv_data.csv

# Adiciona conteúdo básico ao .gitignore
echo "__pycache__/" > arxiv_scraper/.gitignore
echo "*.pyc" >> arxiv_scraper/.gitignore
echo "*.pyo" >> arxiv_scraper/.gitignore
echo "*.env" >> arxiv_scraper/.gitignore

# Adiciona o conteúdo básico ao requirements.txt
echo "requests" > arxiv_scraper/requirements.txt
echo "beautifulsoup4" >> arxiv_scraper/requirements.txt
echo "pydantic" >> arxiv_scraper/requirements.txt
echo "poetry" >> arxiv_scraper/requirements.txt

# Adiciona o conteúdo básico ao README.md
echo "# Arxiv Scraper" > arxiv_scraper/README.md
echo "Este projeto realiza a extração de dados da seção de Inteligência Artificial do Arxiv e armazena as informações em um arquivo CSV." >> arxiv_scraper/README.md
echo "## Como Usar" >> arxiv_scraper/README.md
echo "### Instalação" >> arxiv_scraper/README.md
echo "1. Clone o repositório:" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "   git clone https://github.com/usuario/arxiv_scraper.git" >> arxiv_scraper/README.md
echo "   cd arxiv_scraper" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "2. Instale as dependências:" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "   pip install -r requirements.txt" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "### Execução" >> arxiv_scraper/README.md
echo "Para extrair os dados e armazená-los no arquivo CSV:" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "   python arxiv_scraper/scraper.py" >> arxiv_scraper/README.md
echo "   \`\`\`" >> arxiv_scraper/README.md
echo "Os dados serão armazenados em \`arxiv_data.csv\`." >> arxiv_scraper/README.md

# Adiciona conteúdo básico ao Makefile
echo "install:" > arxiv_scraper/Makefile
echo "    pip install -r requirements.txt" >> arxiv_scraper/Makefile
echo "" >> arxiv_scraper/Makefile
echo "run:" >> arxiv_scraper/Makefile
echo "    python arxiv_scraper/scraper.py" >> arxiv_scraper/Makefile

# Adiciona o conteúdo básico ao Bumpfile
echo "[version]" > arxiv_scraper/Bumpfile
echo "current = 0.1.0" >> arxiv_scraper/Bumpfile

# Adiciona conteúdo básico ao pre-commit-config.yaml
echo "-   repo: https://github.com/pre-commit/mirrors-autopep8" > arxiv_scraper/pre-commit-config.yaml
echo "    rev: v1.6.0" >> arxiv_scraper/pre-commit-config.yaml
echo "    hooks:" >> arxiv_scraper/pre-commit-config.yaml
echo "    -   id: autopep8" >> arxiv_scraper/pre-commit-config.yaml
echo "" >> arxiv_scraper/pre-commit-config.yaml
echo "-   repo: https://github.com/pre-commit/mirrors-pylint" >> arxiv_scraper/pre-commit-config.yaml
echo "    rev: v2.15.0" >> arxiv_scraper/pre-commit-config.yaml
echo "    hooks:" >> arxiv_scraper/pre-commit-config.yaml
echo "    -   id: pylint" >> arxiv_scraper/pre-commit-config.yaml

echo "Estrutura do projeto criada com sucesso!"
