create database dmart;
use dmart;

create table category (
    category_id int auto_increment primary key,
    category_name varchar(100) not null
);

create table subcategory (
    subcategory_id int auto_increment primary key,
    category_id int,
    subcategory_name varchar(100) not null,
    foreign key (category_id) references category(category_id)
);

create table supplier (
    supplier_id int auto_increment primary key,
    supplier_name varchar(150) not null,
    contact_number varchar(20),
    email varchar(100),
    address text
);


create table product (
    product_id int auto_increment primary key,
    product_name varchar(200) not null,
    category_id int,
    subcategory_id int,
    supplier_id int,
    brand varchar(100),
    mrp decimal(10,2),
    selling_price decimal(10,2),
    unit varchar(20),
    foreign key (category_id) references category(category_id),
    foreign key (subcategory_id) references subcategory(subcategory_id),
    foreign key (supplier_id) references supplier(supplier_id)
);



create table store (
    store_id int auto_increment primary key,
    store_name varchar(200) not null,
    location varchar(200),
    city varchar(100),
    state varchar(100)
);

create table customer (
    customer_id int auto_increment primary key,
    customer_name varchar(150),
    phone varchar(20),
    email varchar(100),
    gender varchar(10),
    city varchar(100)
);


create table inventory (
    inventory_id int auto_increment primary key,
    product_id int,
    store_id int,
    quantity int not null,
    last_updated date,
    foreign key (product_id) references product(product_id),
    foreign key (store_id) references store(store_id)
);


create table sales (
    sales_id int auto_increment primary key,
    store_id int,
    customer_id int,
    sale_date datetime not null,
    total_amount decimal(10,2),
    discount_amount decimal(10,2),
    net_amount decimal(10,2),
    payment_method varchar(50),
    foreign key (store_id) references store(store_id),
    foreign key (customer_id) references customer(customer_id)
);


create table sales_details (
    sales_detail_id int auto_increment primary key,
    sales_id int,
    product_id int,
    quantity int not null,
    unit_price decimal(10,2),
    total_price decimal(10,2),
    foreign key (sales_id) references sales(sales_id),
    foreign key (product_id) references product(product_id)
);

create table offers (
    offer_id int auto_increment primary key,
    product_id int,
    offer_type varchar(50),
    discount_percentage decimal(5,2),
    start_date date,
    end_date date,
    foreign key (product_id) references product(product_id)
);


create table payment (
    payment_id int auto_increment primary key,
    sales_id int,
    amount_paid decimal(10,2),
    payment_mode varchar(50),
    transaction_date datetime,
    foreign key (sales_id) references sales(sales_id)
);

create table returns (
    return_id int auto_increment primary key,
    sales_id int,
    product_id int,
    quantity int,
    reason varchar(200),
    return_date date,
    foreign key (sales_id) references sales(sales_id),
    foreign key (product_id) references product(product_id)
);




