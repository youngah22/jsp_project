INSERT INTO product VALUES('FD0884-025','(W) Nike Zoom Vomero 5 Photon Dust and Metallic Silver', 189000,'Photon Dust/Metallic Silver',
'Nike', '100', '23/02/28', 'FD0884-025.png');
INSERT INTO product VALUES('MR993GL','New Balance 993 Made in USA Grey', 259000,'Grey/White',
'New Balance',10, '18/08/21', 'MR993GL.png');
INSERT INTO product VALUES('B75806','Adidas Samba OG Cloud White', 139000,'Cloud White/Core',
'Adidas', 59, '18/01/01', 'B75806.png');

INSERT INTO product VALUES('MR993GL','New Balance 993 Made in USA', 259000,'Grey/White',
'New Balance',10, '18/08/21', 'MR993GL.png');


DELETE FROM product WHERE p_id = 'FD0884-025';
DELETE FROM product WHERE p_id = 'MR993GL';
DELETE FROM product WHERE p_id = 'B75806';