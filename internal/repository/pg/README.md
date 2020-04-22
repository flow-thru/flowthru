## Dependencies
### Software
- [Docker](https://docs.docker.com/)

### Running the Database
**Note: All instructions assume you are in the `database` directory**

#### 1. Build the Docker Image
First, build the Postgres Flowthru image with Docker:  

```
docker build . -t postgres-flowthru-test-db
```

After running the build command, you should see the `postgres-flowthru-test-db` listed as an available image when running the command `docker images`.

#### 2. Create a mounting point for the Docker Container

Now create a directory to serve as the local host mount point for Postgres data files. This is done so data can persist even if you shut down and rerun the container.  

```
mkdir -p $HOME/docker/volumes/postgres
```

#### 3. Run the Docker Container

Run the Flowthru Database server in a container by running the following command:

```
docker run --rm -d --name test-db \
    -p 5432:5432 \
    -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data \
    postgres-flowthru-test-db
```

#### 4. Interfacing with the Database Docker Container

You can interface with the database with following command:

```
docker exec -it test-db psql -U user test
```

This will place you into an command-line instance with PostgreSQL.  

To view all tables inside the database, you can run the command `\d`. You can see a list of useful commands [at this website](http://postgresguide.com/utilities/psql.html)  

To exit the command line interface, you type <Ctrl>-D.

#### 5. Using Sample Data
To insert sample testing data using the following docker command:

```
docker container exec \
    -i test-db \
    psql -U user test < ${PWD}/sample-data.sql 
```

#### 6. Shutting down the Container
In some cases, you may find yourself wanting to shut down the container. This may include times where you want to wipe your persisted database data or no longer are using the database.  

You can shut down the container with the following command:

```
docker container stop test-db
```

If you wish to rerun the container, simply go through the instructions in Step 3

#### 7. Removing persisted data

If you wish to remove you persisted data, you want to first stop the conatiner as detailed in Step 6. Then delete and recreate the volume path you made in step 2:

```
rm -r $HOME/docker/volumes/postgres
mkdir -p $HOME/docker/volumes/postgres
```

#### 8. Rebuilding the container

This will come in handy in cases where someone pushes changes to the database, and you want to see the changes reflected on your Docker container. In this case, you want to preform Steps 6, 7, and run the following command to delete the Flowthru Docker Image:

```
docker rmi postgres-flowthru-test-db
```

