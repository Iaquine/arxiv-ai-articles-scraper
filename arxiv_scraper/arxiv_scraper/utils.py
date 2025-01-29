def clean_string(text):
    """
    Função para limpar texto removendo espaços extras.
    
    Args:
        text (str): Texto a ser limpo.
        
    Returns:
        str: Texto limpo.
    """
    return " ".join(text.split())
