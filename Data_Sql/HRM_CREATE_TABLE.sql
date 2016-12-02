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


insert into dmphongban(id, ma,ten,ghichu) values (10001, 'PHB0001','Phòng HCNS','Phòng hành chính nhân sự');
insert into dmphongban(id, ma,ten,ghichu) values (10002, 'PHB0002','Phòng KHTH','Phòng kết hoạch tổng hợp');