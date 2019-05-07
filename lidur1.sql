create table nemendur
(
    nemandi int(11) not null auto_increment,
    fornafn varchar(20) not null,
    eftirnafn varchar(20) not null,
    faedingardagur date not null,
    constraint nemandi_PK primary key(nemandi)
);