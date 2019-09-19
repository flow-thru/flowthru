## Dependencies
### Software
- [Docker](https://docs.docker.com/)
### Editors
These are not required, but recommended if you are unsure of what you are doing
- [pgAdmin 4](https://www.pgadmin.org/)

### Running the Database
First, build the Postgres Flowthru image with Docker:  

```
docker build . -t postgres-flowthru
```

Now create a directory to serve as the local host mount point for Postgres data files:  

```
mkdir -p $HOME/docker/volumes/postgres
```

Run the Flowthru Database local server in a container by running the following command:

```
docker run --rm -d --name flowthru-db \
    -p 5432:5432 \
    -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data \
    postgres-flowthru
```

To view the tables, launch pgAdmin, right click `Servers` > `Create` > `Server...`

Under General fill in the following:
* **`Name`**: flowthru

Under Connection, fill in the following:
* **`Host name/address`**: localhost
* **`Port`**: 5432
* **`Username`**: flowthru_user
* **`Password`**: flowthru

You can view the tables under `Servers` > `flowthru` > `Databases` > `flowthru_db` > `Schemas` > `public` > `Tables` on the sidebar.

