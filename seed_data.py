from faker import Faker
import pandas as pd
import random

fake = Faker('pt_BR')
Faker.seed(42)
random.seed(42)

# 1000 clientes 
clientes = [{'id_cliente': i, 'nome': fake.name(), 'email': fake.email(),
              'telefone': fake.phone_number(), 'cidade': fake.city(),
                'estado': fake.state()} for i in range(1, 1001)] 

pd.DataFrame(clientes).to_csv('raw_clientes.csv', index=False)

# 50 produtos
produtos = [{'id_produto': i, 'nome': fake.word(), 'categoria': random.choice(['Eletrônicos', 'Roupas', 'Casa', 'Esportes']), 
             'preco': round(random.uniform(20, 500), 2)} for i in range(1, 51)]

pd.DataFrame(produtos).to_csv('raw_produtos.csv', index=False)

# 10 mil vendas
vendas = [{'id_venda': i, 'id_cliente': random.randint(1, 1000), 'id_produto': random.randint(1, 50), 
           'quantidade': random.randint(1, 10), 'data_pedido': fake.date_between(start_date='-1y', end_date='today')} for i in range(1, 10001)]

pd.DataFrame(vendas).to_csv('raw_vendas.csv', index=False)


print("Arquivos CSV gerados com sucesso: raw_clientes.csv, raw_produtos.csv, raw_vendas.csv")
