CREATE DATABASE invision;

CREATE TABLE gallery (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    description TEXT,
    url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE products (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC,
    image VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE webmaster (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(64) NOT NULL,
    password VARCHAR(64) NOT NULL,
    UNIQUE (username),
    PRIMARY KEY(id)
);

CREATE TABLE mail (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fname VARCHAR(25) NULL,
    lname VARCHAR(25) NULL,
    email VARCHAR(64) NOT NULL,
    phone NUMERIC NULL,
    subject VARCHAR(255) NULL,
    message TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE slider (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    image VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE customers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fname VARCHAR(25) NOT NULL,
    lname VARCHAR(25) NOT NULL,
    email VARCHAR(64) NOT NULL,
    phone NUMERIC NOT NULL,
    city VARCHAR(25) NOT NULL,
    company VARCHAR(64) NULL,
    address1 VARCHAR(255) NOT NULL,
    address2 VARCHAR(255) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cid INT UNSIGNED NOT NULL,
    completed BOOLEAN NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (cid) REFERENCES customers(id)
);

CREATE TABLE orderitem (
    oid INT UNSIGNED NOT NULL,
    pid INT UNSIGNED NOT NULL,
    quantity NUMERIC NOT NULL,
    price NUMERIC NOT NULL,
    total NUMERIC NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (oid, pid),
    FOREIGN KEY (oid) REFERENCES orders(id),
    FOREIGN KEY (pid) REFERENCES products(id)
);
