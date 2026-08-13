select
    id_cliente as cliente_id,
    nome as cliente_nome,
    cidade,
    estado
from {{ ref('raw_clientes') }}

