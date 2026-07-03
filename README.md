| Fichier | Rôle |
|---|---|
| `dbt_project.yml` | le projet : nom, dossier des modèles, matérialisation |
| `profiles.yml` | la connexion à la base (dbt le lit dans le dossier du projet) |
| `requirements.txt` | la dépendance à installer (`dbt-postgres`) |
| `models/sources.yml` | les tables de la base de collecte, à compléter |
| `models/exemple.sql` | un modèle témoin, à supprimer ensuite |

## Lancer

```bash
# environnement virtuel dédié
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt

# la connexion fonctionne ?
dbt debug          # attendu : "All checks passed"

# construire le modèle témoin
dbt run
```

## Commandes utiles: 

```bash
dbt deps

dbt test

# default on dev
dbt run --target prod
dbt run && dbt test

dbt docs generate
dbt docs serve

# generate_model_yaml
dbt run-operation generate_model_yaml --args '{"model_names": ["mart_etablissements_departement", "fait_etablissement", "dim_commune"]}'
```

