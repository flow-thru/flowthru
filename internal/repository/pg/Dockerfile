
FROM postgres:12.4

ENV POSTGRES_PASSWORD=password
ENV POSTGRES_USER=user

ADD scripts/init.sql /docker-entrypoint-initdb.d/
