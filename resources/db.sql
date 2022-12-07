CREATE TABLE user (
    id           INTEGER       NOT NULL PRIMARY KEY AUTOINCREMENT,
    username     VARCHAR (128) NOT NULL UNIQUE,
    nickname     VARCHAR (64)  NOT NULL,
    password     VARCHAR (128) NOT NULL,
    is_superuser BOOL          NOT NULL,
    created_at   DATETIME      NOT NULL,
    updated_at   DATETIME      NOT NULL
);


CREATE TABLE project (
    id             INTEGER       NOT NULL
                                 PRIMARY KEY AUTOINCREMENT,
    created_at     DATETIME      NOT NULL,
    updated_at     DATETIME      NOT NULL,
    name           VARCHAR (100) NOT NULL
                                 UNIQUE,
    env_config     VARCHAR (100) NOT NULL,
    git_repository VARCHAR (100),
    git_branch     VARCHAR (100),
    last_sync_time DATETIME
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


CREATE TABLE fixture (
    id               INTEGER       NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    created_at       DATETIME      NOT NULL,
    updated_at       DATETIME      NOT NULL,
    name             VARCHAR (100) NOT NULL,
    [desc]           VARCHAR (500) NOT NULL,
    code             TEXT          NOT NULL,
    creator_nickname VARCHAR (64)  NOT NULL,
    project_id       INTEGER       NOT NULL
);


CREATE TABLE [case] (
    id               INTEGER       NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    created_at       DATETIME      NOT NULL,
    updated_at       DATETIME      NOT NULL,
    [desc]           VARCHAR (500) NOT NULL,
    code             TEXT          NOT NULL,
    creator_nickname VARCHAR (64)  NOT NULL,
    project_id       INTEGER       NOT NULL,
    filename         VARCHAR (200) NOT NULL,
    source           VARCHAR (10)  NOT NULL
);


CREATE TABLE case_result (
    id                INTEGER      NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    created_at        DATETIME     NOT NULL,
    updated_at        DATETIME     NOT NULL,
    case_id           INTEGER      NOT NULL,
    result            VARCHAR (50) NOT NULL,
    elapsed           VARCHAR (50) NOT NULL,
    output            TEXT         NOT NULL,
    run_env           VARCHAR (20) NOT NULL,
    run_user_nickname VARCHAR (64) NOT NULL,
    run_time          DATETIME     NOT NULL
);

CREATE TABLE [plan] (
    id           INTEGER      NOT NULL
                              PRIMARY KEY AUTOINCREMENT,
    name         VARCHAR (50) NOT NULL,
    project_id   INTEGER      NOT NULL,
    task_status  VARCHAR (1),
    task_crontab VARCHAR (20),
    task_run_env VARCHAR (20)
);


CREATE TABLE plan_case (
    id      INTEGER NOT NULL
                    PRIMARY KEY AUTOINCREMENT,
    plan_id INTEGER NOT NULL,
    case_id INTEGER NOT NULL
);


CREATE TABLE plan_result (
    id                INTEGER      NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    plan_id           INTEGER      NOT NULL,
    case_id           INTEGER      NOT NULL,
    result            VARCHAR (50) NOT NULL,
    elapsed           VARCHAR (50) NOT NULL,
    output            TEXT         NOT NULL,
    run_env           VARCHAR (20) NOT NULL,
    run_user_nickname VARCHAR (64) NOT NULL,
    run_time          DATETIME     NOT NULL
);

