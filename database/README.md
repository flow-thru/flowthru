## Dependencies
### Software
- [Docker](https://docs.docker.com/)
### Editors
These are not required, but recommended if you are unsure of what you are doing
- [pgAdmin 4](https://www.pgadmin.org/)

### Running the Database
First, build the Postgres Flowthru image with Docker:  

```
docker build . -t postgres-flowthru-test-db
```

Now create a directory to serve as the local host mount point for Postgres data files:  

```
mkdir -p $HOME/docker/volumes/postgres
```

Run the Flowthru Database local server in a container by running the following command:

```
docker run --rm -d --name test-db \
    -p 5432:5432 \
    -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data \
    postgres-flowthru-test-db
```

To view the tables, launch pgAdmin, right click `Servers` > `Create` > `Server...`

Under General fill in the following:
* **`Name`**: flowthru

Under Connection, fill in the following:
* **`Host name/address`**: localhost
* **`Port`**: 5432
* **`Username`**: user
* **`Password`**: password

You can view the tables under `Servers` > `flowthru` > `Databases` > `test` > `Schemas` > `public` > `Tables` on the sidebar.

