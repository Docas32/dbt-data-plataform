# Comandos usados no projeto — referência rápida

> Arquivo gerado automaticamente com os comandos executados durante a configuração e execução do projeto dbt + Postgres em Docker. Use como referência.

## Docker e containers

- `sudo systemctl status docker`
  - Verifica se o serviço Docker está ativo no host.
- `docker ps -a --format "..."` (use `sudo` se necessário)
  - Lista containers, imagens, status e portas mapeadas.
- `sudo ls -l /var/run/docker.sock`
  - Mostra permissões do socket do Docker (útil para depurar `permission denied`).
- `id -nG`
  - Exibe grupos do usuário (verifica se pertence ao grupo `docker`).
- `sudo usermod -aG docker $USER` / `newgrp docker`
  - Adiciona o usuário ao grupo `docker` e aplica a mudança (evita `sudo` para docker).
- `sudo docker logs <container> --tail 200`
  - Mostra logs de um container (útil para Postgres init/errors).
- `sudo docker inspect <container> --format '{{range .Config.Env}}{{println .}}{{end}}'`
  - Exibe variáveis de ambiente do container (ex.: `POSTGRES_PASSWORD`).
- `sudo docker exec -i <container> psql -U <user> -d <db> -c "<sql>"`
  - Executa uma consulta SQL diretamente dentro do container Postgres.
- `docker run --rm --name test_pg -e POSTGRES_PASSWORD=pass -p 5432:5432 -d postgres:15`
  - Inicia um container Postgres de teste mapeando a porta 5432.

## PostgreSQL (cliente)

- `pg_isready -h <host> -p <port>`
  - Testa se o servidor Postgres está aceitando conexões.
- `PGPASSWORD=<pwd> psql -h <host> -p <port> -U <user> -d <db> -c "<sql>"`
  - Conecta ao Postgres a partir do host e executa SQL de forma não interativa.

## Ambiente `uv` e dbt

> Use `uv run <comando>` para executar `dbt` dentro do ambiente `uv`.

- `uv --version`
  - Verifica a versão do `uv`.
- `uv pip show <package>`
  - Mostra se um pacote (ex.: `dbt-core`) está instalado no ambiente `uv`.
- `uv run dbt --version`
  - Mostra a versão do `dbt` e dos plugins instalados.
- `uv run dbt debug --profiles-dir . --profile <profile>`
  - Valida `profiles.yml`, checa conexão com o banco e confere `dbt_project.yml`.
- `uv run dbt seed --profiles-dir .`
  - Carrega arquivos CSV configurados em `seed-paths` para o banco como tabelas.
- `uv run dbt run --profiles-dir .`
  - Compila e executa modelos do projeto (cria views/tables conforme `materialized`).
- `uv run dbt docs generate --profiles-dir .`
  - Gera artefatos de documentação (`catalog.json`, `manifest.json`).
- `uv run dbt docs serve --profiles-dir . --port 8080`
  - Inicia servidor local para visualizar documentação (ex.: http://localhost:8080).
- `uv run dbt generate --profiles-dir .`
  - Comando inexistente no `dbt` padrão (resultou em erro "No such command 'generate'").

## Edição/controle do projeto

- Edições de arquivos no repo (ex.: `dbt_project.yml`, `profiles.yml`, modelos)
  - Foram aplicadas com ferramentas de edição do workspace (ex.: `apply_patch` no ambiente).
- `git` (recomendado)
  - Use para versionar alterações: `git add .` / `git commit -m "..."` / `git push`.

## Dicas rápidas

- Sempre rode `uv run dbt <command> --profiles-dir .` para garantir o uso do ambiente correto.
- Mantenha `profiles.yml` em local seguro; não comite credenciais sensíveis em repositórios públicos.
- Para depurar problemas de permissão com Docker, verifique `/var/run/docker.sock` e se o usuário está no grupo `docker`.

---

Arquivo gerado em: 2026-08-13
