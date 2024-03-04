CREATE TABLE product1(
    p_id VARCHAR2(30) NOT NULL,
    p_name VARCHAR2(50),
    p_unitPrice INTEGER,
    p_color VARCHAR2(50),
    p_manufacturer VARCHAR2(100),
    p_releaseDate DATE,
    PRIMARY KEY (p_id)
);


SELECT * FROM PRODUCT1;

drop TABLE product;