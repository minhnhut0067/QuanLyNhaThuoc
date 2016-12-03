DROP TABLE IF EXISTS public.dmphai;
CREATE TABLE dmphai
(
  id numeric(1,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  ten character varying(255) DEFAULT ''::character varying,
  stt serial,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT dmphai_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmphai
  OWNER TO msolution;

INSERT INTO dmphai(id,ten) VALUES (0,'Không xác định');  
INSERT INTO dmphai(id,ten) VALUES (1,'Nam');
INSERT INTO dmphai(id,ten) VALUES (2,'Nữ');  
UPDATE dmphai SET ma = 'PHA'||lpad(stt,4,'0');

DROP TABLE IF EXISTS dmphongban CASCADE;
CREATE TABLE dmphongban
(
  id numeric(5,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  stt serial,
  ten character varying(255) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),   
  CONSTRAINT dmphongban_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmphongban
  OWNER TO msolution;

insert into dmphongban(id, ma,ten,ghichu) values (10000, 'PHB0000','Không xác định','');
insert into dmphongban(id, ma,ten,ghichu) values (10001, 'PHB0001','Phòng HCNS','Phòng hành chính nhân sự');
insert into dmphongban(id, ma,ten,ghichu) values (10002, 'PHB0002','Phòng KHTH','Phòng kết hoạch tổng hợp');


DROP TABLE IF EXISTS nhanvien CASCADE;
CREATE TABLE nhanvien
(
  id character varying(15) NOT NULL,
  hoten character varying(255) NOT NULL,
  ngaysinh character varying(10) DEFAULT ''::character varying,
  namsinh character varying(4) DEFAULT ''::character varying,
  idphai numeric(1,0) DEFAULT 0, -- dmphai.id
  diachi character varying(255) DEFAULT '',
  sdt character varying(255) DEFAULT '0',
  email character varying(255) NOT NULL,
  idphongban numeric(5,0) DEFAULT 0,
  capbac character varying(255) DEFAULT '',
  mucluong character varying(255) DEFAULT '',
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  ngay timestamp without time zone default now(),	
  ngayud timestamp without time zone default now(),
  CONSTRAINT nhanvien_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE nhanvien
  OWNER TO msolution;
GRANT ALL ON TABLE nhanvien TO public;