# dbt-data-plataform

Breve repositório de exemplo que conecta dbt a um Postgres rodando em Docker.

## Requisitos
- Docker
- `uv` (ambiente Python usado neste projeto)
- Acesso ao repositório remoto (`origin`) configurado

## Como usar (rápido)

1. Verifique que o Docker está rodando:

```bash
sudo systemctl status docker
```

2. Se necessário, inicie o container Postgres (exemplo):

```bash
# exemplo (se precisar recriar):
docker run --rm --name postgres-dbt -e POSTGRES_PASSWORD=secret -e POSTGRES_DB=analytics -p 5432:5432 -d postgres:15
```

3. Use `uv` para executar comandos dbt no ambiente correto:

```bash
# validar conexão
uv run dbt debug --profiles-dir .

# carregar seeds (CSV em `seeds/`)
uv run dbt seed --profiles-dir .

# compilar/executar modelos
uv run dbt run --profiles-dir .

# gerar docs
uv run dbt docs generate --profiles-dir .

# servir docs (http://localhost:8080)
uv run dbt docs serve --profiles-dir . --port 8080
```

4. Consultas rápidas no banco (exemplo):

```bash
PGPASSWORD=secret psql -h 127.0.0.1 -p 5432 -U postgres -d analytics -c "select count(*) from public.raw_vendas;"
```

## Arquivos importantes
- `profiles.yml` — credenciais/host/porta do banco usadas pelo dbt (não comitar credenciais sensíveis).
- `dbt_project.yml` — configuração do projeto dbt (model-paths, seed-paths, profile).
- `seeds/` — CSVs carregados com `dbt seed`.
- `models/` — modelos dbt (staging e marts).
- `COMMANDS.md` — referência dos comandos usados no projeto.

## Notas
- Se receber `permission denied` ao usar `docker`, adicione seu usuário ao grupo `docker`:

```bash
sudo usermod -aG docker $USER
newgrp docker
```

Arquivo gerado em: 2026-08-13
# dbt-data-plataform
# dbt-data-plataform
# dbt-data-plataform
