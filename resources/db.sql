CREATE TABLE user (
    id           INTEGER       NOT NULL PRIMARY KEY AUTOINCREMENT,
    username     VARCHAR (128) NOT NULL UNIQUE,
    nickname     VARCHAR (64)  NOT NULL,
    password     VARCHAR (128) NOT NULL,
    is_superuser BOOL          NOT NULL,
    created_at   DATETIME      NOT NULL,
    updated_at   DATETIME      NOT NULL
);

CREATE TABLE env_var (
    id         INTEGER       NOT NULL PRIMARY KEY AUTOINCREMENT,
    name       VARCHAR (50)  NOT NULL,
    value      VARCHAR (100) NOT NULL,
    [desc]     VARCHAR (200) NOT NULL,
    project_id INTEGER       NOT NULL,
    env_name   VARCHAR (20)  NOT NULL,
    created_at DATETIME      NOT NULL,
    updated_at DATETIME      NOT NULL,
);