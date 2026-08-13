select 
    
    id_produto as produto_id,
    nome as produto_nome,
    categoria,
    preco
from {{ ref('raw_produtos') }}