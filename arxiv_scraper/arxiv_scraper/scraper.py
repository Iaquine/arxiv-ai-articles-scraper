import requests
from bs4 import BeautifulSoup
from arxiv_scraper.storage import save_to_csv
from arxiv_scraper.config import BASE_URL

def fetch_article_abstract(article_url):
    """
    Função para obter o abstract de um artigo a partir da URL.

    Args:
        article_url (str): URL do artigo no Arxiv.

    Returns:
        str: O resumo do artigo.
    """
    response = requests.get(article_url)
    if response.status_code != 200:
        raise Exception(f"Erro ao acessar o artigo. Código: {response.status_code}")

    soup = BeautifulSoup(response.content, "html.parser")
    abstract_tag = soup.find("blockquote", class_="abstract")
    
    if abstract_tag:
        return abstract_tag.text.strip()
    else:
        return "Resumo não disponível"

def fetch_articles(skip=0, show=50):
    """
    Função para obter os artigos da seção de Inteligência Artificial do Arxiv.

    Args:
        skip (int): O número de artigos a serem ignorados (paginação).
        show (int): O número de artigos a serem retornados.

    Returns:
        list: Lista de dicionários contendo título, autores, resumo, link e assuntos.
    """
    url = f"{BASE_URL}/list/cs.AI/recent?skip={skip}&show={show}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
    }
    response = requests.get(url, headers=headers)

    if response.status_code != 200:
        raise Exception(f"Erro ao acessar a página. Código: {response.status_code}")

    print("Página carregada com sucesso!")
    soup = BeautifulSoup(response.content, "html.parser")
    articles = []

    # Obter os elementos <dt> e <dd>
    articles_dt = soup.find_all("dt")
    articles_dd = soup.find_all("dd")

    # Certificar-se de que o número de <dt> e <dd> é igual
    if len(articles_dt) != len(articles_dd):
        print("❌ Mismatch entre os elementos <dt> e <dd>. Verifique a página.")
        return []

    print(f"✅ Total de artigos encontrados: {len(articles_dt)}")

    # Processar os artigos
    for dt, dd in zip(articles_dt, articles_dd):
        # Link do artigo
        link_tag = dt.find("a", href=True)
        link = f"https://arxiv.org{link_tag['href']}" if link_tag else "No Link"

        # Título
        title_tag = dd.find("div", class_="list-title")
        title = title_tag.text.replace("Title:", "").strip() if title_tag else "No Title"

        # Autores
        authors_tag = dd.find("div", class_="list-authors")
        authors = authors_tag.text.replace("Authors:", "").strip() if authors_tag else "No Authors"

        # Obter o resumo
        abstract = fetch_article_abstract(link)

        # Assuntos
        subjects_tag = dd.find("div", class_="list-subjects")
        subjects = subjects_tag.text.replace("Subjects:", "").strip() if subjects_tag else "No Subjects"

        articles.append({
            "title": title,
            "authors": authors,
            "abstract": abstract,
            "link": link,
            "subjects": subjects
        })

    return articles

if __name__ == "__main__":
    print("Web scraping do Arxiv iniciado...")
    articles = fetch_articles()

    if articles:
        # Salvar em CSV
        save_to_csv(articles, "data/articles.csv")
        print(f"✅ CSV salvo com {len(articles)} artigos.")
    else:
        print("❌ Nenhum artigo foi capturado.")
