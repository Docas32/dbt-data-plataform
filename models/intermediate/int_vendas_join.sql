with vendas as (select * from {{ ref('stg_vendas') }}),
     clientes as (select * from {{ ref('stg_clientes') }}),
     produtos as (select * from {{ ref('stg_produtos') }})

select
    v.id_venda,
    v.data_pedido,
    c.cliente_nome,
    c.estado,
    p.produto_nome,
    p.categoria,
    p.preco,    
    v.quantidade,
    (p.preco * v.quantidade) as valor_total_bruto
from vendas v
join clientes c on v.cliente_id = c.cliente_id
join produtos p on v.produto_id = p.produto_id