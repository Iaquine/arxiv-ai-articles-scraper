# Arxiv AI Articles Scraper

Este projeto é um scraper para obter informações sobre artigos científicos da seção de Inteligência Artificial do Arxiv. Ele extrai o título, autores, resumo, link e assuntos de cada artigo e armazena essas informações em um arquivo CSV.

Requisitos: Antes de rodar o projeto, certifique-se de que você possui os seguintes requisitos instalados:

- Python 3.7 ou superior
- Bibliotecas Python:
  - `requests`
  - `beautifulsoup4`
  - `pandas`
  
## Você pode instalar as dependências necessárias utilizando o arquivo `requirements.txt` com o seguinte comando:
pip install -r requirements.txt

## Dependências:
- makefile
- requests==2.28.1
- beautifulsoup4==4.11.1
- pandas==1.4.2

## Para Clonar o repositório: 
git clone https://github.com/seu-usuario/arxiv-ai-scraper.git
cd arxiv-ai-scraper
Instale as dependências: pip install -r requirements.txt

## Rodar o scraper:
python scraper.py


O script irá fazer a requisição ao Arxiv e buscar artigos da seção de Inteligência Artificial, coletando os dados desejados (título, autores, resumo, link e assuntos).

##  Configuração de paginação:

O scraper suporta a configuração de dois parâmetros principais:

- skip: O número de artigos a serem ignorados (paginando para a próxima página). O valor padrão é 0.
- show: O número de artigos a serem retornados por vez. O valor padrão é 50.
- Exemplo:

python
Copy
Edit
fetch_articles(skip=50, show=50)

## Salvando os dados:

Após a execução, o scraper irá salvar os dados coletados em um arquivo CSV chamado articles.csv na pasta data/. O arquivo contém as seguintes colunas:

- Title: O título do artigo.
- Authors: Lista de autores do artigo.
- Abstract: O resumo do artigo.
- Link: URL do artigo no Arxiv.
- Subjects: Assuntos relacionados ao artigo.


## Como funciona
### Passo 1: Buscar Artigos
O scraper começa acessando a URL base da seção de Inteligência Artificial do Arxiv, configurando parâmetros de paginação para coletar múltiplas páginas de artigos, se necessário. Ele utiliza a biblioteca requests para enviar uma requisição HTTP e o BeautifulSoup para parsear o HTML e extrair as informações dos artigos.

### Passo 2: Obter Informações de Cada Artigo
Para cada artigo, o scraper extrai as seguintes informações:

- Título: Extraído do elemento <div class="list-title">.
- Autores: Extraído do elemento <div class="list-authors">.
- Resumo: O scraper segue o link para a página de cada artigo e utiliza uma requisição extra para buscar o resumo (abstract) do artigo.
- Link: URL do artigo no Arxiv.
- Assuntos: Extraído do elemento <div class="list-subjects">.

### Passo 3: Salvar Dados
Após a extração dos dados, o scraper salva as informações no formato CSV utilizando a biblioteca pandas. O arquivo gerado será armazenado no diretório data/ com o nome articles.csv.

### Exemplos de saída
O arquivo articles.csv gerado pode ter a seguinte estrutura:

| Title                     | Authors               | Abstract                                      | Link                          | Subjects               |
|---------------------------|-----------------------|-----------------------------------------------|-------------------------------|------------------------|
| Deep Learning for AI       | John Doe, Jane Smith  | This paper introduces deep learning...        | https://arxiv.org/abs/1234567 | Machine Learning, AI   |
| Reinforcement Learning...  | Alice Johnson, Bob Lee| Reinforcement learning is a powerful technique| https://arxiv.org/abs/7654321 | Reinforcement Learning |
