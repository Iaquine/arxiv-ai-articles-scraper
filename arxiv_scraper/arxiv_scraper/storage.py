import csv
from pathlib import Path

def save_to_csv(articles, filename="arxiv_scraper/data/arxiv_data.csv"):
    """
    Salva a lista de artigos em um arquivo CSV.
    
    Args:
        articles (list): Lista de dicionários com os dados dos artigos.
        filename (str): Caminho para salvar o arquivo CSV.
    """
    Path(filename).parent.mkdir(parents=True, exist_ok=True)
    
    with open(filename, mode="w", encoding="utf-8", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=["title", "authors", "abstract", "link", "subjects"])
        writer.writeheader()
        writer.writerows(articles)

