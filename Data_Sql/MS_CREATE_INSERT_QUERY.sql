-- select 'INSERT INTO dmphai(id,id_cha,idtt,idquan,idxa,idtuyen,idloai,idhang,idvung,ma,ten,diachi,dienthoai,fax,email,website,masothue,nganhang,giamdoc,phogiamdoc,quantri,ketoan,mabh) VALUES ('||id||','||id_cha||','''||matt||''','''||maquan||''','''||maxa||''','||matuyen||','||maloai||','||mahang||','||mavung||','''||ma||''','''||ten||''','''||diachi||''','''||dienthoai||''','''||fax||''','''||email||''','''||website||''','''||masothue||''','''||nganhang||''','''||giamdoc||''','''||phogiamdoc||''','''||quantri||''','''||ketoan||''','''||mabh||''');' from cm_data.tenvien order by MA


select 'INSERT INTO dmnguon(id,id_cha,ten) VALUES ('||id||','||id_cha||','''||ten||''');' from cm_data.cm_dmnguon order by MA


DROP TABLE IF EXISTS dmnguon;

CREATE TABLE dmnguon
(
  id numeric(2,0) NOT NULL DEFAULT 0,
  id_cha numeric(2,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  ten character varying(255) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  stt numeric(2,0) NOT NULL DEFAULT 0,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT dmnguon_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmnguon
  OWNER TO msolution;
COMMENT ON TABLE dmnguon
  IS 'danh muc nguon';

INSERT INTO dmnguon(id,id_cha,ten) VALUES (1,0,'BHYT');
INSERT INTO dmnguon(id,id_cha,ten) VALUES (2,0,'Sự nghiệp');
INSERT INTO dmnguon(id,id_cha,ten) VALUES (3,0,'Từ bệnh viện');
INSERT INTO dmnguon(id,id_cha,ten) VALUES (4,0,'Tự mua');
INSERT INTO dmnguon(id,id_cha,ten) VALUES (99,0,'Không xác định');

UPDATE dmnguon SET ma = 'NGU'||lpad(stt,4,'0');










