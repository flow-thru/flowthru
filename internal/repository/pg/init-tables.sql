
-- USERS --
CREATE TABLE users (
    user_id SERIAL,
    username VARCHAR (15) UNIQUE NOT NULL,

    PRIMARY KEY (user_id)
);


-- COMMUNITIES --
CREATE TABLE communities (
    community_id SERIAL,
    community_name VARCHAR (50) NOT NULL,
    owner_id INT NOT NULL,

    FOREIGN KEY (owner_id) REFERENCES users(user_id),
    PRIMARY KEY (community_id)
);

-- EVENTS --
CREATE TABLE events (
    event_id SERIAL,
    owner_id INT NOT NULL,
    organization_id INT,

    FOREIGN KEY (owner_id) REFERENCES users(user_id),
    FOREIGN KEY (community_id) REFERENCES communities(community_id),
    PRIMARY KEY (event_id)
);

