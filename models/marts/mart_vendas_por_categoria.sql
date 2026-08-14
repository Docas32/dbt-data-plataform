select
    date_trunc('month', data_pedido) as mes_referencia,
    categoria,
    sum(valor_total_bruto) as receita_total,
    sum(quantidade) as total_itens_vendidos,
    count(distinct id_venda) as total_pedidos
from {{ ref('int_vendas_join') }}
group by 1, 2
order by mes_referencia desc, receita_total desc