USE master;
GO

DROP DATABASE IF EXISTS cp_fw;
go

CREATE DATABASE cp_fw;
GO

USE cp_fw;
GO

create table tbl_ms_fw(

	id int not null identity (1,1),
	PRIMARY KEY (id),
	
	fw_name varchar(30) ,
	fw_location varchar(30) ,
	fw_site varchar(30) ,
	fk_fw_pair int ,

	created_at datetime default GETDATE(),
	deleted_at datetime

);

CREATE TABLE tbl_ms_system_run_token(

	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	run_token varchar(30),
	run_type varchar(100),
	created_at datetime default GETDATE(),
	deleted_at datetime

);

create table tbl_fw_uptime_status(
	
	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	fw_current_time time,
	fw_days_uptime int ,
	fw_uptime time,
	fw_number_of_users int,
	fw_load_avg_1_min float,
	fw_load_avg_5_min float,
	fw_load_avg_15_min float,
	deleted_at datetime ,
	created_at datetime default GETDATE(),

);


create table tbl_fw_diskspace (
	
	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	fw_filesystem varchar(40)null,
	fw_mounted_on varchar (20)null,
	fw_total int null,
	fw_available int null,
	fw_used int null,
	fw_used_percentage int null,
	deteled_at datetime,
	created_at datetime default GETDATE(),
	
);

create table tbl_fw_memory (

	id INT NOT NULL  IDENTITY(1,1),
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	mem_type varchar (30),
	mem_total int,
	mem_used int,
	mem_free int,
	mem_shared int,
	mem_cache int,
	mem_available int,
	deleted_at datetime,
	created_at datetime default GETDATE(),
);

create table tbl_fw_CPU (

	id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY (id),
    FK_ms_fw INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_fw(id),
	FK_ms_system_run_token INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_system_run_token(id),
	fw_cpu_user_time_percentage int,
	fw_cpu_system_time_percentage int,
	fw_cpu_idle_time_percentage int,
	fw_cpu_usage_percentage int,
	fw_cpu_queue_length int,
	fw_cpu_interrupt_per_sec int,
	fw_cpu_number int,
	deteled_at datetime,
	created_at datetime default GETDATE(),

)

create table tbl_fw_license (

	id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY (id),
    FK_ms_fw INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_fw(id),
	FK_ms_system_run_token INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_system_run_token(id),
	fw_license_host varchar(30),
	fw_license_expiration varchar(30),
	fw_license_feature varchar (30),
	deleted_at datetime,
	created_at datetime default GETDATE(),

)

create table tbl_fw_contract(

	id INT NOT NULL IDENTITY(1,1),
    PRIMARY KEY (id),
    FK_ms_fw INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_fw(id),
	FK_ms_system_run_token INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_system_run_token(id),
	fw_contract_id varchar(30),
	fw_contract_expiration varchar(30),
	fw_contract_sku varchar (30),
	deleted_at datetime,
	created_at datetime default GETDATE(),

)

create table tbl_current_status (

	id INT NOT NULL IDENTITY(1,1),
	PRIMARY KEY (id),
	FK_ms_fw INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_fw(id),
    FK_ms_system_run_token INT NOT NULL FOREIGN KEY REFERENCES tbl_ms_system_run_token(id),
	uptime varchar (20),
	fwtmp int,
	varloglog int,
	ram float,
	swap float,
	memory_error float,
	cpu int,
	rx_error_total int,
	tx_error_total int,
	sync_mode varchar(30),
    sync_state varchar(30),
	license_expiration_status varchar (20),
	raid_state varchar(30),
	hotfix_module varchar(30),

)


create table tbl_fw_raid(
	
	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	raid_volume_id int,
	raid_level varchar(40),
	raid_number_of_disks int,
	raid_size varchar(40),
	raid_state varchar(40),
	raid_flag varchar(40),
	deleted_at datetime,
	created_at datetime default GETDATE(),

);

create table tbl_fw_rxtx(

	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	interface VARCHAR(50) NOT NULL,
    hwaddr VARCHAR(17) NOT NULL,
    inet_addr VARCHAR(15),
    bcast VARCHAR(15),
    mask VARCHAR(15),
    mtu INT,
    metric INT,
    rx_packets BIGINT,
    rx_errors BIGINT,
    rx_dropped BIGINT,
    rx_overruns BIGINT,
    rx_frame BIGINT,
    tx_packets BIGINT,
    tx_errors BIGINT,
    tx_dropped BIGINT,
    tx_overruns BIGINT,
    tx_carrier BIGINT,
    collisions BIGINT,
    txqueuelen BIGINT,
    rx_bytes BIGINT,
    rx_human_readable VARCHAR(20),
    tx_bytes BIGINT,
    tx_human_readable VARCHAR(20),
	deleted_at datetime,
	created_at datetime default getdate(),

)

create table tbl_fw_license_status(
	
	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	licenses_host varchar(30),
	licenses_expiration varchar(30),
	licenses_status varchar(max),
	deleted_at datetime,
	created_at datetime default GETDATE(),

);


create table tbl_fw_hotfix(
	id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
	fw_kernel varchar(30),
	fw_build_number varchar(30),
	deleted_at datetime,
	created_at datetime default GETDATE(),
)


CREATE TABLE tbl_fw_failed_memory(
    id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
    
    fw_total_memory int,
    fw_peak_memory int,
    fw_total_alloc int,
    fw_failed_alloc int,
    fw_total_free int,
    fw_failed_free int,

    deleted_at datetime ,
	created_at datetime default GETDATE(),
);

CREATE TABLE tbl_fw_capacity_optimisation(
    id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
    
    fw_hostname varchar(30),
    fw_names varchar(30),
    fw_id int,
    fw_vals int,
    fw_peaks int,
    fw_slinks int,
    fw_limit VARCHAR (30),

    deleted_at datetime ,
	created_at datetime default GETDATE(),
);

CREATE TABLE tbl_fw_clusterxl(
    id INT NOT NULL  IDENTITY(1,1) ,
	PRIMARY KEY (id),
	FK_ms_fw int not null foreign key references tbl_ms_fw(id),
	FK_ms_system_run_token int not null foreign key references tbl_ms_system_run_token(id),
    
    fw_sync_mode varchar(30),
    fw_ip_address varchar(30),
    fw_load VARCHAR (30),
    fw_state varchar(30),
    fw_name VARCHAR (30),

    deleted_at datetime ,
	created_at datetime default GETDATE(),
);

insert into tbl_ms_system_run_token(run_token,run_type) values('curent status','curent status')