select
    id_cliente as cliente_id,
    id_produto as produto_id,
    id_venda,
    quantidade,
    data_pedido
from {{ ref('raw_vendas') }}