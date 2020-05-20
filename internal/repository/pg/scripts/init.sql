
CREATE DATABASE test;
\c test

CREATE SCHEMA "user";
CREATE SCHEMA community;
CREATE SCHEMA "event";

-- USERS --
CREATE TABLE "user".users (
    user_id SERIAL,
    username VARCHAR (15) UNIQUE NOT NULL,

    PRIMARY KEY (user_id)
);


-- COMMUNITIES --
CREATE TABLE community.communities (
    community_id SERIAL,
    community_name VARCHAR (50) NOT NULL,
    owner_id INT NOT NULL,

    FOREIGN KEY (owner_id) REFERENCES "user".users(user_id),
    PRIMARY KEY (community_id)
);

-- EVENTS --
CREATE TABLE "event".events (
    event_id SERIAL,
    owner_id INT NOT NULL,
    community_id INT,

    FOREIGN KEY (owner_id) REFERENCES "user".users(user_id),
    FOREIGN KEY (community_id) REFERENCES community.communities(community_id),
    PRIMARY KEY (event_id)
);


CREATE USER user_manager WITH PASSWORD 'password';
CREATE USER event_manager WITH PASSWORD 'password';
CREATE USER community_manager WITH PASSWORD 'password';

GRANT CONNECT ON DATABASE test TO user_manager;
GRANT CONNECT ON DATABASE test TO event_manager;
GRANT CONNECT ON DATABASE test TO community_manager;


ALTER ROLE user_manager IN DATABASE test SET search_path = "user";
GRANT USAGE ON SCHEMA "user" TO user_manager;
GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA "user" TO user_manager;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA "user" to user_manager;

ALTER ROLE event_manager IN DATABASE test SET search_path = "event";
GRANT USAGE ON SCHEMA "event" TO event_manager;
GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA "event" TO event_manager;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA "event" to event_manager;

ALTER ROLE community_manager IN DATABASE test SET search_path = community;
GRANT USAGE ON SCHEMA community TO community_manager;
GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA community TO community_manager;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA community to community_manager;