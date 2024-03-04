CREATE TABLE product(
    p_id VARCHAR2(30) NOT NULL,
    p_name VARCHAR2(500),
    p_unitPrice INTEGER,
    p_color VARCHAR2(200),
    p_manufacturer VARCHAR2(100),
    p_unitsInStock INTEGER,
    p_releaseDate VARCHAR2(50),
    p_fileName VARCHAR2(50),
    PRIMARY KEY (p_id)
);


drop TABLE product;