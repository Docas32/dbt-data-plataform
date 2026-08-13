
  create view "analytics"."public"."stg_produtos__dbt_tmp"
    
    
  as (
    select 
    
    id_produto as produto_id,
    nome as produto_nome,
    categoria,
    preco
from "analytics"."public"."raw_produtos"
  );