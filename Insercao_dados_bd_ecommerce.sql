use ecommerce;
show tables;

insert into clients(Fname, Mint, Lname, CPF, Address)
			values('Maria', 'M', 'Silva', 12346789, 'rua silva da prata 29, carangola - cidade das flores'),
				  ('Marheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, centro - cidade das flores'),
                  ('Ricardo', 'F', 'Silva', 456789123, 'avenida alameda vinha 1009, centro - cidade das flores'),
                  ('Julia', 'S', 'França', 789123456, 'rua laranjeiras 861, centro - cidade das flores'),
                  ('Roberta', 'G', 'Assis', 987456321, 'avenida koller 19, centro - cidade das flores'),
                  ('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28, centro - cidade das flores');

insert into product(Pname, clasificatio_kids, category, avaliação, size) values
						('Fone', false, 'Eletronico', '4', null),
                        ('Barbie', true, 'Brinquedos', '4', null),
                        ('Body', true, 'Vestimenta', '4', null),
                        ('Microfone', false, 'Eletronico', '4', null),
                        ('Sofá', false, 'Moveis', '4', null),
                        ('Farinha', false, 'Alimento', '4', null),
                        ('Fire Stick', false, 'Eletronico', '4', null);

insert into payment(idPayment, typePayment, limitAvailable) value
					(1, 'Boleto', null),
                    (2, 'Cartão', null),
                    (3, 'Dois Cartões', null),
                    (4, 'Pix', null);
delete from orders where idOrderClient in (1,2,3,4);
Insert into orders (idOrderClient, orderStatus, orderDescription, shipingValue, paymentCash) value
					(1, default, 'Compra via App', null, 1),
                    (2, default, 'Compra via App', 50, 0),
                    (3, 'Confirmado', null , null, 1),
                    (4, default, 'Compra via App', 150, 0);
select * from product; 
select * from orders; 
insert into productOrder (idPOProduct, idPOorder, poQauntity, poStatus) value
(8,5,2,null),
(9,6,1,null),
(10,7,1,null);

insert into productStorage(storageLocation, quantity) value
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasilia', 60);

select * from productStorage;

insert into storageLocation (idLProduct, idLStorage, location) values
(8,2,'RJ'),
(12,6,'GO');          

insert into supplier (SocialName, CNPJ, contact) value
('Almeida e filho', 12345678912,'12345621'),
('eletronico silva', 12345678911,'12345621'),
('Eletronico valma', 12345678913,'12345621');


insert into producSupplier(idPsSupplier,idPsProduct,quantity) value
(1,10,500),
(2,8,500),
(3,8,500),
(3,12,500),
(2,10,500),
(1,13,500);

insert into seller(socialName,abstractName,CNPJ,contact) value
('Vendedor 1', 'loja1', 12345678977, '12135'),
('Vendedor 2', 'loja2', 22345678977, '12135'),
('Vendedor 3', 'loja3', 32345678977, '12135'),
('Vendedor 4', 'loja4', 42345678977, '12135');

insert into productSeller(idPSeller,idPProduct,prodQauntity) value
(1,10,500),
(2,11,600);


select * from productSeller;

select count(*) from clients;

select * from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ', Lname) Nome, orderStatus staus from clients c, orders o where c.idClient = o.idOrderClient;