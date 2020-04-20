
-- USERS --
CREATE TABLE users (
    user_id SERIAL,
    username VARCHAR (15) UNIQUE NOT NULL,
    primary_email VARCHAR (80) UNIQUE NOT NULL,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,

    PRIMARY KEY (user_id),
);

-- USER EMAIL
CREATE TABLE user_emails (
    email text NOT NULL,
    user_id int NOT NULL
);

-- ORGANIZATIONS --
CREATE TABLE organizations (
    organization_id SERIAL,
    name VARCHAR (50) NOT NULL
    owner_id INT NOT NULL,

    FOREIGN KEY (owner_id) REFERENCES users(user_id),
    PRIMARY KEY (organization_id),
);

-- EVENTS --
CREATE TABLE events (
    event_id SERIAL,
    owner_id INT NOT NULL,
    organization_id INT,

    FOREIGN KEY (owner_id) REFERENCES users(user_id),
    FOREIGN KEY (organization_id) REFERENCES organizations(organization_id),
    PRIMARY KEY (event_id),
);

