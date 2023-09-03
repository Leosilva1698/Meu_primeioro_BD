-- criação do banco de dados para o cenário e-comerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Mint char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    
    constraint unique_CPF_client unique (CPF)
);

alter table clients auto_increment = 1;
-- desc clients;

create table product(
	idProduct int auto_increment primary key,
	Pname varchar(10) not null,
    clasificatio_kids bool default false,
    category enum('Eletronico','Vestimenta','Brinquedos', 'Alimento','Moveis') not null,
	Addres varchar(30),
    Avaliação float default 0 ,
    Size varchar(10)    
);

alter table product auto_increment = 1;

create table payment(
    idPayment int primary key,
	typePayment enum('Boleto', 'Cartão', 'Dois Cartões', 'Pix'),
    limitAvailable float
);

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    shipingValue float default 10,
    idOrderPayment int,
    paymentCash bool default false,
    constraint fk_order_client foreign key (idOrderClient) references clients(idClient),
    constraint fk_order_payment foreign key (idOrderPayment) references payment(idPayment)
	on update cascade
);

alter table orders auto_increment = 1;

create table productStorage(
	idProducStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact varchar(11) not null,
    constraint unique_supplier unique(CNPJ)
);
alter table supplier auto_increment = 1;

create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstractName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(30),
    contact char(11) not null,
    constraint unique_CNPJ_Seller unique (CNPJ),
    constraint unique_CPF_Seller unique (CPF)
);
alter table seller auto_increment = 1;
	
create table productSeller(
	idPSeller int ,
    idPProduct int ,
    prodQauntity int default 1,
    primary key (idPSeller, idPProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPProduct) references product(idProduct)
);

create table productOrder(
	idPOProduct int,
    idPOorder int,
    poQauntity int default 1,
    poStatus enum('Disponivel', 'Sem Estoque') default 'Disponivel',
    primary key (idPOProduct, idPOorder),
    constraint fk_product_Order foreign key (idPOProduct) references product(idProduct),
    constraint fk_order_order foreign key (idPOorder) references orders(idOrder)
    );
    
    create table storageLocation(
		idLProduct int ,
        idLStorage int,
        location varchar(255) not null,
        primary key (idLProduct, idLStorage),
        constraint fk_product_Location foreign key (idLProduct) references product(idProduct),
		constraint fk_order_Location foreign key (idLStorage) references productStorage(idProducStorage)
	);
    
create table producSupplier(
	idPsSupplier int ,
	idPsProduct int,
	quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_Supplier_Supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_order_Suplier_product foreign key (idPsProduct) references product(idProduct)
);

show tables;


