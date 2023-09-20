CREATE DATABASE  IF NOT EXISTS `shoppingmall` ;
USE `spring`;

CREATE TABLE `member` (
	`me_id`	varchar(15)	NOT NULL primary key,
	`me_pw`	varchar(20)	not NULL,
	`me_phone`	varchar(13)	not NULL,
	`me_addr`	varchar(50)	not NULL,
	`me_addr_detail`	varchar(50)	NULL,
	`me_post`	char(5)	not NULL,
	`me_point`	int	not NULL,
	`me_name`	varchar(20)	not NULL
);

CREATE TABLE `address` (
	`ad_num`	int	NOT NULL Primary key,
	`ad_name`	varchar(15)	not NULL,
	`ad_addr`	varchar(50)	not NULL,
	`ad_addr_detail`	varchar(50)	NULL,
	`ad_post`	char(5)	not NULL,
	`ad_me_id`	varchar(15)	NOT NULL
);

CREATE TABLE `product` (
	`pr_code`	char(6)	NOT NULL  PRIMARY key,
	`pr_name`	varchar(20)	not NULL,
	`pr_detail`	longtext	NULL,
	`pr_price`	int	not NULL
);

CREATE TABLE `option` (
	`op_num`	int	NOT NULL primary key,
	`op_name`	varchar(20)	not NULL,
	`op_amount`	int	not NULL,
	`op_pr_code`	char(6)	NOT NULL
);

CREATE TABLE `file` (
	`fl_num`	int	NOT NULL primary key,
	`fl_name`	varchar(50)	not NULL,
	`fl_pr_code`	char(6)	NOT NULL
);

CREATE TABLE `point` (
	`po_num`	int	NOT NULL primary key,
	`po_content`	varchar(30)	not NULL,
	`po_amount`	int	not NULL,
	`po_me_id`	varchar(15)	NOT NULL,
	`po_savedate`	date	 NULL,
	`po_usedate`	date	 NULL
);

CREATE TABLE `order_list` (
	`ol_num`	int	NOT NULL PRIMARY key,
	`ol_amount`	int	not NULL,
	`ol_price`	int	not NULL,
	`ol_or_num`	int	NOT NULL,
	`ol_op_num`	int	NOT NULL
);

CREATE TABLE `reivew` (
	`re_num`	int	NOT NULL primary key,
	`re_content`	longtext	NULL,
	`re_image`	varchar(50)	NULL,
	`re_me_id`	varchar(15)	NOT NULL,
	`re_op_num`	int	NOT NULL
);

CREATE TABLE `order` (
	`or_num`	int	NOT NULL primary key,
	`or_total`	int	NULL,
	`or_price`	int	NULL,
	`or_use_point`	int	NULL,
	`or_save_point`	int	NULL,
	`or_state`	varchar(10)	NULL,
	`or_ad_num`	int	NOT NULL,
	`or_me_id`	varchar(15)	NOT NULL
);

CREATE TABLE `administartor` (
	`ad_id`	varchar(15)	NOT NULL primary key,
	`ad_pw`	varchar(255)	not NULL,
	`ad_name`	varchar(10)	not NULL
);



ALTER TABLE `address` ADD CONSTRAINT `FK_member_TO_address_1` FOREIGN KEY (
	`ad_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `option` ADD CONSTRAINT `FK_product_TO_option_1` FOREIGN KEY (
	`op_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `file` ADD CONSTRAINT `FK_product_TO_file_1` FOREIGN KEY (
	`fl_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_member_TO_point_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `order_list` ADD CONSTRAINT `FK_order_TO_order_list_1` FOREIGN KEY (
	`ol_or_num`
)
REFERENCES `order` (
	`or_num`
);

ALTER TABLE `order_list` ADD CONSTRAINT `FK_option_TO_order_list_1` FOREIGN KEY (
	`ol_op_num`
)
REFERENCES `option` (
	`op_num`
);

ALTER TABLE `reivew` ADD CONSTRAINT `FK_member_TO_reivew_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `reivew` ADD CONSTRAINT `FK_option_TO_reivew_1` FOREIGN KEY (
	`re_op_num`
)
REFERENCES `option` (
	`op_num`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_address_TO_order_1` FOREIGN KEY (
	`or_ad_num`
)
REFERENCES `address` (
	`ad_num`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_member_TO_order_1` FOREIGN KEY (
	`or_me_id`
)
REFERENCES `member` (
	`me_id`
);

\