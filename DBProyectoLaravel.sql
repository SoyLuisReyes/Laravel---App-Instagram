CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
id              int(255) auto_increment not null,
role            varchar(20),
name            varchar(100),
surname         varchar(200),
nick            varchar(100),
email           varchar(255),
password        varchar(255),
image           varchar(255),
created_at      datetime,
updated_at      datetime,
remember_token  varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO users VALUES (NULL, 'user', 'Luis Rodolfo', 'Reyes', 'ReyesLuis', 'luisreyes@gmail.com', 'pass', NULL, CURTIME(), CURTIME(), NULL);
INSERT INTO users VALUES (NULL, 'user', 'Juan Lopez', 'Castro', 'JuanLopez', 'juan@gmail.com', 'pass', NULL, CURTIME(), CURTIME(), NULL);
INSERT INTO users VALUES (NULL, 'user', 'Harol Donal', 'Obando', 'DonalHarold', 'harold@gmail.com', 'pass', NULL, CURTIME(), CURTIME(), NULL);

CREATE TABLE IF NOT EXISTS images(
id              int(255) auto_increment not null,
user_id         int(255),
image_path      varchar(255),
description     text,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id ) REFERENCES users(id)
)ENGINE=InnoDb;

INSERT INTO images VALUES (NULL, 1, 'test.jpg', 'Descripcion para usuario 1', CURTIME(), CURTIME());
INSERT INTO images VALUES (NULL, 1, 'playa.jpg', 'Descripcion para usuario 2', CURTIME(), CURTIME());
INSERT INTO images VALUES (NULL, 1, 'arena.jpg', 'Descripcion para usuario 3', CURTIME(), CURTIME());
INSERT INTO images VALUES (NULL, 3, 'familia.jpg', 'Descripcion de prueba 4', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS comments(
id              int(255) auto_increment not null,
user_id         int(255),
image_id        int(255),
content         text,
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_user FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_image FOREIGN KEY (image_id) REFERENCES images(id)
)ENGINE=InnoDb;

INSERT INTO comments VALUES (NULL, 1, 4, 'Bonita foto familiar', CURTIME(), CURTIME() );
INSERT INTO comments VALUES (NULL, 2, 1, 'Bonita foto de playa', CURTIME(), CURTIME() );
INSERT INTO comments VALUES (NULL, 2, 4, 'Genial', CURTIME(), CURTIME() );

CREATE TABLE IF NOT EXISTS likes(
id              int(255) auto_increment not null,
user_id         int(255),
image_id        int(255),
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_user FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_image FOREIGN KEY (image_id) REFERENCES images(id)
)ENGINE=InnoDb;

INSERT INTO likes VALUES (NULL, 1, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES (NULL, 2, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES (NULL, 3, 1, CURTIME(), CURTIME());
INSERT INTO likes VALUES (NULL, 3, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES (NULL, 2, 1, CURTIME(), CURTIME());
