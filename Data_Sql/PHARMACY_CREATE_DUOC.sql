DROP TABLE IF EXISTS dmnhomkho CASCADE;
CREATE TABLE dmnhomkho
(
  id numeric(4,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  stt numeric(4,0) NOT NULL DEFAULT 0,
  ten character varying(255) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(15,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),  
  CONSTRAINT dmnhomkho_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmnhomkho
  OWNER TO msolution;
COMMENT ON TABLE dmnhomkho
  IS 'danh muc nhom kho: phan nhom kho theo tieu chi';
  
insert into dmnhomkho(id,stt,ten) values (0,(select count(*) + 1 from dmnhomkho),'Không xác định');
insert into dmnhomkho(id,stt,ten) values (1,(select count(*) + 1 from dmnhomkho),'Thuốc');
insert into dmnhomkho(id,stt,ten) values (3,(select count(*) + 1 from dmnhomkho),'Trang thiết bị');
insert into dmnhomkho(id,stt,ten) values (4,(select count(*) + 1 from dmnhomkho),'Nhà thuốc');
insert into dmnhomkho(id,stt,ten) values (5,(select count(*) + 1 from dmnhomkho),'Nhóm tủ trực');
insert into dmnhomkho(id,stt,ten) values (2,(select count(*) + 1 from dmnhomkho),'Vật tu tiêu hao');
UPDATE dmnhomkho set ma = 'NKH'||lpad(to_char(stt),4,'0');
  
-- DROP TABLE dmkho;

DROP TABLE IF EXISTS dmkho CASCADE;
CREATE TABLE dmkho
(
  id numeric(14,0) NOT NULL DEFAULT 0,
  id_nhomkho numeric(4,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  stt numeric(14,0) DEFAULT 0,
  ten character varying(255) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  ghichu_en character varying(255) DEFAULT ''::character varying,  
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(15,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),   
  CONSTRAINT dmkho_pkey PRIMARY KEY (id),
  CONSTRAINT dmnhomkho_idquan_fkey FOREIGN KEY (id_nhomkho)
  REFERENCES dmnhomkho (id) MATCH SIMPLE
  ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmkho
  OWNER TO msolution;
COMMENT ON COLUMN dmkho.id_nhomkho IS 'id nhomkho: dmnhomkho.id';  


insert into dmkho(id,id_nhomkho,stt,ten,ghichu) values (1,1,(select count(*) + 1 from dmkho),'Kho chính','Kho nhập thuốc mua vào');
insert into dmkho(id,id_nhomkho,stt,ten,ghichu) values (2,1,(select count(*) + 1 from dmkho),'Kho cấp phát','Kho nhập cấp phát');
UPDATE dmkho set ma = 'KHO'||lpad(to_char(stt),4,'0');

DROP TABLE IF EXISTS dmnhomduoc CASCADE;
CREATE TABLE dmnhomduoc
(
  id numeric(6,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  stt numeric(6,0) NOT NULL DEFAULT 0,
  ten character varying(255) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,  
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(15,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),   
  CONSTRAINT pk_dmnhomduoc PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmnhomduoc
  OWNER TO msolution;

INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50001,(select count(*) + 1 from dmnhomduoc),'Bao cao su');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50002,(select count(*) + 1 from dmnhomduoc),'Đông Dược');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50003,(select count(*) + 1 from dmnhomduoc),'Dụng cụ Y tế');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50004,(select count(*) + 1 from dmnhomduoc),'Mỹ Phẩm');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50005,(select count(*) + 1 from dmnhomduoc),'Sản phẩm Y tế');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50006,(select count(*) + 1 from dmnhomduoc),'Thực phẩm bổ sung');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50007,(select count(*) + 1 from dmnhomduoc),'Thực phẩm chức năng');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50008,(select count(*) + 1 from dmnhomduoc),'Thuốc Thường');
INSERT INTO dmnhomduoc(id,stt,ten) VALUES(50009,(select count(*) + 1 from dmnhomduoc),'Vật tư y tế');

UPDATE dmnhomduoc set ma = 'NHD'||lpad(to_char(stt),4,'0');


DROP TABLE IF EXISTS dmloaiduoc CASCADE;
CREATE TABLE dmloaiduoc
(
  id numeric(6,0) NOT NULL DEFAULT 0,
  id_nhom numeric(6,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  stt numeric(6,0) NOT NULL DEFAULT 0,
  ten character varying(255) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,  
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(15,0) DEFAULT 0,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),  
  CONSTRAINT pk_dmloaiduoc PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dmloaiduoc
  OWNER TO msolution;

-- Insert loai
  
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50051,50001,(select count(*) + 1 from dmloaiduoc),'Bao cao su');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50052,50002,(select count(*) + 1 from dmloaiduoc),'Các loại Cao dùng ngoài');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50053,50002,(select count(*) + 1 from dmloaiduoc),'Các loại Dầu dùng ngoài');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50054,50002,(select count(*) + 1 from dmloaiduoc),'Các loại Dầu gội đầu trị gàu, đen tóc');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50055,50002,(select count(*) + 1 from dmloaiduoc),'Dịch truyền bổ sung');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50056,50003,(select count(*) + 1 from dmloaiduoc),'Dụng cụ Y tế');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50057,50004,(select count(*) + 1 from dmloaiduoc),'Dung dịch súc miệng');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50058,50004,(select count(*) + 1 from dmloaiduoc),'Dung dịch vệ sinh em bé');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50059,50005,(select count(*) + 1 from dmloaiduoc),'Dung dịch vệ sinh em bé');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50060,50005,(select count(*) + 1 from dmloaiduoc),'Dung dịch vệ sinh phụ nữ');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50061,50005,(select count(*) + 1 from dmloaiduoc),'Kẹo ngậm ho, viêm họng');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50062,50005,(select count(*) + 1 from dmloaiduoc),'Khác');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50063,50006,(select count(*) + 1 from dmloaiduoc),'Khác');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50064,50007,(select count(*) + 1 from dmloaiduoc),'Khác');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50065,50007,(select count(*) + 1 from dmloaiduoc),'Mỹ Phẩm');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50066,50007,(select count(*) + 1 from dmloaiduoc),'Sản phẩm Y tế');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50067,50007,(select count(*) + 1 from dmloaiduoc),'Thực phẩm bổ sung');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50068,50008,(select count(*) + 1 from dmloaiduoc),'Thực phẩm bổ sung');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50069,50008,(select count(*) + 1 from dmloaiduoc),'Thực phẩm chức năng');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50070,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc bổ mắt');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50071,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc bổ sung calci');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50072,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc bổ, vitamin');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50073,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc cầm máu');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50074,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc chống đông máu');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50075,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc có tác dụng an thần');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50076,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc Corticoid');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50077,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc da liễu');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50078,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị cơ xương khớp');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50079,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị đau thắt ngực');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50080,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị giãn tĩnh mạch, chống phù nề');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50081,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị gút');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50082,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị lipid máu');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50083,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị sỏi thận, sỏi mật');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50084,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị tiểu đường');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50085,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị trầm cảm');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50086,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc điều trị trĩ');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50087,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc dùng ngoài');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50088,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc gây tê - gây mê');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50089,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc giảm Cholesterol, Triglycerid');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50090,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc giảm đau đường tiêu hóa');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50091,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc giảm đau, giãn cơ');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50092,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc giảm đau, kháng viêm NSAID');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50093,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc hạ nhiệt, giảm đau, kháng viêm');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50094,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng acetyl cholin');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50095,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng histamin, chống dị ứng');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50096,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng nấm');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50097,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng sinh');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50098,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng viêm Steroid');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50099,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kháng virus');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50100,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc kích thích giao cảm');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50101,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc lợi tiểu');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50102,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc nhỏ mắt, nhỏ mũi, nhỏ tai');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50103,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc nhuận gan, lợi mật');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50104,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc nội tiết tố');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50105,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc tác dụng trên đường hô hấp');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50106,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc tác dụng trên đường tiêu hóa');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50107,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc tăng tuần hoàn não');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50108,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc thần kinh');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50109,50008,(select count(*) + 1 from dmloaiduoc),'Thuốc tim mạch, huyết áp');
INSERT INTO dmloaiduoc(id,id_nhom,stt,ten) VALUES(50110,50009,(select count(*) + 1 from dmloaiduoc),'Vật tư Y tế');

UPDATE dmloaiduoc set ma = 'LDU'||lpad(to_char(stt),4,'0');
  
DROP TABLE IF EXISTS dmduoc CASCADE;
CREATE TABLE dmduoc
(
  id numeric(10,0) NOT NULL DEFAULT 0,
  idloaiduoc numeric(10,0) NOT NULL DEFAULT 0,
  stt numeric(10,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  ten character varying(300) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,
  dang character varying(1000) DEFAULT ''::character varying,
  dang_en character varying(255) DEFAULT ''::character varying,
  hamluong character varying(300) DEFAULT ''::character varying,
  hamluong_en character varying(50) DEFAULT ''::character varying,
  donvidg character varying(255) DEFAULT ''::character varying,
  donvidg_en character varying(255) DEFAULT ''::character varying,
  donvisd character varying(255) DEFAULT ''::character varying,
  donvisd_en character varying(255) DEFAULT ''::character varying,
  duongdung_en character varying(255) DEFAULT ''::character varying,
  hoatchat character varying(1000) DEFAULT ''::character varying,
  hoatchat_en character varying(1000) DEFAULT ''::character varying,
  thanhphan character varying(2000) DEFAULT ''::character varying,
  thanhphan_en character varying(2000) DEFAULT ''::character varying,
  tyle1 character varying(50) DEFAULT ''::character varying,
  tyle2 character varying(50) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,  
  atc character varying(255) DEFAULT ''::character varying,  
  donggoi character varying(300),    
  route character varying(10),
  generic character varying(1000),
  idduongdung numeric(5,0) DEFAULT 1000,  
  idhangsx numeric(10,0) DEFAULT 0,
  idquocgia numeric(3,0) DEFAULT 0,
  userid numeric(15,0) DEFAULT 0,
  stt_40 character varying(20),
  sodk character varying(100) DEFAULT ''::character varying,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),
  -- tenhangsx character varying(500) DEFAULT ''::character varying,
  -- tenquocgia character varying(500) DEFAULT ''::character varying,
  CONSTRAINT pk_dmduoc PRIMARY KEY (id),
  CONSTRAINT dmduoc_idloaiduoc_fkey FOREIGN KEY (idloaiduoc)
  REFERENCES dmloaiduoc (id) MATCH SIMPLE  ON UPDATE RESTRICT ON DELETE RESTRICT  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmduoc
  OWNER TO msolution;
COMMENT ON TABLE dmduoc
  IS 'danh muc biet duoc';
COMMENT ON COLUMN dmduoc.id IS 'id bat dau bang so 1';
COMMENT ON COLUMN dmduoc.idloaiduoc IS 'id nhom thuoc:=dmloaiduoc.id';
COMMENT ON COLUMN dmduoc.idhangsx IS 'id hang sx:=dmhangsx.id';
COMMENT ON COLUMN dmduoc.idduongdung IS 'id duong dung:=dmduongdung.id';


INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4393,550,'ABR001','Abrocto Syrup 60ml','1','','Chai','Ambroxol','',1001,50087,835,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4350,507,'ACE009','Acehasan 200mg, H/100','100','','Viên','Acetylcystein','',1001,50087,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4370,527,'ACE010','Acemuc 100mg, H/30g','30','','Gói','Acetylcystein','',1001,50087,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4371,528,'ACE011','Acemuc 200mg, H/30g','30','','Gói','Acetylcystein','',1001,50087,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4343,500,'ACE001','Acetazolamide 250mg, H/100','100','','Viên','Acetazolamid','',1001,50087,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4349,506,'ACE008','Acetylcystein 200mg, H/100','100','','Viên','Acetylcystein','',1001,50087,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3396,142,'ACT002','Actapulgic 3g H/30','30','','Gói','Attapulgite mormoiron','',1001,50087,769,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3397,143,'ACT003','Acticarbine, H/84','84','','Viên','Papaverin + than hoạt tính','',1001,50087,881,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4707,848,'ADA002','Adalat 10mg, H/30','30','','Viên','Nifedipin','VN-14010-10',1001,50087,1079,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3356,119,'ADR006','Adrenalin 1mg/1ml, H/10A','10','','Ống','Adrenalin','',1015,50068,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4033,191,'ADR005','Adrenoxyl 10mg, H/64','64','','Viên','Carbazochrom','',1001,50087,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5220,1198,'AES001','Aescin 20mg, H/30','30','','Viên','Aesin','VN-14033-11',1001,50087,1161,170);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5255,1228,'AIK001','Aikido, H/3','3','','Miếng','','',1025,50073,1168,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3398,144,'AIR004','AIR-X, H/100','100','','Viên','Simethicon','',1001,50087,882,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5085,1135,'AJU001','Aju Akinol 10mg, H/30','1','','Hộp','Isotretinoin','VD-19212-13',1001,50087,991,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3300,66,'ALA001','Alaxan, H/100','100','','Viên','Paracetamol + Ibuprofen','VD-11370-10',1001,50087,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5271,1236,'ALL010','Allerfar 4mg Caplet, H/200v','200','','Viên','Chlopheniramin','',1001,50087,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3301,67,'ALL005','Allopurinol 300mg, H/20','20','','Viên','Allopurinol','VD-13112-10',1001,50087,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4182,340,'ALL008','Allopurinol 300mg, H/30','30','','Viên','Allopurinol','',1001,50087,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4181,339,'ALL007','Allopurinol 300mg, L/100','100','','Viên','Allopurinol','',1001,50087,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4183,341,'ALL009','Allopurinol Stada 300mg, H/30','30','','Viên','Allopurinol','',1001,50087,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3302,68,'ALP006','Alpha CHOAY 21microkatals, H/20','20','','Viên','Alpha chymotrypsin','',1002,50084,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4410,567,'ALP012','Alpha chymotrypsin 21microkatals, H/20','20','','Viên','Alphachymotrypsin','',1001,50087,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3303,69,'ALP007','Alphachymotrypsin 2100USP, H/1000','1000','','Viên','Alpha chymotrypsin','VD-11355-10',1002,50064,962,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4008,166,'ALP011','Alphachymotrypsin 5000IU, H/3A','3','','Lọ','Alphachymotrypsin','',1015,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4879,1014,'ALV005','Alvesin 40 250ml','1','','Chai','','',1019,50068,825,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4878,1013,'ALV004','Alvesin 5E 250ml','1','','Chai','','',1019,50068,825,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5239,1212,'AMA003','Amaryl 2mg, H/30','30','','Viên','Glimepirid','',1001,50087,944,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5055,1128,'AMB006','Ambroco Syrup 30ml','1','','Chai','Ambroxol','',1001,50087,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4392,549,'AMB004','Ambroco Syrup 60ml','1','','Chai','Ambroxol','',1001,50087,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4363,520,'AMB003','Ambron 30mg, H/100','100','','Viên','Ambroxol','',1001,50087,803,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4927,1054,'AMB005','Ambroxol 30mg, H/100','100','','Viên','Ambroxol','VD-9891-09',1001,50087,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3304,70,'AME001','Amedred 16mg, H/30','30','','Viên','Methyl prednisolon','',1001,50087,745,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4518,659,'AME002','Ameflu +, H/100','100','','Viên','Paracetamol + Guaifenesin + Phenylephrine + Dextromethorpan + Vitamin C','VD-16959-12',1001,50087,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5226,1204,'AME003','AmePrazol 40mg, H/14','14','','Viên','Esomeprazol','VD-16254-12',1001,50087,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4011,169,'AMI009','Amikacin 500mg, H/1','1','','Lọ','Amikacin','',1015,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4933,1060,'AMI011','Amitriptylin 25mg, L/100','100','','Viên','Amitriptylin','VD-17829-12',1001,50087,828,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4919,1053,'AMI010','Amitriptylin 25mg, L/100','100','','Viên','Amitriptylin','',1001,50087,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4315,472,'AML004','Amlodipin 5mg, H/30','30','','Viên','Amlodipin','',1001,50087,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4313,470,'AMN002','Amnorpin 5mg, H/30','30','','Viên','Amlodipin','',1001,50087,804,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3184,4,'AMO007','Amoxicillin 250mg, H/100','100','','Viên','Amoxicillin','',1001,50087,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3185,5,'AMO008','Amoxicillin 500mg, H/100','100','','Viên','Amoxicillin','',1001,50088,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4622,763,'AMP011','Ampelop 625mg, H/90','90','','Viên','Cao chè dây','VD-13229-10',1001,50089,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4222,380,'AMP008','Ampha 3B, H/100','100','','Viên','Vitamin B1 + B6 + B12','',1001,50090,967,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4223,381,'AMP009','Ampha BC Complex H/100','100','','Viên','','',1001,50090,967,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4224,382,'AMP010','Ampha E-400, H/90','90','','Viên','Vitamin E','',1001,50091,967,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5123,1148,'AMP012','Ampicilin 500mg, H/100 - Vidipha','100','','Viên','Ampicillin','VD-20473-14',1001,50091,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3186,6,'AMP007','Ampicillin 500mg, H/100','100','','Viên','Ampicillin','',1001,50091,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4706,847,'AMT001','Amtim 5mg, H/30','30','','Viên','Amlodipin','VD-13757-11',1001,50091,967,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4668,809,'ANB001','An Bảo 12ml','1','','Tuýp','','01/2010/CBMP-NĐ',1022,50061,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4649,790,'ANT009','An Trĩ Vương, H/30','1','','Hộp','','18653/2014/ATTP-XNCB',1001,50064,1181,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5086,1136,'ANG004','Angela Gold, H/60','1','','Hộp','','19077/2015/ATTP-XNCB',1001,50064,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4076,234,'ANG003','Angela, H/60','1','','Hộp','','',1001,50064,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4794,935,'ANK004','Anka Gold Grow step 1 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5024,1109,'ANK009','Anka Gold Grow step 1 900g','1','','Lon','','26136/2014/ATTP-XNCB',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4795,936,'ANK005','Anka Gold Grow step 2 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5025,1110,'ANK010','Anka Gold Grow step 2 900g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4796,937,'ANK006','Anka Gold Grow step 3 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4791,932,'ANK001','Anka Gold IQ step 1 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4799,940,'ANK007','Anka Gold IQ step 1 900g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4792,933,'ANK002','Anka Gold IQ step 2 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5023,1108,'ANK008','Anka Gold IQ step 2 900g','1','','Lon','','26138/2014/ATTP-XNCB',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4793,934,'ANK003','Anka Gold IQ step 3 400g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4790,931,'ANK011','Anka Gold IQ step 3 900g','1','','Lon','','',1001,50063,1090,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3305,71,'ANT006','Antalgine 75mg/3ml, H/10A','10','','Ống','Diclofenac','',1015,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4610,751,'ANT008','Antibio Pro 1g, H/100','100','','Gói','','14485/2013/ATTP-XNCB',1001,50064,1068,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4316,473,'API001','Apitim 5mg, H/30','30','','Viên','Amlodipin','',1001,50091,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4237,395,'AQU001','Aquadetrim D3 10ml - Meda','1','','Chai','Vitamin D3','',1001,50091,842,170);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4238,396,'AQU002','Aquadetrim D3 10ml - PĐ','1','','Chai','Vitamin D3','',1001,50091,970,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4298,455,'ARC001','Arcalion 200mg, L/30','30','','Viên','Sulbutiamin','',1001,50091,1006,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4429,586,'ARC002','Arcoxia 90mg, H/30','30','','Viên','Etoricoxib','VN-15092-12',1001,50091,1016,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5247,1220,'ARG003','Argyrol 1%, 5ml','1','','Lọ','Argyrol','',1042,50072,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4928,1055,'ARM001','Armefixime 100mg, H/20','20','','Viên','Cefixim','VD-10874-10',1001,50092,1018,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4430,587,'ASP009','Aspamic 35mg, H/100','100','','Gói','Aspartam','VD-15546-11',1001,50092,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4172,330,'ASP011','Aspirin 81mg, H/100','100','','Viên','Acetylsalicylic acid','',1001,50092,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4176,334,'ASP012','Aspirin pH8 500mg, H/200','200','','Viên','Acetylsalicylic acid','',1001,50092,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4367,524,'ATA003','Atarax 25mg, H/30','30','','Viên','Hydroxyzine hydrochloride','',1001,50092,765,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4704,845,'ATA005','Atasart-H 28,5mg, H/28','28','','Viên','Candesartan + Hydroclorothiazid','VN-16760-13',1001,50092,805,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4703,844,'ATA004','Atasart 16mg, H/28','28','','Viên','Candesartan','VN-13703-11',1001,50092,805,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5206,1191,'ATA006','Atasic 200mg, H/30','30','','Viên','Cefixim','VD-18938-13',1001,50092,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4309,466,'ATE002','Atenolol STADA 50mg, H/100','100','','Viên','Atenolol','',1001,50092,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4480,627,'ATI001','Aticef 500mg, H/14','14','','Viên','Cefadroxil','VD-21212-14',1001,50092,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4700,841,'ATO003','Atorvastatin 20mg, H/20','20','','Viên','Atorvastatin','VD-9716-09',1001,50092,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3399,145,'ATR008','Atropin sulfat 0,25mg/ml, H/100A','100','','Ống','Atropin (sulfat)','',1015,50068,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4390,547,'ATU001','Atussin Sirup 30ml','1','','Chai','Dextromethorpan + Chlorpheniramin + Sodium Citrate Dihydrate + Glyceryl','',1001,50092,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4391,548,'ATU002','Atussin Sirup 60ml','1','','Chai','Dextromethorpan + Chlorpheniramin + Sodium Citrate Dihydrate + Glyceryl','',1001,50092,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4293,450,'AUC002','Auclannityl 625mg, H/20','20','','Viên','Amoxycillin + Clavulanic acid','',1001,50092,728,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5329,1269,'AUG008','Augbidil 1g, H/14','14','','Viên','Amoxyllin + Clavulanic acid','VD-14676-11',1001,50092,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4203,361,'AUG006','Augmentin 1g, H/14','14','','Viên','Amoxicillin + Acid Clavulanic','',1001,50092,765,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4201,359,'AUG004','Augmentin 281.25mg, H/12','12','','Gói','Amoxicillin + Acid Clavulanic','',1001,50092,765,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4202,360,'AUG005','Augmentin 625mg, H/14','14','','Viên','Amoxicillin + Acid Clavulanic','',1001,50092,765,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3189,9,'AXO001','Axodrox-250, H/100','100','','Viên','Cefadroxil','',1001,50092,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4291,448,'AXO002','Axotini 500mg, H/100','100','','Viên','Tinidazol','',1001,50092,1008,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3252,19,'AZI002','Azicine STADA 250mg, H/6','6','','Viên','Azithromycin','',1001,50092,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3294,60,'AZI003','Azithromycin 100mg, H/24g','24','','Gói','Azithromycin','',1001,50092,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3295,61,'AZI004','Azithromycin 200mg, H/24g','24','','Gói','Azithromycin','',1001,50092,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3296,62,'AZI005','Azithromycin 250mg, H/60','60','','Viên','Azithromycin','',1001,50092,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4655,796,'B-G002','B-Gargin, L/30','1','','Lọ','','',1001,50064,1076,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4654,795,'B-G001','B-Gargin, L/60','1','','Lọ','','26406/2013/ATTP-XNCB',1001,50065,1076,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5035,1119,'BAB001','Baby khổ qua 100ml','1','','Chai','','054/14/CBMP-CT',1022,50057,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5064,1131,'BAB002','Babycanyl Expectorant syrup 60ml','1','','Chai','Terbutalin + Guaifenesin','VD-18278-13',1001,50092,936,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4428,585,'BAC021','Bạch Hổ hoạt lạc cao 20g, HL/12','12','','Chai','','',1022,50061,1031,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4396,553,'BAC020','Bạch Ngân PV Syrup 100ml','1','','Chai','','',1001,50092,827,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4537,678,'BAI004','Bài thạch H/45','1','','Lọ','Kim tiền thảo + thảo dược','VD-19811-13',1001,50092,828,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3400,146,'BAI003','Bailuzym-Zn 2g, H/30','30','','Gói','Lactobacillus acidophilus + Zn','',1001,50092,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4374,531,'BAM001','Bambec 10mg, H/30','30','','Viên','Bambuterol Hydroclorid','',1001,50092,779,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4785,926,'BAN020','Băng cuộn Y tế 1m8 x 0.085m, Túi/10B','10','','Túi','','GPKD-3602222238',1025,50110,1020,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5170,1161,'BAN026','Băng gạc cuộn Bảo Thạch 0,09*2,5m, G/10 bịch','10','','Bịch','','',1025,50110,1148,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4578,719,'BAN019','Băng rốn Đông Pha','1','','Hộp','','01/20111/ĐP',1025,50055,1020,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4885,1020,'BAN024','Băng thun 3 móc Bandage','1','','Cuộn','','',1025,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4816,953,'BAN022','Băng thun 3 móc Bảo Thạch 0,1m*4m','1','','Cuộn','','',1025,50110,1148,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4884,1019,'BAN023','Băng thun 3 móc QM','1','','Cuộn','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4894,1029,'BAN025','Băng vệ sinh (Bông bình lợi), B/10','10','','Bịch','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4808,945,'BAN021','Băng vệ sinh Hugo mama, B/12','12','','Bịch','','',1025,50060,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4752,893,'BAO009','Bao cao su Beautiful Dream, H/12/10','12','','Hộp','Mủ cao su thiên nhiên','',1025,50051,1083,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4751,892,'BAO008','Bao cao su Durex Fetherlite, H/3','1','','Hộp','Mủ cao su thiên nhiên','',1025,50051,0,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4747,888,'BAO006','Bao cao su Durex Kingtex H/12c','12','','Hộp','Mủ cao su thiên nhiên','',1025,50051,0,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4750,891,'BAO007','Bao cao su Durex Performa, H/3','3','','Hộp','Mủ cao su thiên nhiên','',1025,50051,0,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4756,897,'BAO012','Bao cao su Power Men, H/3','3','','Hộp','','',1025,50051,1021,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4755,896,'BAO011','Bao cao su Strast, H/24/3','24','','Hộp','Mủ cao su thiên nhiên','',1025,50051,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4999,1096,'BAO014','Bao cao su SURE, H/12','12','','Cái','','',1025,50051,0,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4754,895,'BAO010','Bao cao su SURE, H/12/3','1','','Hộp','Mủ cao su thiên nhiên','',1025,50051,0,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4988,1088,'BAO013','Báo cũ','1','','Cuộn','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4431,588,'BAO004','Bảo khí khang, H/20','1','','Hộp','','25775/2014/ATTP-XNCB',1001,50065,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4613,754,'BAO005','Bảo khí nhi Plus, H/14gói','1','','Hộp','','25981/2014/ATTP-XNCB',1001,50065,1070,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4063,221,'BAO002','Bảo Xuân 50+, H/30','1','','Hộp','','',1001,50065,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4064,222,'BAO003','Bảo Xuân Gold 30-50, H/30','1','','Hộp','','',1001,50065,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4532,673,'BAR003','Bar, L/180','1','','Lọ','','GC-0071-08',1001,50092,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4531,672,'BAR002','Bar, L/60','1','','Lọ','','GC-0071-08',1001,50092,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5057,1130,'BAU001','Bầu xông khí dung OMRON NE-C801','','','Bộ','','',1025,50056,1058,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4354,511,'BEH001','Bé ho Mekophar, H/24g','','','Gói','Dextromethorphan + Chlorpheniramin + Guaifenesin','',1001,50093,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4721,862,'BEC004','BECLATE Aquanase 7,5ml','','','Lọ','Beclomethason Dipropionate','VN-15753-12',1038,50068,996,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4191,349,'BEC003','Becozym Inj 2ml, H/12','','','Viên','B1 + B2 + B5 + B6 + C + PP','',1015,50068,844,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3348,111,'BEN005','Benthasone 0,5mg, L/500','','','Viên','Betamethason','',1001,50093,759,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4671,812,'BEP001','Bepanthen 30g','','','Tuýp','','VN-8454-09',1022,50077,817,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5000,1097,'BEP002','Beprosalic ointment 15g','','','Tuýp','Salicylic acid + Betamethason diprobionat','VN-15465-12',1022,50077,1115,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3401,147,'BER004','Berberin 100mg, L/100','','','Viên','Berberin Hydrochlorid','',1001,50093,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4115,273,'BER006','Berberin 100mg, L/100','','','Viên','Berberin Hydrochlorid','',1001,50093,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4432,589,'BER009','Berberin 10mg, L/100 (Đắng)','','','Chai','Berberin Hydrochlorid','VD-13809-11',1001,50093,1032,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4116,274,'BER007','Berberin 10mg, L/100 (Ngọt)','','','Chai','Berberin Hydrochlorid','VD-8570-09',1001,50093,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4243,401,'BER008','Berocca, L/10','','','Tuýp','','',1001,50093,843,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5321,1261,'BET003','Betaloc ZOK 25mg, H/14','','','Viên','Metoprolol','VN-17243-13',1001,50093,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3357,120,'BET001','BetaSerC 16mg, H/60','','','Viên','Betahistine dihydrochloride','',1001,50093,763,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5029,1114,'BET002','Betnapin 80mg, H/60','','','Viên','Thymomodulin','VN-15849-12',1001,50093,1123,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5328,1268,'BIC002','Bicebid 200mg, H/100','','','Viên','Cefixim','VD-10080-10',1001,50093,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5214,1197,'BIL010','Bilbroxol Syrup 30mg/5ml, 150ml','','','Lọ','Ambroxol','VN-17476-13',1001,50093,1159,214);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4575,716,'BIN003','Bình sữa Agi 120ml','','','Bình','','070/2015/YTĐN-TNCB',1001,50056,1063,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4574,715,'BIN002','Bình sữa Agi 60ml','','','Bình','','070/2015/YTĐN-TNCB',1001,50056,1063,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4990,1089,'BIN005','Bình sữa Cacara 140ml','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4991,1090,'BIN006','Bình sữa Cacara 250ml','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4576,717,'BIN004','Bình sữa Wesser 60ml','','','Bình','','069/2015/YTĐN-TNCB',1001,50056,1063,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4433,590,'BIO006','Bio-acimin Gold, H/30','','','Gói','','16676/2013/ATTP-XNCB',1001,50065,845,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3402,148,'BIO005','Biolac Plus, H/100','','','Viên','','20216/2015/ATTP-XNCB',1001,50065,773,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4511,652,'BIP001','Bipp C vị cam, H/40','','','Gói','','13798/2013/ATTP-XNCB',1002,50064,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3403,149,'BIS004','Bisacodyl 5mg, H/50','','','Viên','Bisacodyl','',1001,50093,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5102,1140,'BIS007','Bisacodyl DHG 5mg, H/100','','','Viên','Bisacodyl','VD-21129-14',1001,50093,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4620,761,'BIS006','Biscan-G Cap, H/120','','','Viên','Bacillus polyfermenticus + Clostridium butyricum','VN-12475-11',1001,50093,810,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4382,539,'BIS005','Bisolvon 8mg, H/30','','','Viên','Bromhexin','',1001,50093,746,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4358,515,'BIX001','Bixofen 120mg, H/10','','','Viên','Fexofenadin hydroclorid','',1001,50093,801,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4554,695,'BLA001','Black hair Ohbama, H/10','','','Gói','','62708/12/CBMP-QLD',1025,50060,0,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4592,733,'BOG005','Bổ gan tiêu độc Nhất Nhất, H/20','','','Hộp','','V268-H12-13',1001,50052,829,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4912,1046,'BOG007','Bó gối Đài Loan PJ 601 (thường)','','','Cái','','',1025,50110,0,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4911,1045,'BOG006','Bó gối Đài Loan PJ 758A (Tốt)','','','Cái','','',1025,50110,0,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4401,558,'BOP003','Bổ phế chỉ khái lộ 125ml','','','Chai','Bổ phế chỉ khái lộ','',1001,50053,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5207,1192,'BOS002','Bộ súc rửa dạ dày','','','Bộ','','',1031,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4106,264,'BOT009','Bổ tỳ PH Syrup 100ml','','','Chai','','',1001,50093,831,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4508,649,'BOC003','Bocalex Multi Eff, Tub/20','','','Tuýp','','18799/2015/ATTP-XNCB',1001,50065,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4217,375,'BOF001','Bofit F, H/30','','','Viên','Sắt Fumarat + Folic acid + B12','',1001,50093,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4481,628,'BOG003','Boganic fort, H/50 Caps','','','Viên','','VD-19789-13',1001,50093,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4482,629,'BOG004','Boganic, H/100 Tab','','','Viên','','VD-19789-13',1001,50093,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4819,956,'BOM012',E'Bơm tiêm 10ml (25x1"), H/100','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4817,954,'BOM010',E'Bơm tiêm 1ml (26Gx1/2"), H/100','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4820,957,'BOM013',E'Bơm tiêm 20ml (23Gx1"), H/50 (Cái)','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4434,591,'BOM009',E'Bơm tiêm 3ml (25Gx1"), H/100','','','Cái','','0773/2001/CBTC-TĐC',1015,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4821,958,'BOM014','Bơm tiêm 50ml, H/25','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4822,959,'BOM015','Bơm tiêm 50ml, H/25 (Đầu to)','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4818,955,'BOM011',E'Bơm tiêm 5ml (25Gx1"), H/100','','','Cái','','',1015,50110,1041,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4826,963,'BON015','Bông gòn 100gr','','','Gói','','',1025,50110,1094,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4830,967,'BON019','Bông gòn 1kg','','','Gói','','',1025,50110,1094,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4827,964,'BON016','Bông gòn 25gr','','','Gói','','',1025,50110,1094,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4828,965,'BON017','Bông gòn 50gr','','','Gói','','',1025,50110,1094,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4829,966,'BON018','Bông gòn 5gr, B/50g','','','Gói','','',1025,50110,1094,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4786,927,'BON014','Bông ráy tai cao cấp HELLO','','','Hộp','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4876,1011,'BON020','Bông tẩy trang HOAMIS KOREA','','','Gói','','',1025,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4072,230,'BON012','BoniDiabet, H/60','','','Hộp','','',1001,50065,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4073,231,'BON013','BoniSleep, H/30','','','Hộp','','',1001,50065,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4946,1072,'BOT011','Bột bó 6 inches (15cm*4,5m)','','','Cuộn','','',1025,50110,1104,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4513,654,'BOT010','Bột khử mùi TRAPHA 30g','','','Hộp','','01/04/CBMP-TNG',1021,50062,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4004,162,'BRI002','Bricanyl 0.5mg/1ml, H/5A','','','Ống','Terbutalin','',1015,50068,797,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4373,530,'BRO003','Bromhexin 4mg, H/40','','','Viên','Bromhexin','',1001,50093,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4381,538,'BRO004','Bromhexin 8mg, H/200','','','Viên','Bromhexin','',1001,50093,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4777,918,'BRO006','Broncho-Vaxom Adults 7mg, H/10','','','Viên','Lyophilized bacterial lysates','VN-15432-12',1001,50093,1088,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4776,917,'BRO005','Broncho-Vaxom Children 3.5mg, H/10','','','Viên','Lyophilized bacterial lysates','VN-15048-12',1001,50093,1088,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4193,351,'BUS004','Buscopan 10mg, H/100','','','Viên','Hyoscin butylbromid','',1001,50093,746,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3308,72,'BUS003','Buscopan 20mg/ml, H/10A','','','Ống','Hyoscin butylbromid','',1015,50068,746,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4435,592,'C-A001','C-APCO','','','Lọ','Vitamin C','21108/2013/ATTP-XNCB',1002,50064,744,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4611,752,'CAG001','Cà gai leo Tuệ Linh','','','Hộp','','21349/2013/ATTP-XNCB',1001,50065,1049,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5340,1280,'CAL037','Calci-C 1000 Sandoz Orange, Tub/10 Eff','','','Tuýp','Calci Gluconat + Calci Carbonat + Vitamin C','VN-18394-14',1001,50093,926,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4015,173,'CAL020','Calci clorid 500mg/5ml (10%), H/100','','','Ống','Calci clorid','',1015,50068,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4103,261,'CAL028','Calci D-Hasan Eff 600/400, H/10','','','Viên','','',1001,50093,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5110,1143,'CAL034','Calci D-Hasan, H/18 Eff','','','Tuýp','','VD-22660-15',1001,50093,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4235,393,'CAL030','Calci D Glomed, H/100','','','Viên','Calci gluconate + Vitamin D3','',1001,50093,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3358,121,'CAL018','Calci glubionat Kabi 5ml, H/10A','','','Ống','Calci glubionat','',1015,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3359,122,'CAL019','Calcium Alko 5ml Inj, H/10A','','','Ống','Calci glubionat','',1015,50068,764,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5109,1142,'CAL033','Calcium Boston 500mg, H/20 Eff','','','Viên','Calci Gluconat + Calci Carbonat','VD-12793-10',1001,50093,1139,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4099,257,'CAL024','Calcium Corbiere 10ml, H/30A','','','Ống','Calcium glucoheptonate + Vitamin C + Vitamin PP','',1001,50093,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4098,256,'CAL023','Calcium Corbiere 5ml, H/30A','','','Ống','Calcium glucoheptonate + Vitamin C + Vitamin PP','',1001,50093,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4100,258,'CAL025','Calcium Corbiere Eff 3240mg, H/20','','','Viên','Calci gluconolactat + Calci carbonat','',1001,50093,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5225,1203,'CAL036','Calcium D, H/100 - Robinson','','','Viên','Calci carbonat + Vitamin D3','VD-15319-11',1001,50093,1015,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4101,259,'CAL026','Calcium Hasan Eff 3240mg, H/20','','','Viên','Calci gluconolactat + Calci carbonat','',1001,50093,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4102,260,'CAL027','Calcium Sandoz Eff 3240mg, H/20','','','Viên','Calci gluconolactat + Calci carbonat','',1001,50093,926,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4104,262,'CAL029','Calcium Satda 330ml','','','Chai','Tricalciphosphat + D3','',1001,50093,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4096,254,'CAL021','Calcium STADA 10ml, H/20A','','','Ống','Calcium glucoheptonate + Vitamin C + Vitamin PP','',1001,50093,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5182,1168,'CAL035','Calcium Stada 500mg, H/20 Eff','','','Viên','Calci gluconolactat + Calci carbonat','VD-14572-11',1001,50093,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4097,255,'CAL022','Calcium STADA 5ml, H/20A','','','Ống','Calcium glucoheptonate + Vitamin C + Vitamin PP','',1001,50093,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4789,930,'CAL031','Caldforkid 10ml, H/20','','','Tuýp','','14880/2014/ATTP-XNCB',1001,50066,938,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4260,418,'CAN004','Canesten VT1 500mg, H/1','','','Viên','Clotrimazol','',1026,50072,973,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4261,419,'CAN005','Canesten VT6 100mg, H/6','','','Viên','Clotrimazol','',1026,50072,973,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4615,756,'CAN006','Cansua 3+, H/14G','','','Hộp','','6769/2014/ATTP-XNCB',1001,50066,1072,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4616,757,'CAN007','Cansua 3+, H/30V','','','Hộp','','17372/2013/ATTP-XNCB',1001,50066,1072,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4560,701,'CAO007','Cao dán Ariel TDDS, H/2','','','Miếng','Spocolamine','VN-16705-13',1023,50076,1052,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4539,680,'CAO005','Cao Hà thủ ô','','','Lọ','','',1001,50093,1049,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4546,687,'CAO006','Cao ích mẫu 180ml','','','Chai','','VD-8679-09',1001,50093,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4317,474,'CAP004','CaptoHasan 25mg, H/100','','','Viên','Captopril','',1001,50093,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4318,475,'CAP005','Captopril 25mg, H/100','','','Viên','Captopril','',1001,50093,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5243,1216,'CAR005','Carbamazepin 200mg, L/200','','','Lọ','Carbamazepin','',1001,50093,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4772,913,'CAR002','Carbimazole 5mg, H/100','','','Viên','Carbimazol','VN-11290-10',1001,50093,964,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5272,1237,'CAR006','Carbomint, L/30v','','','Viên','Than hoạt','',1001,50093,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5181,1167,'CAR004','Carlozik 250mg, H/10','','','Viên','Azithromycin','VN-12663-11',1001,50093,753,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4567,708,'CAT005','Cắt thuốc','','','Cái','','01-2007/CTYTTBKTYT',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4031,189,'CAV001','Cavinton Forte 10mg, H/30','','','Viên','Vinpocetin','',1001,50093,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4250,408,'CEB005','Cebraton, H/50','','','Viên','','',1001,50093,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4043,201,'CEB004','Cebrex 40mg, H/120','','','Viên','Ginkgo biloba','',1001,50093,933,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4108,266,'CEE001','Ceelin Syrup 30ml','','','Chai','','',1001,50093,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4109,267,'CEE002','Ceelin Syrup 60ml','','','Chai','','',1001,50093,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3187,7,'CEF031','Cefaclor 125mg, H/10','','','Gói','Cefaclor','',1001,50093,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3188,8,'CEF032','Cefaclor 250mg, H/10g','','','Gói','Cefaclor','',1001,50093,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4256,414,'CEF054','Cefadroxil 500mg, H/100','','','Viên','Cefadroxil','VN-10538-10',1001,50093,964,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5202,1187,'CEF060','Cefadroxil 500mg, H/100 - Minimed','','','Viên','Cefadroxil','VN-13356-11',1001,50093,775,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3193,13,'CEF033','Cefalexin 500mg, H/100','','','Viên','Cefalexin','',1001,50093,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5192,1177,'CEF058','Cefdinir 125mg, H/24','','','Gói','Cefdinir','VD-15342-11',1001,50093,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5193,1178,'CEF059','Cefdinir 300mg, H/20','','','Viên','Cefdinir','VD-14656-11',1001,50093,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5128,1153,'CEF057','Cefixim 100mg US, H/30','','','Viên','Cefixim','VD-8558-09',1001,50093,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3254,21,'CEF038','Cefixim 100mg, H/20','','','Viên','Cefixim','',1001,50093,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3255,22,'CEF039','Cefixim 200mg, H/20','','','Viên','Cefixim','VD-8581-09',1001,50093,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4200,358,'CEF051','Cefixim 400mg CGP, H/10','','','Viên','Cefixim','',1001,50093,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4255,413,'CEF053','Cefixim Uphace 100mg, H/10g','','','Gói','Cefixim','',1001,50093,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3257,24,'CEF040','Cefixim Uphace 50mg, H/10','','','Gói','Cefixim','',1001,50093,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4436,593,'CEF055','Cefixime 100mg, H/10','','','Gói','Cefixim','VD-22546-15',1001,50093,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4205,363,'CEF052','Cefpodoxim 200mg - HV, H/30','','','Viên','Cefpodoxim','',1001,50093,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4658,799,'CEF056','Cefucap 500mg, H/10','','','Viên','Cefuroxim','VD-12800-10',1001,50093,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3258,25,'CEF041','Cefuroxime 250mg, H/20','','','Viên','Cefuroxim','',1001,50093,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3259,26,'CEF042','Cefuroxime 500mg, H/20','','','Viên','Cefuroxim','VD-8588-09',1001,50094,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5189,1174,'CEL004','Celosti 100mg, H/20','','','Viên','Celecoxib','VD-23381-15',1001,50095,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5190,1175,'CEL005','Celosti 200mg, H/20','','','Viên','Celecoxib','VD-16193-12',1001,50095,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4080,238,'CEN004','Central Vita-Plus, H/100','','','Hộp','','',1001,50066,950,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3191,11,'CEP003','Cephalexin 250mg, H/100','','','Viên','Cefalexin','',1001,50095,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4437,594,'CEP002','Cephalexin 250mg, H/12g','','','Gói','Cephalexin','VD-23176-15',1001,50095,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4045,203,'CER007','Cerebrolysin 10ml, H/5A','','','Ống','Cerebrolysin Concentrate','',1015,50068,934,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4044,202,'CER006','Cerebrolysin 5ml, H/5A','','','Ống','Cerebrolysin Concentrate','VN-15431-12',1001,50095,934,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4738,879,'CET003','Cetaphil 125ml','','','Chai','','81491/13/CBMP-QLD',1025,50057,860,37);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4739,880,'CET004','Cetaphil 500ml','','','Chai','','81491/13/CBMP-QLD',1025,50057,860,37);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5333,1273,'CET005','Cetazin 10mg, L/200','','','Viên','Cetirizin','VD-22565-15',1001,50095,803,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4014,172,'CEV002','Cevit 500mg/5ml, H/100A','','','Ống','Vitamin C','VD-10463-10',1015,50069,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4380,537,'CEZ002','Cezil 10mg, H/100','','','Viên','Cetirizin','VD-10073-10',1001,50095,944,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4845,981,'CHI043','Chỉ Dafilon 2/0','','','Sợi','','',1025,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4846,982,'CHI044','Chỉ Dafilon 3/0','','','Sợi','','',1025,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4847,983,'CHI045','Chỉ Dafilon 4/0','','','Sợi','','',1025,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4848,984,'CHI046','Chỉ Dafilon 5/0','','','Sợi','','',1025,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4780,921,'CHI042','Chỉ nha khoa (Oral-B), H/6','','','Tuýp','','',1025,50060,0,37);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4580,721,'CHI041','Chỉ nha khoa OKAMURA ASASHI 40m','','','Tuýp','','',1025,50056,1064,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4438,595,'CHI040','Chiamin-S 500ml, T/12ch','','','Chai','','VN-10573-10',1019,50068,826,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3260,27,'CHL011','Chloramphenicol 250mg, H/100','','','Viên','Chloramphenicol','VD-14702-11',1001,50095,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4361,518,'CLO010','Chlorpheniramin 4mg, H/200','','','Viên','Chlopheniramin','',1001,50095,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4362,519,'CLO011','Chlorpheniramin 4mg, L/1000','','','Viên','Chlopheniramin','',1001,50095,1015,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4932,1059,'CHO005','Chophytol 200mg, H/180','','','Viên','Artichaut','VN-5680-10',1001,50095,1100,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4439,596,'CHU001','Chức năng gan Bảo Nguyên, H/30','','','Hộp','','3490/2014/ATTP-XNCB',1001,50066,1033,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4288,445,'CIF003','Cifga 500mg, H/20','','','Viên','Ciprofloxacin','',1001,50095,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4330,487,'CIL001','Ciloxan 0.3%','','','Lọ','Ciprofloxacin','',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4007,165,'CIM006','Cimetidin 300mg/2ml, H/10A','','','Ống','Cimetidin','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3405,151,'CIM004','Cimetidine DP 3/2 300mg, H/100','','','Viên','Cimetidin','',1001,50095,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3406,152,'CIM005','Cimetidine MKP 300mg, H/100','','','Viên','Cimetidin','',1001,50095,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3360,123,'CIN003','Cinnarizin 25mg, H/100','','','Viên','Cinnarizin','',1001,50095,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4331,488,'CIP008','Ciplox 5ml','','','Lọ','Ciprofloxacin','',1042,50072,996,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4336,493,'CIP009','Ciprofloxacin 0.3% 5ml, L/10','','','Lọ','Ciprofloxacin','',1042,50072,736,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4210,368,'CIP007','Ciprofloxacin Kabi 200mg/100ml','','','Chai','Ciprofloxacin','',1019,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5191,1176,'CLA007','Clanoz 10mg, H/20','','','Viên','Loratadin','VD-20550-14',1001,50095,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3199,16,'CLA004','Clarithromycin 250mg, H/10','','','Viên','Clarithromycin','',1001,50096,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3200,17,'CLA005','Clarmark 500mg, H/10','','','Viên','Clarithromycin','',1001,50096,730,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4049,207,'CLE003','Clever baby DHA, H/30','','','Hộp','','',1001,50066,936,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4661,802,'CLI003','Clinxy 120ml','','','Chai','','002816/13/CBMP-HCM',1022,50061,984,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5322,1262,'CLO014','Clomaz 100mg, H/6','','','Viên','Clotrimazol','VN-13221-11',1026,50072,1176,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5042,1125,'CLO013','Clomid 50mg, H/5','','','Viên','Citrat de clomifene','',1001,50096,741,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5039,1122,'CLO012','Cloramphenicol 250mg, H/100 - Uphace','','','Viên','Chloramphenicol','VD-17590-12',1001,50096,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4389,546,'COD003','Codatux syrup 100ml','','','Chai','','',1001,50096,1028,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4388,545,'COD002','Codatux, H/30','','','Gói','','',1001,50096,1028,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3309,73,'COL010','Colchicin 1mg, H/20','','','Viên','Colchicine','',1001,50096,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4180,338,'COL013','Colchicin 1mg, H/20','','','Viên','Colchicine','VD-11302-10',1001,50096,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4344,501,'COL014','ColDi-B 15ml','','','Lọ','Oxymetazolin Hydroclorid','',1041,50072,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4766,907,'COL016','Collagen + A,C,E (12000mg), H/180','','','Hộp','','',1001,50066,1086,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4614,755,'COL015','ColosMAX Q10, H/20','','','Gói','','2888/2013/ATTP-XNCB',1001,50066,1071,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5084,1134,'COL018','Coltramyl 4mg, H/12','','','Viên','Thiocolchicosid','VD-22638-15',1001,50096,880,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4496,643,'COM006','Cốm bổ Calci Plurivica 40g','','','Lọ','','VD-16823-12',1003,50084,1013,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4497,644,'COM007','Cốm bổ Calci Plurivica 80g','','','Lọ','','VD-16823-12',1003,50084,1013,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5257,1230,'COM013','Cốm canxi APCO lớn','','','Lọ','','',1003,50063,744,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5256,1229,'COM012','Cốm canxi APCO nhỏ','','','Lọ','','',1003,50063,744,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4547,688,'COM009','Cốm dạ dày Curmin bình vị','','','Lọ','','',1001,50066,947,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4051,209,'COM005','Cốm lợi sữa Calci, H/24','','','Gói','','',1001,50066,938,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5221,1199,'COM011','Cốm thỏ Plusvitca nhỏ','','','Lọ','','',1003,50064,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4498,645,'COM008','Cốm Unikids kẽm 50g','','','Lọ','','8952/2015/ATTP-XNCB',1003,50064,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4012,170,'COM004','Combivent 0,5mg+2,5mg/2,5ml, H/10','','','Tuýp','Ipratropium + Salbutamol','',1062,50072,746,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5087,1137,'CON019','Cồn 70, 60ml, L/10','','','Lọ','Ethanol','2901/2009/CBTC-TĐC',1022,50077,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4803,944,'CON018','Cồn 90, 60ml, L/10','','','Lọ','','0063/2014/CBTC-YTVP',1025,50073,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4734,875,'CON017','Cồn Boric 3% 10ml, L/10','','','Lọ','Acid Boric + Ethanol','VNS-3709-07',1025,50073,772,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4415,572,'CON012','Cồn xoa bóp Jamda 50ml','','','Chai','','',1022,50061,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4716,857,'CON015','Concor 2.5mg, H/30','','','Viên','Bisoprolol fumarate','VN-18023-14',1001,50096,806,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4717,858,'CON016','Concor 5mg, H/30','','','Viên','Bisoprolol fumarate','VN-17521-13',1001,50096,806,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4680,821,'CON014','Contractubex 10g','','','Tuýp','','VN-15377-12',1022,50077,816,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5273,1238,'COO001','COOLDROP 10ml','','','Lọ','Nước mắt nhân tạo','',1042,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4197,355,'COR003','Cor-F 0,5mg, L/500','','','Viên','Dexamethason','',1001,50096,966,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4311,468,'COR004','Cordarone 200mg, H/30','','','Viên','Amiodaron ( Hydrochorid)','',1001,50096,807,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4687,828,'COR005','Cortibion cream 8g','','','Tuýp','','VD-21043-14',1022,50077,880,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4639,780,'COT006','Cốt thoái vương, H/30','','','Hộp','','17538/2013/ATTP-XNCB',1001,50053,946,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4628,769,'COT005','Cota Xoang, H/30','','','Hộp','','VD-12579-10',1001,50053,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3261,28,'COT004','Cotrimxazon 960mg, H/100','','','Viên','Sulfamethoxazol + Trimethoprim','',1001,50096,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3201,18,'COT003','Cotriseptol 480mg, H/200','','','Viên','Sufamethoxazol + Trimethoprin','',1001,50096,717,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4295,452,'COV002','Coversyl 5mg, H/30','','','Viên','Perindopril','',1001,50096,808,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4534,675,'CRI002','Crila, H/4-L/40','','','Hộp','Cao khô trinh nữ hoàng cung','VD-15304-11',1001,50096,840,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4239,397,'CYS001','Cysmona Caplet, H/60','','','Viên','L-Cystine + Vitamin B6','',1001,50097,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4062,220,'D-F001','D-Fluoretten 500 I.E, H/90','','','Viên','','',1001,50066,944,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4660,801,'DAH002','Dạ Hương 100ml, L/10','','','Chai','','377/12/CBMP-HN',1022,50061,983,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4598,739,'DAF005','Daflon 500mg, H/60','','','Viên','Diosmine + Hesperidine','VN-15519-12',1001,50097,1006,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4904,1038,'DAI075','Đai cẳng tay số 4 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4905,1039,'DAI076','Đai cẳng tay số 4 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4903,1037,'DAI074','Đai cẳng tay số 5 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4906,1040,'DAI077','Đai cẳng tay số 5 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4902,1036,'DAI073','Đai cẳng tay số 6 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4907,1041,'DAI078','Đai cẳng tay số 6 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4901,1035,'DAI072','Đai cẳng tay số 7 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4908,1042,'DAI079','Đai cẳng tay số 7 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4900,1034,'DAI071','Đai cẳng tay số 8 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4909,1043,'DAI080','Đai cẳng tay số 8 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4899,1033,'DAI070','Đai cẳng tay số 9 (P)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4910,1044,'DAI081','Đai cẳng tay số 9 (T)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4849,985,'DAI067','Đai cột sống số 9','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4850,986,'DAI068','Đai Desault phải số 5','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4851,987,'DAI069','Đai Desault trái số 5','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4529,670,'DAI058','Đại tràng hoàn-P/H, H/10','','','Hộp','','V826-H12-10',1001,50097,831,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4589,730,'DAI060','Đại tràng Nhất Nhất, H/20','','','Hộp','','V272-H12-13',1001,50053,829,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4544,685,'DAI059','Đại tràng Tâm Bình, H/60','','','Lọ','','19880/2013/ATTP-XNCB',1001,50066,834,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5165,1156,'DAI084','Đai treo tay số 1 28cm','','','Cái','','',1025,50110,1147,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5166,1157,'DAI085','Đai treo tay số 4 38cm','','','Cái','','',1025,50110,1147,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4811,948,'DAI061','Đai xương đòn số 4','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4812,949,'DAI062','Đai xương đòn số 5','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4813,950,'DAI063','Đai xương đòn số 6','','','Cái','','',1019,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4814,951,'DAI064','Đai xương đòn số 7','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4815,952,'DAI065','Đai xương đòn số 8','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4823,960,'DAI066','Đai xương đòn số 9','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4337,494,'DAI057','Daiticol 10ml, L/10','','','Lọ','Diphenhydramine Hydroclorid','',1042,50072,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4774,915,'DAL002','Dalekine 200mg, L/40','','','Lọ','Natri Valproat','VD-16185-12',1001,50097,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4421,578,'DAU018','Dầu con ó 24ml - Singapore 1N','','','Chai','','',1022,50061,0,184);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4422,579,'DAU019','Dầu con ó 24ml - USA 2N','','','Chai','','',1022,50061,0,184);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4488,635,'DAU026','Dầu cù là đỏ GELIGA, HL/12','','','Hộp','','CAM N00241H-13',1022,50077,1145,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4412,569,'DAU011','Dầu đỏ Thái Lan 3ml, L/12','','','Chai','','',1022,50062,885,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4413,570,'DAU012','Dầu đỏ Thái Lan 7ml, L/6','','','Chai','','',1022,50062,885,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4052,210,'DAU009','Dầu gấc VINAGA-DHA, H/100','','','Hộp','','',1001,50066,939,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4411,568,'DAU010','Dầu gừng Thái Dương, L/10','','','Chai','','V12-H12-13',1022,50077,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4418,575,'DAU015','Dầu khuynh diệp 15ml, L/12','','','Chai','','VD-18976-13',1022,50062,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4419,576,'DAU016','Dầu khuynh diệp 25ml, H/12L','','','Chai','','',1022,50062,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4414,571,'DAU013','Dầu Khuynh Diệp EMCARE 25ml','','','Chai','','',1022,50062,861,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4420,577,'DAU017','Dầu khuynh diệp ME&EM 25ml','','','Chai','','',1022,50062,861,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4732,873,'DAU028','Dầu mù u (INOPILO), H/25','','','Lọ','','VNB-4288-05',1022,50077,999,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4440,597,'DAU025','Dầu mù u 12ml, L/10','','','Lọ','','002507/13/CBMP-HCM',1022,50077,994,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4427,584,'DAU024','Dầu nóng Hàn Quốc 100ml','','','Chai','','',1022,50062,870,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4426,583,'DAU023','Dầu nóng mặt trời 60ml, L/6','','','Chai','','',1022,50062,994,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4425,582,'DAU022','Dầu nóng Trường Sơn 10ml, H/10','','','Chai','','',1022,50062,876,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4423,580,'DAU020','Dầu Phật linh 1.5ml, H/10','','','Chai','','V1255-H12-10',1022,50062,876,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4424,581,'DAU021','Dầu Phật linh 5ml, H/12','','','Chai','','V1255-H12-10',1022,50062,876,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4416,573,'DAU014','Dầu Thiên Thảo, H/12L','','','Chai','','',1022,50062,876,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4538,679,'DAU027','Dầu tỏi Tuệ Linh','','','Lọ','','6676/2012/YT-CNTC',1001,50066,1049,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5001,1098,'DAU029','Dầu xua muỗi Amerzoral 30ml','','','Lọ','','VNDP-HC-638-10-12',1022,50077,1116,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3262,29,'DAV001','Davore-500mg, H/10','','','Viên','Levofloxacin','',1001,50097,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4441,598,'DAX001','Daxci, H/100','','','Viên','Pancreatin + Simethicone','VN-17457-13',1001,50097,1034,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4895,1030,'DAY022','Dây cho ăn Stomach tube - Minh Tâm','','','Dây','','',1025,50110,1097,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4889,1024,'DAY023','Dây cho ăn Stomach tube 16Fr - Covidien','','','Dây','','',1025,50110,1019,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4875,1010,'DAY020','Dây hút đờm giãi 16Fr','','','Sợi','','',1025,50110,1097,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5212,1195,'DAY024','Dây truyền dịch AM, B/25','','','Cái','','',1019,50110,1157,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4810,947,'DAY018','Dây truyền dịch Braun Intrafix Air','','','Sợi','','',1019,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4888,1023,'DAY021','Dây truyền dịch Khang Nguyên','','','Sợi','','',1019,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4809,946,'DAY017','Dây truyền dịch Mediplast','','','Sợi','','HN-036/2008/CBHH-TĐC',1019,50110,1092,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5262,1235,'DEL003','Đè lưỡi gỗ - Bá Lạc','','','Hộp','','',1025,50110,1170,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4762,903,'DEC005','Deca-durabolin 50mg/ml, H/1A','','','Hộp','Nandrolone decanoate','VN-16327-13',1015,50069,822,156);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4519,660,'DEC002','Decolgen Fort, H/100','','','Viên','Paracetamol + Phenylephrine hydroclorid + Chlorpheniramin','VD-9164-09',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5124,1149,'DEC006','Decolgen ND (Xanh), H/100','','','Viên','Paracetamol + Phenylephrine hydroclorid','VD-22382-15',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4178,336,'DEC003','Decontractyl 250mg, H/60','','','Viên','Mephenesin','',1001,50097,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4179,337,'DEC004','Decontractyl 500mg, H/36','','','Viên','Mephenesin','',1001,50097,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4588,729,'DEN029','Denicol 15ml','','','Lọ','','VD-16725-12',1025,50073,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3311,74,'DEN026','Denizen 10mg, H/100','','','Viên','Serratiopeptidase','',1001,50097,749,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4517,658,'DEN028','Dentanalgi 7ml, L/12','','','Lọ','','VD-19912-13',1021,50081,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4516,657,'DEN027','Dentgital 3ml, L/10','','','Lọ','','VD-15096-11',1021,50081,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4735,876,'DEP003','DEP 8g, H/20','','','Lọ','','VS-4773-10',1025,50073,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4277,435,'DER001','Derma-HG, L/6','','','Tuýp','','',1021,50081,976,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4679,820,'DER002','Dermatix Ultra 7g','','','Tuýp','','',1022,50078,990,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3312,75,'DES002','Descotyl 250mg, H/250','','','Viên','Mephenesin','',1001,50097,750,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4340,497,'DEX011','Dexacol 5ml, L/10','','','Lọ','Chloramphenicol + Dexamethason','',1042,50072,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3313,76,'DEX010','Dexamethason 4mg/ml, H/10','','','Ống','Dexamethason','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4383,540,'DEX012','Dextromethorphan 10mg, L/100','','','Viên','Dextromethorphan','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4935,1062,'DEX013','Dextromethorphan 15mg, H/100','','','Viên','Dextromethorphan','VD-17962-12',1001,50097,728,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4617,758,'DIA026','Diabetna, H/40','','','Hộp','','4581/2013/ATTP-XNCB',1001,50066,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4164,322,'DIA022','Diacerein 50mg, H/100','','','Viên','Diacerein','',1001,50097,964,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4165,323,'DIA023','Diacerein HV 50mg, H/100','','','Viên','Diacerein','',1001,50097,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4605,746,'DIA025','Dianorm-M, H/100','','','Viên','Metformin + Gliclazid','VN-14275-11',1001,50097,791,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4280,438,'DIB001','Dibetalic 15g','','','Tuýp','','',1021,50081,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3314,77,'DIC006','Diclofenac 50mg, H/100','','','Viên','Diclofenac','',1001,50097,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5203,1188,'DIC010','Diclofenac 75mg, H/100','','','Viên','Diclofenac','VD-23083-15',1001,50097,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3315,78,'DIC007','Diclofenac 75mg, L/100','','','Viên','Diclofenac','',1001,50097,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3316,79,'DIC008','Diclofenac Kabi 75mg/3ml, H/10A','','','Ống','Diclofenac','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5101,1139,'DID004','Didicera, H/10','','','Hộp','','VD-9213-19',1001,50097,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4624,765,'DIE005','Diệp hạ châu, L/90','','','Hộp','','VD-10924-10',1001,50053,828,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4986,1086,'DIG005','Digoxin Richter 250mcg, H/50','','','Viên','Digoxin','',1001,50097,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4709,850,'DIG004','DigoxineQualy 1/4mg, H/30','','','Viên','Digoxin','VD-16832-12',1001,50097,736,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5201,1186,'DIM001','Dimagel 10g, H/30','','','Gói','Guaiazulen + Dimethicon','VD-17227-12',1001,50097,1155,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4683,824,'DIP003','Dipolac G 15g','','','Tuýp','Betamethasone Dipropionate + Gentamycin + Clotrimazol','VD-20117-13',1022,50078,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4278,436,'DIP002','Diprosalic Ointment 15g','','','Tuýp','','VN-15553-12',1021,50081,977,37);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4442,599,'DIU002','Diurefar 40mg, H/120','','','Viên','Furosemid','VD-10160-10',1001,50097,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4133,291,'DOG002','Dogmatil 50mg, H/30','','','Viên','Sulpiride','',1001,50097,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3317,80,'DOL002','Dolfenal 500mg, H/100','','','Viên','Acid Mefenamic','',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5229,1206,'DOL004','Dolnaltic 500mg, H/100','','','Viên','Acid Mefenamic','VD-18208-13',1001,50097,1013,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4155,313,'DOM002','Domperidone STADA 10mg, H/100','','','Viên','Domperidon','',1001,50097,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3168,2,'DOP005','Dopegyt 250mg, H/100','','','Viên','Methyldopa','VN-13124-11',1001,50097,738,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4296,453,'DOR010','Dorocardyl 40mg, L/100','','','Viên','Propanolol','',1001,50097,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3263,30,'DOR007','Dorogyne, H/20','','','Viên','Spiramycin + Metronidazol','',1001,50097,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3264,31,'DOR008','Doropycin 1.5 M.IU, H/16','','','Viên','Spiramycin','',1001,50097,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3265,32,'DOR009','Doropycin 3 M.IU, H/10','','','Viên','Spiramycin','',1001,50097,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5248,1221,'DRO003','Dropstar 10ml','','','Ống','Levofloxacin','VD-21524-14',1001,50097,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5031,1116,'DRO002','Drosperin, H/28','','','Hộp','Ethinyl Estradiol','VN-16308-13',1001,50097,1121,40);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4582,723,'DUN005','Dụng cụ cạo lưỡi OKAMURA','','','Bịch','','',1025,50056,1064,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5319,1259,'DUN006','Dụng cụ rửa bình sữa','','','Cái','','',1025,50110,1063,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5177,1163,'DUO014','Đường Cologrin','','','Lọ','Đường Colorific','16221/2013/ATTP-XNCB',1001,50066,1151,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4627,768,'DUO010','Dưỡng cốt hoàn, H/20','','','Hộp','','VD-17817-12',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5245,1218,'DUO015','Dưỡng tâm an thần L/100 - ĐN','','','Lọ','','',1001,50053,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4535,676,'DUO009','Dưỡng tâm an thần PV, H/60','','','Lọ','','V783-H12-10',1001,50053,827,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5003,1100,'DUO011','Dưỡng tâm an thần, H/30 ĐN','','','Viên','','VD-16788-12',1001,50053,828,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4131,289,'DUP002','Duphalac 667g/l 15ml, H/20','','','Gói','Lactulose','',1001,50097,763,156);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4638,779,'DUY001','Duyên Hồng Dược, H/30','','','Hộp','','',1001,50066,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5210,1193,'DUY002','Duyên Hồng Dược, H/30v','','','Viên','','',1001,50066,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3266,33,'ECO001','Ecoflox-500, H/100','','','Viên','Ciprofloxacin','VN-10395-10',1001,50097,788,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4585,726,'ECO002','Ecosip, H/20 gói','','','Gói','','16413/QLD-KD',1023,50076,1065,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5198,1183,'EFF017','Effe Paracetamol, H/24','','','Gói','Paracetamol + Vitamin C','VD-16482-12',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3318,81,'EFF006','Efferalgan 150mg, H/12','','','Gói','Paracetamol','VN-12419-11',1001,50097,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3319,82,'EFF007','Efferalgan 250mg, H/12','','','Gói','Paracetamol','VN-5345-10',1001,50097,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3320,83,'EFF008','Efferalgan 500mg, H/16','','','Viên','Paracetamol','VN-14558-12',1001,50097,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3321,84,'EFF009','Efferalgan 80mg, H/12','','','Gói','Paracetamol','',1001,50097,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3322,85,'EFF010','Efferalgan Codein 530mg, H/40','','','Viên','Paracetamol + Codein','VN-14067-11',1001,50097,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4914,1048,'EFF014','Efferalgan Suppo 150mg, H/10','','','Viên','Paracetamol','VN-12419-11',1027,50072,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4916,1050,'EFF016','Efferalgan Suppo 300mg, H/10','','','Viên','Paracetamol','VN-14066-11',1027,50072,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4915,1049,'EFF015','Efferalgan Suppo 80mg, H/10','','','Viên','Paracetamol','VN-12418-11',1027,50072,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3996,154,'EFF013','EfferHasan 250mg, H/30','','','Gói','Paracetamol','',1001,50097,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5161,1154,'ELT001','Elthon 50mg, H/20','','','Viên','Itopride Hydrochloride','VN-18978-15',1001,50097,763,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5204,1189,'ELU001','Eludril mouthwash 90ml','','','Chai','','VD-18567-13',1061,50072,1154,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4218,376,'ENA003','Enat 400IU, H/30','','','Viên','Vitamin E','',1001,50097,846,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4216,374,'ENE001','Enervon, H/100','','','Viên','','VD-15958-11',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4936,1063,'ENO001','Eno Orange, H/24','','','Gói','','VN-8714-09',1001,50097,774,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4114,272,'ENT001','Enterogermina, H/20','','','Tuýp','','',1001,50097,771,105);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4275,433,'ERO001','Erossan Care 45g','','','Tuýp','','',1025,50060,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4276,434,'ERO002','Erossan trị mụn 10g','','','Tuýp','','',1021,50082,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3267,34,'ERY013','Ery children 250mg, H/24g','','','Gói','Erythromycin','',1001,50097,739,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4254,412,'ERY016','Erymekophar 250mg, H/30g','','','Gói','Erythromycin','',1001,50097,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3268,35,'ERY014','Erythromycin 250mg, H/100','','','Viên','Erythromycin','',1001,50097,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3269,36,'ERY015','Erythromycin 500mg, H/100','','','Viên','Erythromycin','',1001,50097,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5126,1151,'ETO001','Etodoc 200mg, H/100','','','Viên','Etodolac','VN-15884-12',1001,50097,871,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4764,905,'EUG003','Eugica fort, H/100','','','Viên','','VD-16195-12',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4290,447,'EUR002','Eurolivo 500mg, H/10','','','Viên','Levofloxacin','',1001,50097,1007,21);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5041,1124,'EUR003','Euronida 4mg, H/100','','','Viên','Cyproheptadine Hydrochloride','VN-18646-15',1001,50097,1127,178);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4038,196,'EXA001','Examin 250mg/5ml, H/10A','','','Ống','Tranexamic acid','',1015,50069,931,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4678,819,'EXP001','Explaq 35g','','','Tuýp','','660/14/CBMP-HN',1022,50078,878,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5336,1276,'EYE003','EYEBI, H/30','','','Viên','Cao Vaccinium Myrtillus + DL-alpha-tocopheryl acetate','VD-15606-11',1001,50097,991,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4249,407,'EYE002','Eyelight Vita 10ml','','','Chai','','',1042,50072,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5251,1224,'FAL001','Falgankid 160mg','','','Ống','Paracetamol','VD-21506-14',1001,50097,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5252,1225,'FAL002','Falgankid 250mg','','','Ống','Paracetamol','VD-21507-14',1001,50097,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5334,1274,'FAR004','Farnisone 5mg, H/200','','','Viên','Prednisolon','VD-11007-10',1001,50097,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4230,388,'FAR003','Farzincol 10mg, H/100','','','Viên','Kẽm Gluconat','',1001,50097,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4229,387,'FAR002','Farzincol syrup 90ml','','','Chai','Kẽm Gluconat','',1001,50097,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4075,233,'FAZ001','FAZ, H/30','','','Hộp','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4308,465,'FEL001','Felodipin STADA 5mg, H/100','','','Viên','Felodipine','',1001,50097,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4058,216,'FEM001','Femibion Step 1, H/30','','','Hộp','','',1001,50067,942,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4059,217,'FEM002','Femibion Step 1, H/60','','','Hộp','','',1001,50067,942,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4060,218,'FEM003','Femibion Step 2, H/30','','','Hộp','','',1001,50067,942,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4312,469,'FEN004','Fenofibrate 200mg, H/30','','','Viên','Fenofibrate micronised','',1001,50097,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4215,373,'FER002','Feritonic, H/20A','','','Tuýp','','',1001,50097,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4245,403,'FER003','Ferlin Syrup 30ml','','','Chai','','',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4246,404,'FER004','Ferlin Syrup 60ml','','','Chai','','',1001,50097,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4110,268,'FER001','Ferrovit, H/50','','','Viên','Sắt Fumarat + Folic acid + B12','',1001,50097,846,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3270,37,'FIC001','Ficdal 100mg, H/100','','','Viên','Doxicyclin','',1001,50097,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3190,10,'FIM001','Fimadro-500, H/100','','','Viên','Cefadroxil','',1001,50097,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3299,65,'FIX001','Fixnat 100mg, H/30','','','Viên','Cefpodoxim','',1001,50097,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4289,446,'FLA002','Flagentyl 500mg, H/4','','','Viên','Secnidazol','',1001,50097,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4672,813,'FLU006','Flucinar 15g','','','Tuýp','','VN-9811-10',1022,50078,988,170);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4258,416,'FLU005','Fluconazol Stada 150mg, H/1','','','Viên','Fluconazol','VD-18110-12',1001,50097,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3392,139,'FOO001','Foocgic 150mg, H/1','','','Viên','Fluconazol','',1001,50097,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4530,671,'FOR004','Fortec 25mg, H/50','','','Viên','Biphenyl-dimethyl-dicarboxylate','VD-15314-11',1001,50097,968,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4767,908,'FUB001','Fubenzol 500mg, H/1','','','Viên','Mebendazol','VD-20552-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4284,442,'FUC001','Fucidin H 15g Cream 1%','','','Tuýp','Acid fusidic + Hydrocortisone acetate','',1021,50082,978,100);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4768,909,'FUG001','Fugacar, H/1','','','Viên','Mebendazol','VN-16500-13',1001,50097,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5169,1160,'GAC014','Gạc tiệt trùng Bảo Thạch 10*10 6 lớp','','','Bịch','','',1025,50110,1148,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5167,1158,'GAC012','Gạc tiệt trùng Bảo Thạch 5*6,5cm 12 lớp, T/100','','','Gói','','',1025,50110,1148,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5168,1159,'GAC013','Gạc tiệt trùng Bảo Thạch 8*10 12 lớp','','','Gói','','',1025,50110,1148,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4836,972,'GAC008','Gạc tiệt trùng Đông Pha 5*6cm','','','Gói','','',1025,50110,1020,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4837,973,'GAC009','Gạc tiệt trùng Đông Pha 8*9cm','','','Gói','','',1025,50110,1020,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4887,1022,'GAC011','Gạc Vaselin Milopha','','','Miếng','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4886,1021,'GAC010','Gạc Vaselin Nam Hùng Phương','','','Miếng','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4825,962,'GAN013','Găng tay có bột vGlove M, H/100','','','Đôi','','',1025,50110,1093,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4824,961,'GAN012','Găng tay có bột vGlove S, H/100','','','Đôi','','',1025,50110,1093,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4893,1028,'GAN015','Găng tiệt trùng số 7','','','Đôi','','',1025,50110,1184,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4852,988,'GAN014','Găng tiệt trùng số 7,5','','','Đôi','','',1025,50110,1184,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4124,282,'GAS001','Gastropulgic, H/30','','','Gói','Attapulgite mormoiron','',1001,50097,769,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4938,1065,'GAT001','Gatanin 500mg, H/20','','','Viên','Acetyl-DL-leucine','VD-9394-09',1001,50097,1099,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4119,277,'GAV001','Gaviscon 10ml, H/24','','','Gói','Natri alginate + Natri bicarbonate + Calci carbonate','VN-13849-11',1001,50097,770,75);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4271,429,'GEL008','Gel-triseo 10g','','','Tuýp','','',1021,50082,974,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4753,894,'GEL011','Gel Durex bôi trơn K-Y 50g','','','Hộp','','',1025,50051,859,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4748,889,'GEL009','Gel Durex bôi trơn Play Tingle 100ml','','','Chai','','',1025,50051,0,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4749,890,'GEL010','Gel Durex bôi trơn Play Warming 100ml','','','Chai','','',1025,50051,0,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3271,38,'GEN013','Gentamycin Kabi 80mg/2ml, H/100A','','','Ống','Gentamicin','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5211,1194,'GEN019','Gentamycin Kabi 80mg/2ml, H/50A','','','Ống','Gentamicin','VD-20944-14',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4670,811,'GEN018','Gentri-sone Cream 10g, H/20','','','Tuýp','','VD-9811-09',1022,50078,1141,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4979,1083,'GIA019','Giác hơi Vali đen (B)','','','Bộ','','',1025,50056,1111,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4522,663,'GIA016','Giải độc rượu - bảo vệ gan siro','','','Chai','','33873/2015/ATTP-XNCB',1001,50067,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4521,662,'GIA015','Giải độc rượu - bảo vệ gan, H/4','','','Hộp','','34625/2015/ATTP-XNCB',1001,50067,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5178,1164,'GIA020','Giảm cân Áo đình, H/30','','','Hộp','','19073/2015/ATTP-XNCB',1001,50067,1152,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5179,1165,'GIA021','Giảm cân New Lishou, H/45v','','','Viên','','12159/2013/ATTP-XNCB',1001,50067,1153,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4541,682,'GIA018','Giảo cổ lam Tuệ Linh, H/100','','','Lọ','','14100/2013/ATTP-XNCB',1001,50067,1049,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4540,681,'GIA017','Giảo cổ lam Tuệ Linh, H/60','','','Lọ','','14100/2013/ATTP-XNCB',1001,50067,1049,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4646,787,'GIN003','Ginko Coffee','','','Hộp','','',1001,50067,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4485,632,'GIN002','Ginko Melatonin, H/100','','','Viên','Ginkgo biloba + Melatonin','7878/2015/ATTP-XNCB',1001,50097,841,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4606,747,'GLI004','Glizadinax 80mg, H/30','','','Viên','Gliclazide','VD-11085-10',1001,50097,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3272,39,'GLO001','Glocip 500mg, H/30','','','Viên','Ciprofloxacin','',1001,50097,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4040,198,'GLO002','Glotakan 40, H/30','','','Viên','Ginkgo biloba','',1001,50097,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4041,199,'GLO003','Glotakan 60, H/20','','','Viên','Ginkgo biloba','',1001,50097,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4042,200,'GLO004','Glotakan 80, H/20','','','Viên','Ginkgo biloba','',1001,50097,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5316,1256,'GLO006','Glotal 500mg, H/100','','','Viên','Mephenesin','VD-7500-09',1001,50097,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5027,1112,'GLO005','Glotavate-N 0,05% 20g','','','Tuýp','Clobetasol Propionate + Neomycin Sulphate','VN-5669-10',1022,50078,753,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4603,744,'GLU029','Glucophage 500mg, H/50','','','Viên','Metformin','VN-13272-11',1001,50097,1067,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4604,745,'GLU030','Glucophage Tab 850mg, H/100','','','Viên','Metformin','VN-14744-12',1001,50097,1067,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3323,86,'GLU023','Glucosamin 500mg, H/100','','','Viên','Glucosamin','',1001,50097,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4642,783,'GLU033','Glucosamin 500mg, H/100','','','Viên','Glucosamin','162/2012/YT-CNTC',1001,50067,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4769,910,'GLU034','Glucose 5% 500ml, T/10','','','Chai','Glucose','VD-16418-12',1019,50068,1087,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4010,168,'GLU028','Glucose Kabi 30% 5ml, H/50','','','Ống','Glucose','VD-18042-12',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5331,1271,'GLU036','Glucovance 500mg/2,5mg, H/30','','','Viên','Metformin + Glibenclamid','VN-8829-09',1001,50097,1067,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4607,748,'GLU031','Glumerif 2mg, H/30','','','Viên','Glimepirid','VD-21780-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4608,749,'GLU032','Glumerif 4mg, H/30','','','Viên','Glimepirid','VD-11444-10',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4674,815,'GLY001','GlyDerm Cream 60ml','','','Tuýp','','80437/2013/CBMP-QLD',1022,50057,990,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4285,443,'GOT005','Gót sen cream 20g','','','Tuýp','','',1021,50062,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4543,684,'GOU001','Gout Tâm Bình','','','Lọ','','19878/2013/ATTP-XNCB',1001,50067,834,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4128,286,'GRA002','Grafort 20ml, H/20','','','Gói','Dioctadral smectite','',1001,50097,871,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4204,362,'GRA003','Graxidcure 500mg, H/100','','','Viên','Nalidixic acid','',1001,50097,787,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4612,753,'GRE001','Green Hair, H/60','','','Hộp','','3542/2014/ATTP-XNCB',1001,50067,1069,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4268,426,'GRI002','Griseofulvin 500mg, H/20','','','Viên','Griseofulvin','',1001,50097,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5346,1286,'HAT004','Hà thủ ô, H/100v','','','Viên','Cao hà thủ ô','VD-12136-10',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4941,1068,'HAA001','Haas Multivitamin, H/12/Tub/20','','','Tuýp','','12356/2013/ATTP-XNCB',1001,50067,850,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4208,366,'HAF004','Hafixim 100mg, H/24g','','','Gói','Cefixim','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4209,367,'HAF005','Hafixim 50mg, H/24g','','','Gói','Cefixim','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4207,365,'HAF003','Hafixim DT 100mg, H/30','','','Viên','Cefixim','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5103,1141,'HAG007','Hagifen DHG 400mg, H/100','','','Viên','Ibuprofen','VD-20553-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3297,63,'HAG005','Hagimox 500mg, H/100','','','Viên','Amoxicillin','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3361,124,'HAG006','Hagizin 5mg, H/100','','','Viên','Flunarizin dihydroclorid','',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4443,600,'HAI001','HAICNEAL 500ml/Tube','','','Tuýp','','VN-15509-12',1025,50060,1035,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4026,184,'HAL005','Halofar 2mg, H/200','','','Viên','Haloperidol','',1001,50097,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4025,183,'HAL004','Haloperidol 1.5mg, H/50','','','Viên','Haloperidol','',1001,50097,929,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3362,125,'HAL002','Halozam 425mg, H/100','','','Viên','Piracetam + Cinnarizin','',1001,50097,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4227,385,'HAN002','Haneuvit (3B), H/100','','','Viên','Vitamin B1 + B6 + B12','',1001,50097,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3324,87,'HAP004','Hapacol 150mg, H/24g','','','Gói','Paracetamol','VD-21137-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3325,88,'HAP005','Hapacol 250mg, H/24g','','','Gói','Paracetamol','VD-10001-10',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3326,89,'HAP006','Hapacol 325mg, H/100','','','Viên','Paracetamol','VD-20559-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3328,91,'HAP008','Hapacol 500mg Eff, H/16','','','Viên','Paracetamol','VD-20571-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3997,155,'HAP010','Hapacol 650mg, H/250','','','Viên','Paracetamol','VD-21138-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3998,156,'HAP011','Hapacol 80mg, H/24g','','','Viên','Paracetamol','VD-20561-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3327,90,'HAP007','Hapacol Blue 500mg, H/100','','','Viên','Paracetamol','VD-20563-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3329,92,'HAP009','Hapacol Codein 530mg Eff, H/16','','','Viên','Paracetamol+Codein','VD-10948-10',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4001,159,'HAP014','Hapacol CS Day, H/100','','','Viên','Paracetamol + Phenylephrine hydroclorid','VD-20568-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4002,160,'HAP015','Hapacol đau nhức 525mg, H/50','','','Viên','Paracetamol + Ibuprofen','VD-20569-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3999,157,'HAP012','Hapacol Flu 150mg, H/24g','','','Gói','Paracetamol+Chlorpheniramin','VD-20557-14',1001,50097,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4000,158,'HAP013','Hapacol Flu 250mg, H/24g','','','Gói','Paracetamol+Chlorpheniramin','VD-12744-10',1001,50098,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3256,23,'HAP003','Hapenxin 250mg, H/24g','','','Gói','Cefalexin','',1001,50098,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4292,449,'HAP016','Hapenxin HT 500mg, H/100','','','Viên','Cefalexin','',1001,50098,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4266,424,'HAS002','HasanClar 500mg, H/28','','','Viên','Clarithromycin','',1001,50098,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5200,1185,'HEM007','HemoQ mom, H/30','','','Hộp','Sắt + Acid folic + Vitamin B12','VN-9631-10',1001,50098,777,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4657,798,'HEP003','Hepatymo 300mg, H/30','','','Viên','Tenofovir disoproxil fumarat','VD-21746-14',1001,50098,1078,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4372,529,'HEX003','Hexinvon 4mg, H/100','','','Viên','Bromhexin','',1001,50098,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4130,288,'HID002','Hidrasec 10mg Infants, H/16','','','Gói','Racecadotril','',1001,50098,763,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4129,287,'HID001','Hidrasec 30mg Children, H/30','','','Gói','Racecadotril','',1001,50098,763,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4681,822,'HIR001','Hiruscar gel 5g','','','Tuýp','','',1022,50078,992,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4404,561,'HOA024','Ho Astex 90ml','','','Chai','','',1001,50098,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5246,1219,'HOT002','Hộ tâm đơn, L/45','','','Lọ','','',1001,50053,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4626,767,'HOA027','Hoàn an thần, H/10','','','Hộp','','VD-12138-10',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4549,690,'HOA026','Hoàng Thống Phong, L/60','','','Hộp','','17539/2013/ATTP-XNCB',1001,50067,1050,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4067,225,'HOA022','Hoàng Tố Nữ, H/60','','','Hộp','','',1001,50067,948,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4653,794,'HOA028','Hoạt huyết CM3, H/30','','','Hộp','','6762/2013/ATTP-XNCB',1001,50067,827,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5187,1172,'HOA031','Hoạt huyết dưỡng não DHG, H/60','','','Viên','Cao Bạch quả + Cao Đinh lăng','VD-7429-09',1001,50098,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4251,409,'HOA023','Hoạt huyết dưỡng não, H/100','','','Viên','Cao Bạch quả + Cao Đinh lăng','VD-9935-10',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4444,601,'HOA025','Hoạt huyết Nhất Nhất, H/30','','','Hộp','','V273-H12-13',1001,50098,829,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4234,392,'HOM001','Homtamin ginseng, H/60','','','Viên','','',1001,50099,848,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4573,714,'HUT004','Hút mũi 2 dây - Nam Phụng','','','Cái','','',1025,50056,1062,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4570,711,'HUT003','Hút mũi Bo','','','Cái','','',1025,50056,1060,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4569,710,'HUT002','Hút mũi con voi trắng','','','Cái','','',1025,50056,1059,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5345,1285,'HUT007','Hút mũi Honey','','','Cái','','',1025,50110,1183,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4863,999,'HUT005','Hút sữa Breast Pump','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4944,1070,'HUT006','Hút sữa TANAKO','','','Cái','','',1025,50056,1102,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4527,668,'HYD004','Hydrite H/100','','','Viên','','VD-11372-10',1001,50099,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5005,1102,'HYD005','Hydrocortison 100mg Inj','','','Lọ','Hydrocortison','VD-15382-11',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5028,1113,'HYD006','Hydrocortison 125/25 5ml','','','Lọ','Hydrocortisone','VN-17952-14',1015,50069,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4930,1057,'HYP002','Hyposufen, H/100','','','Viên','Cao khô Diệp hạ châu','2159/2015/ATTP-XNCB',1001,50067,962,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3330,93,'IBU002','Ibuparavic, H/100','','','Viên','Paracetamol+Ibuprofen+Cafein','',1001,50100,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4189,347,'IBU003','Ibuprofen 400mg, H/100','','','Viên','Ibuprofen','',1001,50101,964,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5112,1145,'IBU004','Ibuprofen Tablets USP 200mg, L/500','','','Viên','Ibuprofen','',1001,50101,1140,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5120,1146,'ICH005','Ích mẫu - TPC, H/20 Caps','','','Viên','Ích mẫu + Hương phụ + Ngãi cứu','VD-12143-10',1001,50101,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4046,204,'ICH004','Ích mẫu lợi nhi, H/20','','','Hộp','','',1001,50067,935,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3394,141,'IDA001','Idarac 200mg, H/20','','','Viên','Floctafenine','',1001,50101,880,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4299,456,'IMD003','Imdur 30mg, H/30','','','Viên','Isosorbide-5-mononitrate','',1001,50101,779,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4300,457,'IMD004','Imdur 60mg, H/30','','','Viên','Isosorbide-5-mononitrate','',1001,50102,779,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3331,94,'INF005','Inflazym 10mg, H/100','','','Viên','Serratiopeptidase','',1001,50102,751,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4310,467,'IRB001','Irbevel 150mg, H/28','','','Viên','Irbesartan','',1001,50102,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4267,425,'IZO001','Izol Marksans, H/10','','','Viên','Itraconazol','',1001,50102,730,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4078,236,'JEX001','Jex Max, H/30','','','Hộp','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4087,245,'JOI001','Joint Max, H/60','','','Hộp','','',1001,50067,956,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4304,461,'KAL004','Kaleorid 600mg, H/30','','','Viên','Potassium chloride','',1001,50102,847,58);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4253,411,'KEF002','Kefcin 125mg, H/24g','','','Gói','Cefaclor','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4252,410,'KEF001','Kefcin 375mg, H/10','','','Viên','Cefaclor','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4684,825,'KEM008','Kem bôi Sulfadiazine bạc (Silvirin) 20g','','','Tuýp','','VN-8868-09',1022,50078,993,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4744,885,'KEM009','Kem dưỡng da Johnsons Baby Cream 50g','','','Lọ','','',1022,50058,986,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4273,431,'KEM006','Kem nghệ Beaumore 10g','','','Tuýp','','',1021,50082,975,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4274,432,'KEM007','Kem nghệ Beaumore 40g','','','Tuýp','','',1021,50082,975,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4272,430,'KEM005','Kem nghệ Thái Dương 20g, L/10','','','Tuýp','','',1021,50082,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4088,246,'KEM004','Kem Sắc Ngọc Khang 10g','','','Lọ','','',1021,50058,949,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4971,1078,'KEO002','Kéo 16cm thẳng 2 nhọn','','','Cái','','',1025,50056,1107,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4853,989,'KEO001','Kéo 16cm thẳng nhọn','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5330,1270,'KEO008','Kẹo Codatux, H/100 vỉ','','','Vỉ','','7170/2014/ATTP-XNCB',1002,50064,1028,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4484,631,'EUG002','Kẹo Eugica Candy C/400','','','Viên','','',1002,50062,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4483,630,'EUG001','Kẹo Eugica Candy, H/100','','','Viên','','4015/2013/ATTP-XNCB',1002,50062,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5015,1107,'KEO007','Kẹo Eugica Candy, Túi/300','','','Viên','','',1002,50063,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4489,636,'PUL004','Kẹo ngậm Pulmoll','','','Hộp','','',1002,50062,989,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4994,1091,'KEO003','Kẹo Xylitol Lotte (gói)','','','Gói','','',1002,50064,1114,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4995,1092,'KEO004','Kẹo Xylitol Lotte (lọ)','','','Lọ','','',1002,50064,1114,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4997,1094,'KEO005','Kẹo Xylitol Orion (gói)','','','Gói','','',1002,50062,1113,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4998,1095,'KEO006','Kẹo Xylitol Orion (lọ)','','','Lọ','','',1002,50062,1113,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5043,1126,'KEP003','Kẹp rún trẻ sơ sinh','','','Cái','','13/2015/BYT-TB-CT',1025,50110,1072,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4259,417,'KET005','Ketoconazole 200mg, H/20','','','Viên','Ketoconazol','',1001,50102,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4368,525,'KET006','Ketosan 1mg, H/30','','','Viên','Ketotifen','',1001,50102,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5327,1267,'KHA018','Khăn giấy Cecily (Napkin)','','','Bịch','','',1025,50110,1178,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4883,1018,'KHA012','Khăn giấy Thùy Trang (Napkin)','','','Bịch','','',1025,50110,1177,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4745,886,'KHA004','Khăn ướt Baby Wipes 80sheets','','','Hộp','','',1025,50110,1082,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4838,974,'KHA005','Khẩu trang Greetmed Trắng, H/50','','','Cái','','',1025,50110,1095,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4945,1071,'KHA015','Khẩu trang Greetmed Xanh, H/50','','','Cái','','',1025,50110,1095,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4859,995,'KHA010','Khẩu trang hình trẻ em Greetmed, H/50','','','Cái','','',1025,50110,1095,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4839,975,'KHA006','Khẩu trang Malay, H/50','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4840,976,'KHA007','Khẩu trang Mediprotek 3 lớp, H/50','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5044,1127,'KHA017','Khẩu trang Nam Anh - Đen, H/50','','','Cái','','',1025,50110,1096,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4841,977,'KHA008','Khẩu trang Nam Anh - Hồng, H/50','','','Cái','','',1025,50110,1096,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4854,990,'KHA009','Khẩu trang Nam Anh - Xanh, H/50','','','Cái','','',1025,50110,1096,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4897,1031,'KHA013','Khẩu trang Promask 3lớp, H/50','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4898,1032,'KHA014','Khẩu trang Promask 4lớp, H/50','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4866,1001,'KHA011','Khẩu trang trẻ em Danemeco, H/50','','','Cái','','',1025,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4947,1073,'KHA016','Khẩu trang vàng CATENA (Than), H/50','','','Cái','','',1025,50110,1105,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4844,980,'KIM034','Kim cánh bướm 23 Nylon','','','Cây','','',1015,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4787,928,'KIM032','Kim luồn Introcan Safety 24G, H/50','','','Cái','','',1010,50110,1087,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4788,929,'KIM033','Kim luồn Vasofix Safety 22G, H/50','','','Cái','','',1010,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4634,775,'KIM031','Kim miễn khang, H/30','','','Hộp','','17537/2013/ATTP-XNCB',1001,50053,946,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4890,1025,'KIM035','Kim Novofine 31G, H/100','','','Cái','','',1015,50110,0,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4536,677,'KIM030','Kim tiền thảo - Râu mèo, H/100','','','Lọ','Kim tiền thảo + Râu mèo','VD-7430-09',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4144,302,'KIZ001','Kizemit-S, H/100','','','Viên','Magnesi hydroxyd + Nhôm hydroxyd +Simethicon','',1003,50084,766,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3273,40,'KLA002','Klamentin 1g, H/14','','','Viên','Amoxicillin + Acid Clavulanic','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3274,41,'KLA003','Klamentin 250mg, H/24g','','','Gói','Amoxicillin + Acid Clavulanic','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3275,42,'KLA004','Klamentin 625mg, H/12','','','Viên','Amoxicillin + Acid Clavulanic','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3276,43,'KLA005','Klamex 1g, H/14','','','Viên','Amoxicillin + Acid Clavulanic','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3277,44,'KLA006','Klamex 625mg, H/12','','','Viên','Amoxicillin + Acid Clavulanic','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4652,793,'KOL001','Koligin D-870, H/60','','','Viên','','17547/2013/ATTP-XNCB',1001,50067,0,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4143,301,'KRE001','Kremil-S, H/100','','','Viên','Magnesi hydroxyd + Nhôm hydroxyd +Simethicon','',1003,50084,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4943,1069,'KUP002','Kupmebamol 500mg, H/100','','','Viên','Methocarbamol','VD-10799-10',1001,50102,848,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4117,275,'LAB001','Labavie, H/30','','','Gói','Lactobacillus acidophilus + Bacillus subtilis','',1001,50102,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4459,616,'LAC007','Lactacyd BB 250ml','','','Chai','','VD-8048-09',1025,50061,741,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4460,617,'LAC008','Lactacyd BB 60ml','','','Chai','','VD-8048-09',1025,50061,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4461,618,'LAC009','Lactacyd FH 250ml','','','Chai','','VD-16272-12',1025,50061,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4665,806,'LAC012','Lactacyd FH 60ml','','','Chai','','',1022,50062,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4458,615,'LAC006','Lactacyd Milky for baby 250ml','','','Chai','','002402/11/CBMP-HCM',1025,50061,741,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4664,805,'LAC011','Lactacyd Milky for baby 250ml (+)','','','Chai','','002402/11/CBMP-HCM',1022,50062,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4462,619,'LAC010','Lactacyd Milky for baby 60ml','','','Chai','','002402/11/CBMP-HCM',1025,50061,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4445,602,'LAC005','Lactomin, H/60','','','Viên','Lactobacillus acidophilus + Difidobacterium longum + Streptococcus faecalis','3407/1014/ATTP-XNCB',1001,50067,1036,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4286,444,'LAD001','Ladysofts Premium 100ml','','','Chai','','',1022,50062,981,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4699,840,'LAM005','Lamivudin STADA 100mg, H/30','','','Viên','Lamividine','VD-21099-14',1001,50102,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4016,174,'LAR001','Laroscorbine 1000mg/5ml, H/6A','','','Ống','Vitamin C','',1015,50069,849,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4017,175,'LAR002','Laroscorbine 500mg/5ml, H/6A','','','Ống','Vitamin C','',1015,50069,849,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3278,45,'LEC001','Lecefti-200, H/10','','','Viên','Cefixim','',1001,50102,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5223,1201,'LEO001','Leolen fort, H/30','','','Viên','Cytidine + Uridine','VD-11071-10',1001,50102,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5100,1138,'LEV002','Levigatus 20g','','','Tuýp','Cetrimid + Tinh chất nghệ','VD-16371-12',1025,50074,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3253,20,'LEX001','Lexinmingo 500mg, H/100','','','Viên','Cefalexin','',1001,50102,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5258,1231,'LEX002','Lexomil 6mg, H/30','','','Viên','Bromazepam','',1001,50102,844,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4074,232,'LIC001','Lic, H/60','','','Hộp','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5040,1123,'LID008','Lidocain 2%, H/100 - Uphace','','','Ống','Lidocain','VD-11203-10',1015,50069,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4020,178,'LID007','Lidocain Kabi 2%, H/100','','','Ống','Lidocain','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3279,46,'LIN001','Lincomycin 500mg, H/100','','','Viên','Lincomycin','',1001,50102,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4640,781,'LIN002','Linh tự đan, H/30','','','Hộp','','7493/2013/ATTP-XNCB',1001,50067,1074,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4701,842,'LIP001','Lipistad 10, H/30','','','Viên','Atorvastatin','VD-11970-10',1001,50102,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4702,843,'LIP002','Lipitin A - 10mg, H/100','','','Viên','Atorvastatin','VN-12015-11',1001,50102,964,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4877,1012,'LIP003','Lipofundin MCT/LCT 10% 250ml, H/10','','','Chai','','',1019,50068,1087,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5030,1115,'LIS005','Lisonorm 5/10, H/30','','','Viên','Amlodipin + Lisinopril','VN-13128-11',1001,50102,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4094,252,'LIS003','Listerine 250ml','','','Chai','','',1061,50059,859,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4095,253,'LIS004','Listerine 750ml','','','Chai','','',1061,50059,859,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4093,251,'LIS002','Listerine 80ml','','','Chai','','',1061,50059,859,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4645,786,'LIV003','Liverton 140mg, H/100','','','Viên','Sylymarin','VD-15890-11',1001,50102,965,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5205,1190,'LIV004','Liverton 70mg, H/100','','','Viên','Silymarin','VD-15891-11',1001,50102,965,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5213,1196,'LOC003','Lộc Tiên Trà, H/15','','','Hộp','','20752/2013/ATTP-XNCB',1001,50067,1158,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4302,459,'LOD003','Lodimax 10mg, H/20','','','Viên','Amlodipin','',1001,50102,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4301,458,'LOD002','Lodimax 5mg, H/20','','','Viên','Amlodipin','',1001,50102,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4139,297,'LOP001','Loperamid 2mg, H/100','','','Viên','Loperamid','',1001,50102,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4353,510,'LOR002','Lorastad 10mg, H/100','','','Viên','Loratadin','',1001,50102,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4715,856,'LOS002','Losartan STADA 50mg, H/30','','','Viên','Losartan','VD-20373-13',1001,50102,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5002,1099,'LOS003','Lostad HCT 50/12,5mg, H/30','','','Viên','Losartan + Hydroclorothizid','VD-12622-10',1001,50102,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4322,479,'LUV001','Luverican 10ml','','','Lọ','Polyvinyl alcohol','',1042,50072,810,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3332,95,'MAC005','Macnir 50mg, H/50','','','Viên','Eperison','VN-11170-10',1001,50102,752,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4305,462,'MAD004','Madopar 250mg, H/30','','','Viên','Levodopa + Benserazide','',1001,50102,844,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4024,182,'MAG009','Magne - B6 corbiere 475mg, H/50','','','Viên','Magnesi - B6','',1001,50102,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4023,181,'MAG008','Magnesi-B6 475mg, H/100','','','Viên','Magnesi - B6','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4018,176,'MAG007','Magnesium Sulphate 15% (1,5g/10ml), H/50A','','','Ống','Magne sulfat','',1015,50069,928,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4029,187,'MAL002','Maleutyl 500mg, H/30','','','Viên','Acetyl-DL-leucine','',1001,50102,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5307,1255,'MAM003','Mama sữa non Baby A0 6g, H/4','','','Gói','','15080/2013/ATTP-XNCB',1001,50067,1075,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4643,784,'MAM001','Mama sữa non Baby A0 9g, H/4','','','Gói','','15080/2013/ATTP/XNCB',1001,50067,1075,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4644,785,'MAM002','Mama sữa non GOLD, H/4','','','Gói','','1869/2011/YT-CNTC',1001,50067,1075,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5342,1282,'MAM004','Mama sữa non New A0, H/4','','','Gói','','',1001,50067,1075,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3333,96,'MAR004','Markoxib 200mg, H/30','','','Viên','Celecoxib','',1001,50102,730,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4595,736,'MAR007','Marvelon, H/21','','','Hộp','Ethinyl Estradiol + Desogestrel','VN-8887-09',1001,50102,822,156);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4332,489,'MAX004','Maxitrol Drop 5ml','','','Lọ','Neomycin + Polymicin B + Dexamethasol','',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5056,1129,'MAY079','Máy đo huyết áp bắp tay OMRON HEM-7120','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4966,1075,'MAY077','Máy đo Huyết áp bắp tay Rossmax AW-150','','','Cái','','',1025,50056,1106,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4965,1074,'MAY076','Máy đo Huyết áp cổ tay Omron HEM-6121','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4970,1077,'MAY081','Máy xông khí dung Omron NE-C802','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4967,1076,'MAY078','Máy xông khí dung Omron NE-C803','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4831,968,'MAY073','Máy xông khí dung Omron NE C29','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4832,969,'MAY074','Máy xông khí dung Omron NE C801','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4833,970,'MAY075','Máy xông khí dung Omron NE C803S','','','Cái','','',1025,50056,1058,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4163,321,'MEB006','Mebilax 15mg, H/20','','','Viên','Meloxicam','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4162,320,'MEB005','Mebilax 7.5mg, H/20','','','Viên','Meloxicam','',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3334,97,'MEB003','Mebsyn 135mg, H100','','','Viên','Mebeverin','',1001,50102,753,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4692,833,'MED023','Medcardil 5, H/100','','','Viên','Enalapril','VN-15971-12',1001,50102,788,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4175,333,'MED020','Medrol 16mg, H/30','','','Viên','Methyl prednisolon','',1001,50102,760,105);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3335,98,'MED015','Medrol 4mg, H/30','','','Viên','Methyl prednisolon','',1001,50102,760,105);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4689,830,'MED022','Medskin 5%','','','Tuýp','Acyclovir','VD-19281-13',1022,50078,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4269,427,'MED021','Medskin Aciclovir 200mg, H/50','','','Viên','Acyclovir','VD-20576-14',1001,50102,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5234,1210,'MED024','Medskin Aciclovir 400mg, H/60','','','Viên','Aciclovir','VD-22034-14',1001,50103,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5235,1211,'MED025','Medskin Aciclovir 800mg, H/30','','','Viên','Aciclovir','VD-22035-14',1001,50103,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3354,117,'MEF001','Mefenamic acid STADA, L/100','','','Viên','Acid Mefenamic','',1001,50103,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5337,1277,'MEF002','Meflavon 500mg, H/30','','','Viên','Rutin','VD-15224-11',1001,50103,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4264,422,'MEG003','Megyna, H/10','','','Viên','Nystatin + Metronidazol + Chloramphenicol + Dexamethasone','',1026,50072,736,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4708,849,'MEK003','Meko coramin, H/20','','','Viên','Nikethamid','VD-15225-11',1001,50103,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3192,12,'MEK002','Mekocepha 250mg, H/24','','','Gói','Cefalexin','',1001,50103,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3338,101,'MEL005','Meloxicam 15mg/1.5ml, H/5A','','','Ống','Meloxicam','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3337,100,'MEL004','Meloxicam 7.5mg, H/100','','','Viên','Meloxicam','',1001,50103,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3336,99,'MEL003','Meloxicam 7.5mg, H/100','','','Viên','Meloxicam','',1001,50103,755,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4763,904,'MEN002','Menison 40mg Inj','','','Hộp','Methyl prednisolon','VD-13983-11',1015,50069,965,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4145,303,'MEP001','Mepraz 20mg, H/20','','','Viên','Omeprazol','VN-12243-11',1001,50103,776,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4597,738,'MER001','Mercilon, H/21v','','','Hộp','Ethinyl Estradiol + Desogestrel','VN-18563-14',1001,50103,886,100);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5222,1200,'MET029','Metadroxyl 500mg, H/30','','','Viên','Metadoxin','VN-15993-12',1001,50103,791,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5197,1182,'MET028','Methylprednisolon 16mg, H/30','','','Viên','Methyl prednisolon','VD-19818-13',1001,50103,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5196,1181,'MET027','Methylprednisolon 4mg, H/100','','','Viên','Methyl prednisolon','VD-21783-14',1001,50103,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3339,102,'MET020','Metoclopramid 10mg, H/12A','','','Ống','Metoclopramid','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3280,47,'MET018','Metronidazol 250mg, H/100','','','Viên','Metronidazol','',1001,50104,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4262,420,'MET023','Metronidazol 250mg, H/20','','','Viên','Metronidazol','VD-10731-10',1001,50104,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3281,48,'MET019','Metronidazol 500mg, H/100','','','Viên','Metronidazol','',1001,50104,728,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5195,1180,'MET026','Metronidazol DHG 250mg, H/100','','','Viên','Metronidazol','VD-22036-14',1001,50104,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4618,759,'MEZ002','Mezathin 500mg, H/60','','','Viên','L-Ornithin + L-Aspartat','VD-22152-15',1001,50104,936,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3298,64,'MIB002','Mibedotil 100mg, H/30','','','Gói','Cefpodoxim','',1001,50104,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3363,126,'MIB003','Mibeserc 16mg, H/60','','','Viên','Betahistine dihydrochloride','',1001,50104,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4698,839,'MIC007','Micardis 40mg, H/30','','','Viên','Telmisartan','VN-18820-15',1001,50104,746,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4174,332,'MID005','Midasol, H/100','','','Viên','','',1001,50104,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4741,882,'MIE001','Miếng dán hạ sốt MITOYO, H/8','','','Miếng','','',1023,50077,1080,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5240,1213,'MIF002','Mifepriston 10mg-Ceteco, H/1','','','Viên','Mifepristone','000506/14/CBMP-HCM',1001,50104,1164,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4446,603,'MIF001','Mifestad 10mg, H/1','','','Viên','Mifepristone','QLĐB-465-14',1001,50104,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4468,625,'MIL005','Milian 18ml, L/10','','','Lọ','Xanh methylen + Tím gentian','VNS-0432-06',1021,50082,772,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4188,346,'MIL004','Milurit 300mg, H/30','','','Viên','Allopurinol','',1001,50104,738,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3340,103,'MIS001','Misobenal 50mg, H/30','','','Viên','Eperison','',1001,50105,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4602,743,'MIS002','Misoprostol STADA 200mcg, H/30','','','Viên','Misoprostol','VD-13626-10',1001,50105,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4366,523,'MIT003','Mitux 200mg, H/24g','','','Gói','Acetylcystein','',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4365,522,'MIT002','Mitux E 100mg, H/24g','','','Gói','Acetylcystein','',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4918,1052,'MIX003','Mixtard 30 flexpen 100UI/ml, H/5x3ml','','','Cây','','VN-11010-10',1015,50069,1098,58);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4019,177,'MOB003','Mobic 15mg/1.5ml, H/5A','','','Ống','Meloxicam','',1015,50069,794,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4171,329,'MOB004','Mobic 7.5mg, H/20','','','Viên','Meloxicam','',1001,50105,746,84);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4161,319,'MOC008','Mộc hoa trắng HT, H/100','','','Viên','Cao Mộc hoa trắng + Berberin clorid + Mộc hương','',1001,50105,963,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4154,312,'MOD001','Modom''S 10mg, H/100','','','Viên','Domperidon','',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4447,604,'MOF001','Moflox 400mg, H/5','','','Viên','Moxifloxacin','VD-16454-12',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4134,292,'MOT002','Motalv Plus, H/20','','','Viên','Alverin + Simethicon','VD-13466-10',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4159,317,'MOT003','Motilium-M 30ml','','','Chai','Domperidon','',1001,50105,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4160,318,'MOT004','Motilium-M 60ml','','','Chai','Domperidon','',1001,50105,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5253,1226,'MOX004','Moxieye 2ml','','','Ống','Moxifloxacin','VD-22001-14',1042,50072,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4356,513,'MUC002','Mucimed 50mg, H/30','','','Viên','Eprazinone hydrocloride','',1001,50105,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4409,566,'MUL003','Multivitamin, L/500','','','Chai','','',1001,50105,857,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5338,1278,'MUL004','Multivitamin, L/500-Nic','','','Lọ','','',1001,50067,962,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4364,521,'MUS001','Muscosolvan 30mg, H/20','','','Viên','Ambroxol','',1001,50105,746,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3341,104,'MYD004','Mydocalm 150mg, H/30','','','Viên','Tolperison','',1001,50105,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5274,1239,'MYK001','Mykezol kem 10g, B/10','','','Tuýp','Ketoconazol','',1025,50074,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4190,348,'MYS001','Mysobenal 50mg, H/30','','','Viên','Eperison','',1001,50105,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4127,285,'MYT002','Mytolan 10ml, H/20','','','Gói','Magnesi hydroxyd + Nhôm hydroxyd +Simethicon','',1001,50105,777,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4733,874,'NAB001','Nabiphar 5g, H/10','','','Gói','Natri bicarbonat','VD-15398-11',1025,50074,983,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5275,1240,'NAC001','Nacofar 60ml Chai Xịt','','','Chai','Natri clorid','',1038,50068,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3282,49,'NAL004','Nalidixic 500mg, H/100','','','Viên','Nalidixic acid','',1001,50105,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4842,978,'NAN001','Nạng gỗ','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4148,306,'NAT014','Natri Bicarbonat 500mg, L/160','','','Viên','Natri hydrocarbonat','',1001,50105,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5306,1254,'NAT022','Natri clorid 0,9%, 10ml - Bidiphar','','','Lọ','Natriclorid','VD-14253-11',1042,50072,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5344,1284,'NAT023','Natri clorid 0,9%, 10ml - HD','','','Lọ','Natriclorid','VD-20201-13',1042,50072,811,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4319,476,'NAT015','Natri clorid 0,9%, 10ml - Pharmedic','','','Lọ','Natri chlorid','',1042,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5347,1287,'NAT024','Natri clorid 0,9%, 10ml - Traphaco','','','Lọ','Natriclorid','VD-18075-12',1042,50072,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4770,911,'NAT019','Natriclorid 0.9% 500ml, T/10','','','Chai','Natri chlorid','VD-16420-12',1019,50068,1087,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4630,771,'NAT016','NattoEnzym, H/30','','','Viên','','12300/2011/YT-CNTC',1001,50053,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4631,772,'NAT017','Nattokan, H/30','','','Viên','','21694/2013/ATTP-XNCB',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4069,227,'NAT013','Natural Vitamin E-400IU, H/100','','','Hộp','','',1001,50067,950,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4648,789,'NAT018','Naturen Z, H/100','','','Viên','','VD-6682-09',1001,50067,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3364,127,'NAU001','Nautamin 90mg, H/80','','','Viên','Diphenhydramine diacefylline','VD-19726-13',1001,50105,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4048,206,'NAV002','Navis Care, H/30','','','Hộp','','',1001,50067,868,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4047,205,'NAV001','Navisat, H/60','','','Hộp','','',1001,50067,868,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4137,295,'NEF001','Nefian 30mg, H/30','','','Viên','Lansoprazole','',1001,50105,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4369,526,'NEO015','Neo-Codion, H/20','','','Viên','Codein camphóulphonate + Sulfogaiacol + Grindelia','VN-18966-15',1001,50105,789,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4263,421,'NEO013','Neo-Tergynan, H/10','','','Viên','Metronidazol + Neomycin + Nystatin','',1026,50072,789,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4339,496,'NEO014','Neocin 5ml, L/10','','','Lọ','Neomycin sulfat','',1042,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4151,309,'NEO012','Neopeptin syrup 60ml','','','Chai','Alpha amylase + Papain','',1001,50105,778,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4448,605,'NEO016','Neopeptine Drop 15ml','','','Chai','','2564/2016/ATTP-XNCB',1001,50105,778,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4149,307,'NEO011','Neopeptine, H/100','','','Viên','Alpha amylase + Papain + Simethicone','',1001,50105,778,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4913,1047,'NEO017','Neotazin MR 35mg, H/30','','','Viên','Trimetazidin','',1001,50105,967,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4857,993,'NEP047','Nẹp cẳng tay ngắn 5-6-7-8 (Trái - Phải)','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4858,994,'NEP048','Nẹp đùi Zimmer số 7','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4940,1067,'NEP049','Nẹp ngón tay 3 chấu (Nhôm)','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4619,760,'NES002','Nesteloc 40mg, H/30','','','Viên','Esomeprazol','VD-20113-13',1001,50105,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4802,943,'NEU007','Neuronstad 300mg, H/100','','','Viên','Gabapentin','',1001,50063,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3375,138,'NEU004','Neuronstad 300mg, H/30','','','Viên','Gabapentin','',1001,50105,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4192,350,'NEU006','Neutrivit 5000, H/4','','','Viên','Vitamin B1 + B6 + B12','',1015,50069,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4596,737,'NEW001','New Choice, H/25, Vỉ/28v','','','Hộp','Ethinyl Estradiol + Levonogestrel','VD-14631-11',1001,50105,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4146,304,'NEX002','Nexium 40mg, H/28','','','Viên','Esomeprazol','',1001,50105,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5233,1209,'NEX003','Nexium mups 40mg, H/14','','','Viên','Esomeprazol','VN-11681-11',1001,50105,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5006,1103,'NGA004','Nga Phụ Khang, H/30','','','Hộp','','3842/2014/ATTP-XNCB',1001,50067,946,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4065,223,'NGA003','Nga Phụ Khang, H/60','','','Hộp','','',1001,50067,946,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4568,709,'NGH001','Nghiền thuốc lớn','','','Cái','','',1025,50056,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4562,703,'NHI004','Nhiệt kế dán trán Fevertemp','','','Cái','','',1025,50056,1054,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4565,706,'NHI007','Nhiệt kế điện tử Omron MC-246','','','Cái','','',1025,50056,1058,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4566,707,'NHI008','Nhiệt kế điện tử Procheck TH-186','','','Cái','','',1025,50056,1056,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4564,705,'NHI006','Nhiệt kế điện tử SAKURA DDK-101','','','Cái','','',1025,50056,1057,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4834,971,'NHI010','Nhiệt kế thủy ngân Greetmed','','','Cái','','',1025,50056,1095,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4563,704,'NHI005','Nhiệt kế thủy ngân Tokyo','','','Cái','','',1025,50056,1055,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4591,732,'NHI009','Nhiệt miệng Nhất Nhất, H/20','','','Hộp','','V274-H12-13',1001,50053,829,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4712,853,'NIF003','Nifedipin Hasan 20 Retard, H/30','','','Viên','Nifedipin','VD-16727-12',1001,50105,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4711,852,'NIF002','Nifedipin STADA 10mg, H/100','','','Viên','Nifedipin','VD-12597-10',1001,50105,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4257,415,'NIF001','Nifin 200mg, H/20','','','Viên','Cefpodoxim','',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4713,854,'NIT003','Nitromint 2.6mg, H/30','','','Viên','Nitroglycerin','VN-14162-11',1001,50105,738,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4714,855,'NIT004','Nitrostad retard 2.5mg, H/60','','','Viên','Nitroglycerin','VD-4961-08',1001,50105,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4558,699,'NIZ002','Nizoral Cream 10g','','','Tuýp','Ketoconazol','VN-13197-11',1021,50083,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4557,698,'NIZ001','Nizoral Cream 5g','','','Tuýp','Ketoconazol','VN-13197-11',1021,50083,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4559,700,'NIZ003','Nizoral Shampoo 2% 50ml','','','Chai','Ketoconazol','VN-14711-12',1022,50062,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3342,105,'NO-003','No-spa 40mg, H/50','','','Viên','Drotaverin hydrochloride','VD-12043-10',1001,50105,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5343,1283,'NOO002','Nootropil Tab 800mg, H/45','','','','Piracetam','VN-17717-14',1001,50105,1182,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3365,128,'NOO001','Nootropyl 1g/5ml, H/12A','','','Ống','Piracetam','',1015,50069,765,105);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4338,495,'NOS001','Nostravin 0.05% 8ml','','','Lọ','Xylometazolin','',1041,50072,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3283,50,'NOV002','Novadril 500mg, H/100','','','Viên','Cefadroxil','',1001,50105,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4198,356,'NUC003','Nucleo C.M.P Forte, H/3','','','Ống','Cytidine + Uridine','VN-18720-15',1015,50069,852,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4199,357,'NUC004','Nucleo C.M.P Forte, H/30','','','Viên','Cytidine + Uridine','13904/QLD-KD',1001,50105,852,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4987,1087,'NUC005','Nucoxia 120mg, H/100','','','Viên','Etoricoxib','VN-13084-11',1001,50105,1112,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4021,179,'NUO010','Nước cất 5ml, H/100','','','Ống','Nước cất','',1015,50069,736,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5254,1227,'NUO020','Nước đậu đen, hạnh nhân, óc chó Hàn Quốc, T/20b 195ml','','','Gói','','',1001,50063,0,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4667,808,'NUO014','Nước hoa Baby 50ml','','','Chai','','',1022,50062,986,167);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5230,1207,'NUO019','Nước muối súc miệng 500ml DP3/2, T/18','','','Chai','Natriclorid','VD-15359-11',1061,50072,1005,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4880,1015,'NUO016','Nước muối súc miệng 500ml, T/20','','','Chai','','',1061,50072,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5325,1265,'NUO022','Nước muối súc miệng 500ml, T/20 - Nam Hà','','','Chai','Natriclorid','',1061,50072,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4736,877,'NUO015','Nước oxy già 60ml, L/10','','','Lọ','','0065/2014/CBTC-YTVP',1025,50075,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4996,1093,'NUO017','Nước súc miệng T-B 500ml','','','Chai','','VS-4803-11',1061,50059,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4092,250,'NUO012','Nước súc miệng T-B Fresh 500ml','','','Chai','','',1061,50060,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4091,249,'NUO011','Nước súc miệng T-B Kid 250ml','','','Chai','','',1061,50060,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4449,606,'NUO013','Nước tắm trẻ em ROMBEBE 125ml','','','Chai','','001141/13/CBMP-HCM',1025,50061,982,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4579,720,'NYS006','Nyst, H/10, L/6H','','','Gói','Nystatin','VD-16027-11',1025,50075,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3284,51,'NYS004','Nystatin 500.000IU, H/16','','','Viên','Nystatin','',1001,50105,736,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4270,428,'NYS005','Nystatin 500.000UI, H/16','','','Viên','Nystatin','VD-12416-10',1001,50105,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4221,379,'OBI003','Obimin Plus, H/30','','','Hộp','','20471/2014/ATTP-XNCB',1001,50105,853,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4220,378,'OBI002','Obimin, H/100','','','Viên','','VD-12076-10',1001,50105,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4219,377,'OBI001','Obimin, H/30','','','Viên','','VD-12076-10',1001,50105,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5188,1173,'OFC001','Ofcin 200mg, H/20','','','Viên','Ofloxacin','VD-20580-14',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4324,481,'OFL005','Oflovid 0.3% 15ml','','','Lọ','Ofloxacin','',1042,50072,1003,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3285,52,'OFO001','Ofoxin 200mg, H/100','','','Viên','Ofloxacin','',1001,50105,788,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4512,653,'OHN001','OHNO 2mg, L/12','','','Lọ','Nicotine','VD-21522-14',1003,50084,1044,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4666,807,'OIL001','Oilatum Bar 100g','','','Hộp','','50187/11/CBMP-QLD',1022,50062,985,167);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4086,244,'OME004','Omega 3,6,9 Alaska, H/100','','','Hộp','','',1001,50067,867,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4085,243,'OME003','Omega 3,6,9 KOZO, H/100','','','Hộp','','',1001,50067,955,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4141,299,'OME005','Omeprazol 20mg, H/30 - DHG','','','Viên','Omeprazol','',1001,50105,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4892,1027,'ONG024','Ống chích Insulin 100IU/1ml','','','Ống','','',1015,50110,1087,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4779,920,'ONG023','Ống hít Inhaler, D/5 (VietNam)','','','Tuýp','Tinh dầu menthol','VD-10161-10',1033,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4778,919,'ONG022','Ống hít Siang Pure, D/6, H/60 (Thailand)','','','Tuýp','Tinh dầu menthol','',1033,50072,798,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4542,683,'OPC002','OPCrilati, H/50','','','Lọ','Cao khô trinh nữ hoàng cung','18588/2013/ATTP/XNCB',1001,50067,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5036,1120,'OPE005','OpeCipro 500mg, H/14','','','Viên','Ciprofloxacin','VD-21676-14',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5287,1252,'OPE007','OpeClari 500mg, H/30v','','','Viên','Clarithromycin','VD-11655-10',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4379,536,'OPE004','Opesinkast 10mg, H/28','','','Viên','Montelukast','',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4378,535,'OPE003','Opesinkast 5mg, H/28','','','Viên','Montelukast','',1001,50105,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4669,810,'ORA004','Oracortia 1g, H/50','','','Tuýp','','VD-9904-09',1022,50078,987,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5276,1241,'ORA005','Orafar 90ml','','','Chai','Dung dịch súc miệng','',1061,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4526,667,'ORE004','Oresol - 3B, H/40','','','Gói','','18365/2014/ATTP-XNCB',1001,50067,1046,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4524,665,'ORE002','Oresol Newlife, H/12','','','Viên','','10412/2014/ATTP-XNCB',1001,50067,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4525,666,'ORE003','Oresol, H/100','','','Gói','','27405/2014/ATTP-XNCB',1001,50067,857,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4599,740,'ORG001','Orgametril 5mg, H/30','','','Viên','Lynestrenol','VN-15548-12',1001,50105,822,156);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4158,316,'ORT001','Orthocattin, H/20','','','Gói','Natri Sulfat + Natri Phosphat Tribasic + Natri Citrat + Natri Bicarbonat','',1001,50105,962,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4450,607,'OSL001','OSLA eye drop 15ml','','','Lọ','','VD-19138-13',1042,50072,997,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4641,782,'OST002','Ostigold, H/60','','','Viên','Glucosamin','19118/2015/ATTP-XNCB',1001,50067,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4341,498,'OTI003','Otifar 8ml, L/10','','','Lọ','Chloramphenicol + Dexamethason','',1042,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4720,861,'OTI004','Otilin 0.05% 8ml, L/10','','','Lọ','Xylometazolin','VD-17006-12',1041,50072,995,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4727,868,'OTI005','Otilin 15ml','','','Lọ','Xylometazolin','VD-16279-12',1038,50068,995,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4070,228,'OTI001','OTiv, L/15','','','Lọ','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4071,229,'OTI002','OTiv, L/30','','','Lọ','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4718,859,'OTR001','Otrivin 0.05% 10ml','','','Lọ','Xylometazolin','VN-15558-12',1041,50072,926,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4719,860,'OTR002','Otrivin 0.1% 10ml','','','Lọ','Xylometazolin','VN-15561-12',1041,50072,926,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5289,1253,'OTR003','Otrivin Spray 0.05% 10ml','','','Lọ','Xylometazolin','VN-15560-12',1038,50068,926,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3293,59,'OXI001','Oxifide 200mg, H/10','','','Viên','Cefpodoxim','',1001,50105,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4737,878,'OXY004','Oxy già 10TT, L/10','','','Lọ','','2907/2012/CBTC-TĐC',1025,50075,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4939,1066,'OXY005','Oxytocin 5UI/ml, H/100','','','Ống','Hóc môn thùy sau tuyến yên','VN-5366-10',1015,50069,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3343,106,'PAN007','Panadol 500mg, H/120','','','Viên','Paracetamol','VN-12465-11',1001,50105,757,147);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3344,107,'PAN008','Panadol cảm cúm, H/180','','','Viên','Paracetamol+Cafein+Phenylephrine hydroclorid','',1001,50105,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5341,1281,'PAN016','Panadol Eff 500mg, H/20','','','Viên','Paracetamol','VN-16488-13',1001,50105,765,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3345,108,'PAN009','Panadol Extra, H/180','','','Viên','Paracetamol+Cafein','',1001,50105,743,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4314,471,'PAN010','Panangin 50mg, H/50','','','Viên','Magne aspartat + Kali aspartat','VN-5367-10',1001,50105,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4761,902,'PAN012','Panatel 125mg, H/120','','','Viên','Pyrantel','VN-16045-12',1001,50105,1085,37);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4972,1079,'PAN013','Panh MHCP 16cm','','','Cái','','',1025,50056,1108,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5277,1242,'PAN015','Panthenol 10g, B/10','','','Tuýp','D-Panthenol','',1025,50075,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4688,829,'PAN011','Panthenol Spray','','','Tuýp','','VN-10298-10',1024,50068,862,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3355,118,'PAP004','Paparin Inj 40mg/2ml, H/10','','','Ống','Papaverin','',1015,50069,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3346,109,'PAR010','Paracetamol 500mg, C/500','','','Viên','Paracetamol','VD-18271-13',1001,50105,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4882,1017,'PAR012','Paracetamol Kabi 1g/100ml','','','Chai','Paracetamol','',1019,50068,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4395,552,'PEC001','Pectol-E Syrup 90ml','','','Chai','','',1001,50105,883,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4881,1016,'PED001','Pedfotaz 1g','','','Lọ','Cefotaxim','',1009,50068,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3286,53,'PEN003','Penicillin V Kali 1M, H/100','','','Viên','Penicillin','',1001,50105,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4156,314,'PEP002','Peptifiz-US, H/40','','','Viên','','11025/2013/ATTP-XNCB',1001,50105,780,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3366,129,'PER001','Perimirane 10mg, H/40','','','Viên','Metoclopramid','',1001,50105,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4647,788,'PEV001','Pevitax, H/60','','','Viên','Arginin','VD-11329-10',1001,50105,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4377,534,'PHA007','Phagofi 5mg, H/30','','','Viên','Montelukast','',1001,50105,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5014,1106,'PHA011','Phấn thơm gohnsons baby blossom 100g','','','Lọ','','',1022,50058,986,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4742,883,'PHA009','Phấn thơm gohnsons baby blossom 200g','','','Lọ','','',1022,50058,986,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4743,884,'PHA010','Phấn thơm TIARA','','','Lọ','','43751/11/CBMP-QLD',1022,50058,1081,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4226,384,'PHA006','Pharmaton Capsules, H/60','','','Viên','','VN-9467-10',1001,50105,746,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4225,383,'PHA005','Pharmaton Fizzi Eff, H/10','','','Tuýp','','',1001,50105,746,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4451,608,'PHA008','Pharmaton Kiddi Syrup 100ml','','','Chai','','VN-17846-14',1001,50105,746,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3183,3,'PHA004','Pharmox 250mg, H/12g','','','Gói','Amoxicillin','',1001,50105,958,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4677,818,'PHE006','Phenergan 10g','','','Tuýp','Promethazin','GC-0096-10',1022,50078,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4775,916,'PHE007','Phentinil 100mg, H/60','','','Viên','Phenytoin','VD-6459-08',1001,50105,965,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5244,1217,'PHE008','Phenytoin 100mg, L/100','','','Lọ','Phenytoin','',1001,50106,1166,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4551,692,'PHI011','Philatop 10ml, H/20A','','','Ống','','18022/2014/ATTP-XNCB',1001,50067,868,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5332,1272,'PHL002','Phlebodia 600mg, H/30','','','Viên','Diosmin','VN-18867-15',1001,50106,1179,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4452,609,'PHO006','Phong tê thấp Bà Giằng, L/250','','','Hộp','','V23-H12-16',1001,50106,1037,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4453,610,'PHO007','Phong tê thấp Bà Giằng, L/400','','','Hộp','','V23-H12-16',1001,50106,1037,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4118,276,'PHO005','Phosphalugel 20g, H/26','','','Gói','Colloidal aluminium phosphate','',1001,50106,746,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4355,512,'PHU003','Phulzine 5mg, H/100','','','Viên','Levocetirizin','',1001,50106,802,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3404,150,'PHY002','Phytilax, H/30','','','Viên','','',1001,50106,883,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4663,804,'PHY004','PhytoBeBe 100ml','','','Chai','','VD-15286-11',1022,50062,861,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4662,803,'PHY003','Phytogyno 100ml','','','Chai','','VD-15287-11',1022,50062,861,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3367,130,'PIR005','Piracetam 400mg, H/60','','','Viên','Piracetam','',1001,50106,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4030,188,'PIR007','Piracetam 800mg, H/30','','','Viên','Piracetam','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3368,131,'PIR006','Piracetam Kabi 1g/5ml, H/12A','','','Ống','Piracetam','',1015,50070,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4690,831,'PLA001','Plahasan 75mg, H/10','','','Viên','Clopidogrel','VD-20083-13',1001,50106,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4691,832,'PLA002','Plavix 75mg, H/14','','','Viên','Clopidogrel','VN-16229-13',1001,50106,807,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4510,651,'PLU001','PlusssZ Max, Tub/20','','','Tuýp','','25783/2014/ATTP-XNCB',1001,50067,1043,170);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5320,1260,'PLU002','PlusssZ Max, Tub/20 KM','','','Tuýp','','',1001,50063,0,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5185,1170,'PMS013','pms-Claminat 281,25mg, H/12g','','','Gói','Amoxicillin + Acid Clavulanic','VD-19381-13',1001,50106,958,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3287,54,'PMS008','pms-Doxyclin 100mg, H/100','','','Viên','Doxicyclin','',1001,50106,958,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4122,280,'PMS012','pms-Probio 1g, H/14','','','Gói','Lactobacillus acidophilus','',1001,50106,958,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5326,1266,'PMS014','PMS Pharmox 500mg, H/100','','','Viên','Amoxycillin','VD-18305-13',1001,50106,958,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4321,478,'POL006','Polydesol 5ml, L/10','','','Lọ','Neomycin + Dexamethasone','',1042,50072,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4265,423,'POL005','Polygynax, H/12','','','Viên','Nystatin + Neomycin + Polymicin B','VN-10139-10',1026,50072,856,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3995,153,'PON001','Poncif DHG 500mg, H/30','','','Viên','Acid Mefenamic','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4593,734,'POS001','Postinor 1, L/12','','','Hộp','Levonorgestrel','VN-9212-09',1001,50106,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4594,735,'POS002','Postinor 2, H/2','','','Hộp','Levonorgestrel','VN-8706-09',1001,50106,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4730,871,'POV006','Povidine 10% 20ml, L/10','','','Lọ','Povidon iodin','VD-15400-11',1022,50078,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4729,870,'POV005','Povidine 10% 90ml, T/48','','','Lọ','Povidon iodin','VD-15400-11',1022,50078,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5279,1244,'POV010','Povidine 5% 8ml (STCR)','','','Lọ','Povidon iodin','',1025,50075,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4746,887,'POV008','Povidon 10% 20ml, L/10','','','Lọ','Povidon iodin','VD-16474-12',1025,50075,998,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4731,872,'POV007','Povidon 10% 20ml, L/10','','','Lọ','Povidon iodin','VD-15530-11',1022,50079,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5026,1111,'POV009','Povidone 10% 90ml - Agi','','','Lọ','Povidon iodin','VD-17882-12',1022,50079,1124,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4984,1084,'POW001','Power Brain Ích khang, H/30','','','Viên','','11588/2014/ATTP-XNCB',1001,50067,873,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3347,110,'PRE003','Prednisolon 5mg, H/100','','','Viên','Prednisolon','',1001,50106,758,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3349,112,'PRE004','Prednisolon 5mg, L/500','','','Viên','Prednisolon','',1001,50106,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4455,612,'PRE011','Prednisolon 5mg, L/500 (ngọt)','','','Viên','Prednisolon','VD-8401-09',1001,50106,758,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4454,611,'PRE010','Prednison 5mg, H/100','','','Viên','Prednisolon','VD-21030-14',1001,50106,710,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4166,324,'PRE007','Predsantyl 16mg, H/100','','','Viên','Methyl prednisolon','',1001,50106,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4167,325,'PRE008','Predsantyl 4mg, H/100','','','Viên','Methyl prednisolon','',1001,50106,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4034,192,'PRE006','Premilin 75mg, H/30','','','Viên','Pregabalin','',1001,50106,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4177,335,'PRE009','Prencoid 5mg, L/500','','','Viên','Prednisolon','',1001,50106,965,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4005,163,'PRI005','Primperan 10mg/2ml, H/12A','','','Ống','Metoclopramid','',1015,50071,741,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4152,310,'PRO012','Prolacfil, H/30','','','Viên','','',1001,50067,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5183,1169,'PRO015','Propara 450mg/3ml, H/10A','','','Ống','Paracetamol + Lidocain hydroclorid','VD-13005-10',1015,50071,762,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4394,551,'PRO013','Prospan Cough Syrup 100ml','','','Chai','Cao khô lá Thuòng xuân','VN-17873-14',1001,50106,1029,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4022,180,'PUL003','Pulmicort Respules 500mcg/2ml, H/20A','','','Tuýp','Budesonid','',1062,50072,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5280,1245,'PUL005','PULMOFAR Siro 90ml','','','Chai','Thuốc ho trẻ em','',1001,50106,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4456,613,'PUR001','Puritan''s Pride Premium, L/240','','','Viên','Glucosamine + Chondroitin + MSM','XT',1001,50067,1038,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4757,898,'QUE005','Que thử thai Chip chip, H/12test','','','Test','','22/2013/BYT-TB-CT',1025,50051,1000,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4758,899,'QUE006','Que thử thai Quick test, H/100 (L2)','','','Test','','',1025,50051,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4759,900,'QUE007','Que thử thai Quickstick, B/25 (L1)','','','Test','','',1025,50051,1084,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4206,364,'QUI003','Quincef 125mg, H/10','','','Gói','Cefuroxim','',1001,50106,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4138,296,'RAB001','Rabemark 20mg, H/30','','','Viên','Rabeprazol','',1001,50106,730,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5317,1257,'RAP002','Rape-G 20mg, H/30','','','Viên','Rabeprazol','VD-23546-15',1001,50106,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5281,1246,'RAT001','Ratidin F 300mg, H/30v','','','Viên','Ranitidin','',1001,50106,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4335,492,'RAY001','Ray-C 10ml','','','Lọ','','',1045,50072,1004,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4621,762,'REA001','Reagin Plus, H/30','','','Viên','Citicoline + Nimodipine','VN-17301-13',1001,50106,1073,8);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4150,308,'REC004','Rectamin 10ml','','','Chai','','',1001,50067,961,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4407,564,'REC005','Rectiofar 3ml, H/50','','','Tuýp','Glycerin','',1028,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4408,565,'REC006','Rectiofar 5ml, H/40','','','Tuýp','Glycerin','',1028,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4937,1064,'REF003','Refresh Tears Drop 0,5% 15ml','','','Lọ','Natri carboxymethylcellulose','VN-8418-09',1042,50072,812,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4170,328,'RHE001','Rheumatin, H/40','','','Viên','','',1001,50106,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4342,499,'RHI001','Rhinex 0,05% 15ml, L/10','','','Lọ','Naphazolin','',1041,50072,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4515,656,'RHU001','Rhumenol Flu 500, H/100','','','Viên','Paracetamol + Chlopheniramin + Dextromethophan','VD-21439-14',1001,50106,1045,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4771,912,'RIN002','Ringer Lactat 500ml, T/10','','','Chai','Natri clorid + Kali clorid + Calci clorid + Natri lactat','VD-16422-12',1019,50068,1087,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4577,718,'ROL001','Rơ lưỡi Đông Pha','','','Hộp','','03/2011/ĐP',1025,50056,1020,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4651,792,'ROC002','Rocket 1h, H/6','','','Viên','','15196/2011/YT-CNTC',1001,50067,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4650,791,'ROC001','Rocket, H/10','','','Hộp','','7546/2012/ATTP-XNCB',1001,50067,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5323,1263,'ROS002','Rosiden Gel 20g','','','Tuýp','Piroxicam','VD-23301-15',1025,50075,1141,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4697,838,'ROS001','Rosuvastatin Stada 10mg, H/30','','','Viên','Rosuvastatin','VD-19690-13',1001,50106,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4028,186,'ROT001','Rotundin-BVP 30mg, H/100','','','Viên','Rotundin','',1001,50106,801,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5224,1202,'ROT002','Rotundin 30mg, H/100 - Donaipharm','','','Viên','Rotundin','VD-20120-13',1001,50106,745,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3288,55,'ROV005','Rovamycine 1.5MIU, H/16','','','Viên','Spiramycin','',1001,50106,741,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3289,56,'ROV006','Rovamycine 3MIU, H/10','','','Viên','Spiramycin','',1001,50106,741,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4211,369,'ROV010','Rovas 0.75M, H/24g','','','Gói','Spiramycin','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4212,370,'ROV011','Rovas 1.5M, H/16','','','Viên','Spiramycin','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4213,371,'ROV012','Rovas 3M, H/10','','','Viên','Spiramycin','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4196,354,'ROW002','Rowachol, H/100','','','Viên','Pinene + Camphene + Cineol + Menthol + Menthone + Borneol + Olive oil','',1001,50106,864,100);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4195,353,'ROW001','Rowatinex, H/100','','','Viên','Pienne + Camphene + Cineol + Fenchone + Borneol + Anethol','',1001,50106,864,100);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3291,57,'ROX001','Roxinate 100mg, H/100','','','Viên','Roxithromycin','',1001,50106,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5194,1179,'ROX003','Roxithromycin 150mg, H/30','','','Viên','Roxithromycin','VD-20582-14',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4294,451,'ROX002','Roxylife 150mg, H/100','','','Viên','Roxithromycin','',1001,50106,1010,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4084,242,'ROY003','Royal Collagen 144g, H/180','','','Hộp','','',1001,50067,954,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4083,241,'ROY002','Royal Collagen 36g, H/45','','','Hộp','','',1001,50067,954,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4090,248,'ROY004','Royal Jelly 1500, H/100','','','Hộp','','',1001,50067,957,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4068,226,'ROY001','Royal Placenta 60g, H/150','','','Hộp','','',1001,50067,954,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4111,269,'RUT003','Rutin-C, H/100','','','Viên','Vitamin C + Rutin','',1001,50106,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4089,247,'SAC001','Sắc ngọc khang, H/60','','','Hộp','','',1001,50067,949,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4185,343,'SAG003','Sagacoxib 100mg, H/30','','','Viên','Celecoxib','',1001,50106,783,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4184,342,'SAG002','Sagacoxib 200mg, H/30','','','Viên','Celecoxib','',1001,50106,783,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3194,14,'SAG001','Sagafixim 100mg, H/10','','','Viên','Cefixim','',1001,50106,0,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4187,345,'SAG005','Sagafixim 200mg, H/10','','','Viên','Cefixim','VN-12374-11',1001,50106,783,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4186,344,'SAG004','Sagapanto 40mg, H/30','','','Viên','Pantoprazol','VN-13065-11',1001,50106,783,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5324,1264,'SAG006','Sagarab 20mg, H/30','','','Viên','Rabeprazol','VN-11837-11',1001,50106,783,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4740,881,'SAK001','Sakura, H/3','','','Miếng','','22/2013/BYT-TB-CT',1023,50077,1000,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5282,1247,'SAL015','Salbufar 2mg, H/200v','','','Viên','Salbutamol','',1001,50106,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4346,503,'SAL009','Salbutamol 2mg, H/100','','','Viên','Salbutamol','VD-17369-12',1001,50106,1013,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4347,504,'SAL010','Salbutamol 4mg, H/100','','','Viên','Salbutamol','VD-17369-12',1001,50106,1013,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4334,491,'SAL008','Salein 0.1, 5ml','','','Lọ','Natri hyaluronate','',1042,50072,1003,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4583,724,'SAL012','Salonpas Gel 30g, H/10','','','Tuýp','','VD-12687-10',1021,50083,1053,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4584,725,'SAL013','Salonpas H/20/H/12M','','','Hộp','','VD-22387-15',1023,50077,1053,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4561,702,'SAL011','Salonpas Spray 80ml','','','Chai','','VN-15797-12',1024,50068,1053,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4586,727,'SAL014','Salonsip, H/10B/2M','','','Gói','','VD-13185-10',1023,50077,1053,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4077,235,'SAM004','Sâm Alipas, H/30','','','Hộp','','',1001,50067,951,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4533,674,'SAM005','Sâm nhung Bổ thận TW3, H/30','','','Hộp','','V568-H12-10',1001,50106,1048,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4345,502,'SAN002','Sanlein 0,1 5ml','','','Lọ','Natri hyaluronate','',1042,50072,1003,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4728,869,'SAV009','Savi Atorvastatin 40mg, H/30','','','Viên','Atorvastatin','VD-8735-09',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4147,305,'SAV005','Savi Esomeprazole 40, H/14','','','Viên','Esomeprazol','',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4140,298,'SAV004','Savi Lansoprazole 30mg, H/30','','','Viên','Lansoprazole','',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4486,633,'SAV006','Savi Pamol 650mg, H/100','','','Viên','Paracetamol','VD-9556-09',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4487,634,'SAV007','Savi Pamol Extra 500mg, H/16','','','Viên','Paracetamol + Cafein','VD-17949-12',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5186,1171,'SAV012','Savi Pamol Plus, H/30','','','Viên','Paracetamol + Tramadol','VD-21894-14',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4136,294,'SAV003','Savi Pantoprazole 40mg, H/20','','','Viên','Pantoprazol','',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4509,650,'SAV008','Savi Pluz Multivitamin, Tub/20','','','Tuýp','','10189/2012/YT-CNTC',1001,50067,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4985,1085,'SAV011','SaVi Trimetazidine 35MR, H/30','','','Viên','Trimetazidin','VD-11690-10',1001,50106,851,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5199,1184,'SEK001','Sekaf 500mg, H/20','','','Viên','Citicolin','VD-14589-11',1001,50106,1155,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4556,697,'SEL002','Selsun 100ml','','','Chai','','',1022,50062,1051,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4555,696,'SEL001','Selsun 50ml','','','Chai','','',1022,50062,1051,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4523,664,'SEN001','Sensa Cools 7g, L/12H, H/6','','','Hộp','','8213/2014/ATTP-XNCB',1001,50067,855,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4386,543,'SER001','Seretide Evohaler DC 25/250','','','Tuýp','Salmeterol + fluticasone propionate','',1039,50068,765,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4082,240,'SHE001','Sheep Placenta Concentrate, H/60','','','Hộp','','',1001,50067,950,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4676,817,'SIL004','Silkeron Cream 10g (VN)','','','Tuýp','','VD-19219-13',1022,50079,991,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4675,816,'SIL003','Silkron cream 10g (HQ)','','','Tuýp','','VN-17420-13',1022,50079,819,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4157,315,'SIM006','Simethicon 15ml','','','Chai','Simethicon','VD-13153-10',1001,50106,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4800,941,'SIM009','Similac IQ Step 1','','','Lon','','',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4976,1080,'SIM010','Similac Mom EyeQ Plus 400g - Hương Vani','','','Lon','','18495/2013/ATTP-XNCB',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4725,866,'SIM007','Simvastatin STADA 10mg, H/30','','','Viên','Simvastatin','VD-7764-09',1001,50106,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4726,867,'SIM008','Simvastatin STADA 20mg, H/30','','','Viên','Simvastatin','VD-20127-13',1001,50106,727,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4375,532,'SIN004','Singulair 4mg, H/28','','','Viên','Montelukast','',1003,50084,1016,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4376,533,'SIN005','Singulair 4mg, H/28g','','','Gói','Montelukast','',1001,50106,1016,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4306,463,'SIN003','Sintrom 4mg, H/30','','','Viên','Acenocoumarol','',1001,50106,926,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5339,1279,'SIR007','Siro ăn ngon Ích nhi 100ml','','','Chai','','12375/2015/ATTP-XNCB',1001,50067,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4548,689,'SIR005','Siro ăn ngon Ích nhi 125ml','','','Chai','','22967/2013/ATTP-XNCB',1001,50067,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4552,693,'SIR006','Siro Ăn ngon Zinc Healthy 125ml','','','Chai','','6585/2015/ATTP-XNCB',1001,50067,841,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4054,212,'SIR003','Siro Ho Cúc tím 125ml','','','Chai','','',1001,50067,841,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4050,208,'SIR002','Siro Papai New 150ml','','','Chai','','',1001,50067,937,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4457,614,'SIR004','Siro PQA ho hen 125ml','','','Chai','','7675/2013/ATTP-XNCB',1001,50067,1039,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3369,132,'SIU002','Siutamid 10mg/2ml, H/10','','','Ống','Metoclopramid','',1015,50071,0,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4673,814,'SKI001','SkinBiBi 10g','','','Tuýp','','06/2013/CBMP-NĐ',1022,50079,830,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4400,557,'SLA002','Slaska plus 100ml','','','Chai','','',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4123,281,'SME002','Smecta 3g, H/30','','','Gói','Diosmectit','',1001,50106,769,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4553,694,'SOF001','Soffell 70ml, H/12L','','','Chai','','VNDP-HC-691-08-13',1022,50062,855,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4405,562,'SOL005','Solmux Broncho 500mg, H/100','','','Viên','Carbocistein + Salbutamol','',1001,50106,742,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3350,113,'SOL003','Solu-medrol 40mg Inj','','','Lọ','Methyl prednisolon','VN-11234-10',1015,50071,760,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4860,996,'SON024','Sond Foley 16','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4861,997,'SON025','Sond Foley 18','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4862,998,'SON026','Sond Foley 20','','','Cái','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4855,991,'SON022','Sond Nelaton 14','','','Cái','','',1025,50110,1097,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4856,992,'SON023','Sond Nelaton 16','','','Cái','','',1025,50110,1097,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4874,1009,'SON027','Sond Nelaton 8 (Urethral catheter)','','','Sợi','','',1025,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4120,278,'SOR005','Sorbitol 5g, H/20','','','Gói','Sorbitol','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3351,114,'SPA001','Spasmonavin 40mg, H/300','','','Viên','Alverin','',1001,50106,750,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4705,846,'SPI007','Spinolac 50mg, H/20','','','Viên','Spironolacton','VD-12651-10',1001,50106,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5032,1117,'SPI008','Spiromide 50/20, H/20','','','Viên','Spinolacton + Furosemid','VN-10570-10',1001,50106,1122,163);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4057,215,'SPI006','Spivital Mama, H/100','','','Viên','','',1001,50067,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4056,214,'SPI005','Spivital Nutri, H/100','','','Viên','','',1001,50067,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4126,284,'STO001','Stoccel P 20g, H/24','','','Gói','Aluminum phosphat','',1001,50106,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4027,185,'STU002','Stugeron 25mg, H/250','','','Viên','Cinnarizin','',1001,50106,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4798,939,'SUA003','Sữa Ensure Original 237ml','','','Lon','','',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4801,942,'SUA004','Sữa Frisolac Gold Step 1 400g','','','Lon','','15845/2015/ATTP-TNCB',1001,50063,1091,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4977,1081,'SUA005','Sữa non Similac EyeQ Plus','','','Tuýp','','9761/2013/ATTP-XNCB',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5038,1121,'SUA006','Sữa non Similac NeoSure IQ 22kcal/fl','','','Tuýp','','23590/2013/ATTP-XNCB',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4797,938,'SUA002','Sữa non Similac Special Care IQ 24kcal','','','Tuýp','','7721/2014/ATTP-XNCB',1001,50063,763,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5259,1232,'SUA007','Sữa ong chúa L/365 Costar','','','Lọ','','',1001,50063,1169,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5241,1214,'SUA001','Sữa tắm Nicky every baby 100ml','','','Chai','','',1025,50057,1165,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5335,1275,'SUA008','Sữa tắm rôm sảy Lana 100g','','','Lọ','','',1022,50058,1180,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4125,283,'SUC003','Sucrahasan 1g, H/30','','','Gói','Sucralfat','',1001,50107,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4132,290,'SUL001','Sulpiride 50mg, H/100','','','Viên','Sulpiride','VD-20478-14',1001,50107,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4013,171,'SUO002','Suopinchon 20mg/2ml, H/10A','','','Ống','Furosemid','',1015,50071,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5261,1234,'SYM002','Symbicort Turbuhaler 160/4.5mcg 120dose','','','Lọ','Budesonid + Fomoterol','',1039,50068,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4387,544,'SYM001','Symbicort Turbuhaler 160/4.5mcg 60dose','','','Tuýp','Budesonid + Fomoterol','VN-12852-11',1039,50068,779,198);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4333,490,'SYS001','Systane Ultra 5ml','','','Lọ','Polyethylene glycol + Propylene','',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4868,1003,'TAN020','Tả người lớn Dr. Care, B/10','','','Miếng','','',1025,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4867,1002,'TAN019','Tả người lớn Skyrin, B/10','','','Miếng','','',1000,50110,0,0);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3370,133,'TAG001','Taginyl 500mg, H/20','','','Viên','Acetyl leucin','',1001,50107,766,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5176,1162,'TAL001','Talroma 100mg, H/30','','','Viên','Tiropramid','VN-15945-12',1001,50107,1150,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4871,1006,'TAM013','Tăm bông Baby Care, L/6','','','Hộp','','',1025,50110,1129,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4873,1008,'TAM015','Tăm bông Baby Kitty','','','Bịch','','',1025,50110,1128,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4870,1005,'TAM012','Tăm bông Baby One (người lớn), L/12','','','Hộp','','',1025,50110,1130,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4869,1004,'TAM011','Tăm bông Baby One (trẻ em), L/12','','','Hộp','','',1025,50110,1130,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4872,1007,'TAM014','Tăm bông Happy Life','','','Bịch','','',1025,50110,1128,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4581,722,'TAM009','Tăm chỉ nha khoa OKAMURA 50P','','','Bịch','','',1025,50056,1064,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4843,979,'TAM010','Tấm lót sản 40*60cm (DA)','','','Tấm','','',1025,50110,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4173,331,'TAN017','TanaMisolblue, H/100','','','Viên','','',1001,50107,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4303,460,'TAN018','Tanatril tablets 10mg, H/100','','','Viên','Imidapril','',1001,50107,1011,97);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3371,134,'TAN013','Tanganil 500mg, H/30','','','Viên','Acetyl leucin','',1001,50107,767,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3372,135,'TAN014','Tanganil 500mg/5ml, H/5A','','','Ống','Acetyl-DL-leucine','',1015,50071,767,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4659,800,'TAR002','Targinos plus, H/60','','','Viên','Arginin + C + B2 + B1','VD-10745-10',1001,50107,1072,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4079,237,'TAT005','Tatiomax gold, H/60','','','Hộp','','',1001,50067,952,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4609,750,'TEN003','Tê nhức chân tay Bảo Nguyên','','','Hộp','','3497/2014/ATTP-XNCB',1001,50067,1033,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4327,484,'TEA001','Tears Natural II 15ml','','','Lọ','','',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5083,1133,'TEL002','Telfor 120mg, H/20','','','Viên','Fexofenadin','VD-19286-13',1001,50107,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4360,517,'TEL001','Telfor 180mg, H/20','','','Viên','Fexofenadin hydroclorid','',1001,50107,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4934,1061,'TEP001','Tepincods 110mg, H/300','','','Viên','Terpin hydrat + Dextromethorphan','VD-10852-10',1001,50107,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4359,516,'TER006','Terpin Codein, H/100','','','Viên','Terpin hydrat + Codein','',1001,50107,716,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4357,514,'TER005','Terpin gonnon 115mg, H/20','','','Viên','Terpin hydrat + Codein','',1001,50107,942,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4760,901,'TES021','Test rụng trứng LH-TANA','','','Test','','22/2013/BYT-TB-CT',1025,50051,1000,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4320,477,'TET007','Tetracylin 1% 5g, L/10','','','Tuýp','Tetracycline','',1043,50068,717,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4032,190,'THA003','Thần kinh HT3 225mg, H/100','','','Viên','Paracetamol + Codein + Cafein','',1001,50107,835,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4637,778,'THA017','Thanh áp đan, H/30','','','Hộp','','',1001,50053,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4625,766,'THA016','Thập toàn đại bổ, H/10','','','Hộp','','VD-16180-12',1001,50053,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4695,836,'THE006','Theophylin 100mg, H/30','','','Viên','Theophylin','VD-7412-09',1001,50107,759,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4696,837,'THE007','Theostat LP 100mg, H/30','','','Viên','Theophylin','VN-14339-11',1001,50107,767,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4351,508,'THE005','Theralen 5mg, H/20','','','Viên','Alimemazin','',1001,50107,748,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5283,1248,'THI010','Thiazifar 25mg, H/100v','','','Viên','Hydroclorothiazid','',1001,50107,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4629,770,'THO006','Thông xoang tán, H/50','','','Hộp','','V87-H12-13',1001,50054,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4929,1056,'THU017','Thuốc hen P/H 250ml','','','Lọ','','V703-H12-10',1001,50055,831,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4398,555,'THU015','Thuốc ho Bảo Thanh 125ml','','','Chai','','V1390-H12-10',1001,50107,983,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4397,554,'THU014','Thuốc ho người lớn 85ml','','','Chai','','',1001,50107,837,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4399,556,'THU016','Thuốc ho P/H 100ml','','','Chai','','',1001,50107,831,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4685,826,'TIC002','Ticarlox 10g','','','Tuýp','','001054/13/CBMP-HCM',1022,50080,994,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5004,1101,'TIE005','Tiêu ban thủy siro 150ml','','','Chai','','13527/2015/ATTP-XNCB',1001,50067,1069,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4402,559,'TIF001','Tiffy syrup 30ml','','','Chai','Paracetamol + Chlorpheniramine + Phenylpropanolamine','',1001,50107,987,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4403,560,'TIF002','Tiffy, H/100','','','Viên','Paracetamol + Chlorpheniramine + Phenylpropanolamine','VD-19229-13',1001,50107,987,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4417,574,'TIG001','Tiger Balm Red 19.4g, H/12','','','Hộp','','',1022,50062,1030,184);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4039,197,'TIM003','Timmak 3mg, H/60','','','Viên','Dihydroergotamin mesylat','',1001,50107,932,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3292,58,'TIN004','Tinidazole 500mg, H/100','','','Viên','Tinidazol','',1001,50107,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4233,391,'TOB005','Tobicom H/180','','','Viên','','',1001,50107,968,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4329,486,'TOB007','Tobradex Drop 5ml','','','Lọ','Tobramycin + Dexamethason','VN-4954-10',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5284,1249,'TOB009','Tobrafar 5ml, B/10','','','Lọ','Tobramycin','',1042,50072,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4328,485,'TOB006','Tobrex Drop 0.3% 5ml','','','Lọ','Tobramycin','VN-7954-09',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3167,1,'TOC003','Tocemuc 200mg, H/100','','','Viên','N-Acetylcystein','',1001,50107,0,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4279,437,'TOM002','Tomax genta, L/10','','','Tuýp','Clotrimazol + Triamcinolon Acetonid + Gentamicin sulfat','VD-9079-09',1021,50083,979,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4384,541,'TOP005','Toplexil, H/24','','','Viên','','',1001,50107,741,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3373,136,'TOP004','Toptropin 800mg, H/100','','','Viên','Piracetam','',1001,50107,745,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4214,372,'TOT005','Tot''hema, H/20A','','','Ống','Sắt Gluconat + Mangan + Đồng gluconat','',1001,50107,856,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4656,797,'TOT006','Totri, H/15','','','Hộp','','',1001,50055,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4352,509,'TOU002','Toussolen 5mg, H/250','','','Viên','Alimemazin','',1001,50107,735,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4514,655,'TRA013','Trà gừng, H/10','','','Hộp','','VD-12142-10',1001,50107,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4135,293,'TRA011','Tradin Extra, H/20','','','Viên','','',1001,50107,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4107,265,'TRA010','Traluvi Syrup 100ml','','','Chai','','',1001,50107,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4633,774,'TRA016','Tràng phục linh Plus','','','Hộp','','7775/2012/YT-CNTC',1001,50055,839,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4632,773,'TRA015','Tràng Phục Linh, H/20','','','Hộp','','7152/2013/ATTP-XNCB',1001,50055,839,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4528,669,'TRA014','Tràng vị khang, H/6','','','Hộp','','VN-18528-14',1001,50108,1047,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4281,439,'TRA012','Trangala 8g, L/10','','','Tuýp','','',1021,50083,875,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4035,193,'TRA007','Transamin 250mg, H/100','','','Viên','Tranexamic acid','',1001,50108,930,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4036,194,'TRA008','Transamin 500mg, H/100','','','Viên','Tranexamic acid','',1001,50108,930,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4037,195,'TRA009','Transamin Injection 250mg/5ml, H/10A','','','Ống','Tranexamic acid','',1015,50072,930,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3352,115,'TRI014','Triamcinolone 4mg, H/100','','','Viên','Triamcinolone','',1001,50108,729,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4153,311,'TRI017','Trimetinel 100mg, H/100','','','Viên','Trimebutin','',1001,50108,871,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4081,239,'TRI016','Triple Royal Jelly, H/200','','','Hộp','','',1001,50067,950,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5228,1205,'TRY001','Trymo Tablets, H/112','','','Viên','Bismuth','VN-19522-15',1001,50108,778,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4978,1082,'TUI005','Túi chườm đa năng lớn - Hướng Dương','','','Cái','','',1025,50056,1110,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4865,1000,'TUI003','Túi chườm đa năng nhỏ - Hướng Dương','','','Cái','','',1025,50056,1110,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5007,1104,'TUI006','Túi chườm nóng fashy cổ điển','','','Túi','','',1025,50061,1117,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5008,1105,'TUI007','Túi chườm nóng fashy lông cừu','','','Túi','','',1025,50061,1117,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4891,1026,'TUI004','Túi nước tiểu Urine bag - Greetmed','','','Túi','','',1025,50110,1095,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5122,1147,'TVF001','TV. Fenofibrat 200mg, H/30','','','Viên','Fenofibrate micronised','VD-19502-13',1001,50108,1144,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4003,161,'TYD001','Tydol codein fort 530mg, H/100','','','Viên','Paracetamol + Codein','',1001,50108,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4169,327,'TYD003','Tydol PM 525mg, H/100','','','Viên','Paracetamol + Diphenhydramine Hydroclorid','',1001,50108,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4168,326,'TYD002','Tydol Rhenac 550mg, H/100','','','Viên','Paracetamol + Diclofenac','',1001,50108,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5285,1250,'TYR002','Tyrotab, H/24v','','','Hộp','Tyrothricin + Tetracain hydroclorid','',1002,50085,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3353,116,'ULT001','Ultracet 362.5mg, H/30','','','Viên','Paracetamol + Tramadol','',1001,50108,761,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4686,827,'ULT002','Ultracomb cream 10g','','','Tuýp','','VD-12177-10',1022,50081,749,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5163,1155,'UNA003','Unamoc 1g, H/15','','','Viên','Amoxicillin + Sulbactam','VD-20446-14',1001,50108,936,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4105,263,'UNI004','Unikids Syrup 100ml','','','Chai','','',1001,50109,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4232,390,'UNI005','Unikids ZINC, H/24g','','','Gói','Kẽm Gluconat','',1001,50109,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3195,15,'UPH001','Uphaxime 200mg, H/10','','','Viên','Cefixim','',1001,50109,715,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4113,271,'UPS001','UPSA-C 1000mg, H/10','','','Tuýp','Vitamin C','',1001,50109,795,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4781,922,'URG004','Urgo syval 1.25*5cm','','','Cuộn','','',1023,50110,1089,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4782,923,'URG005','Urgo syval 2.5*5cm','','','Cuộn','','',1023,50110,1089,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4783,924,'URG006','Urgo syval 5*5cm','','','Cuộn','','',1023,50110,1089,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4784,925,'URG007','Urgo thường (không hộp)','','','Cuộn','','',1023,50110,1089,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4194,352,'URU001','Uruso Tab 300mg, H/30','','','Viên','Ursodeoxycholic acid','VN-17706-14',1001,50109,777,115);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4600,741,'UTR003','Utrogestan 100mg, H/30','','','Viên','Progesteron','VN-7861-09',1001,50109,823,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4601,742,'UTR004','Utrogestan 200mg, H/15','','','Viên','Progesteron','VN-7862-09',1001,50109,823,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4348,505,'VAC006','Vaco Sulfene 330mg, H/100','','','Viên','Natri thiosulfat','',1001,50109,803,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5127,1152,'VAR003','Varogel 10ml, H/5/20','','','Gói','Magnesi hydroxyd + Nhôm hydroxyd + Simethicon','VD-18848-13',1001,50109,1141,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4282,440,'VAS002','Vaseline 10g, L/10 - Thiên Ngân','','','Tuýp','','',1021,50084,980,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4283,441,'VAS003','Vaseline Pure 10g, L/10 - OPC','','','Tuýp','','377/12/CBMP-BD',1021,50084,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4694,835,'VAS005','VasHasan MR 35mg, H/60','','','Viên','Trimetazidin','VD-7368-09',1001,50109,737,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4693,834,'VAS004','Vastarel MR 35mg, H/60','','','Viên','Trimetazidin','2765/QLD-KD',1001,50109,1006,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4385,542,'VEN001','Ventolin Inh 100mcg','','','Tuýp','Salbutamol','VN-7689-09',1039,50068,765,65);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4931,1058,'VEN002','Ventolin Nebules 2,5mg/2,5ml, H/30','','','Tuýp','Salbutamol ( Sulfat)','VN-11572-10',1036,50072,765,14);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4142,300,'VER004','Verimed 135mg, H/50','','','Viên','Mebeverin','',1001,50109,959,53);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4710,851,'VER005','Verospiron 50mg, H/30','','','Viên','Spironolacton','VN-5369-10',1001,50109,756,96);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4055,213,'VIE005','Viêm đạm Super Max, H/30','','','Viên','','',1001,50067,941,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4545,686,'VIE020','Viên Cao ích mẫu, H/50','','','Viên','','VD-20780-14',1001,50109,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4520,661,'VIE019','Viên giải rượu K21, H/6','','','Viên','','5734/2014/ATTP-XNCB',1001,50067,994,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4501,648,'VIE018','Viên ngậm Bách bộ','','','Vỉ','','',1002,50085,947,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4463,620,'VIE007','Viên ngậm Bảo Thanh, H/20T','','','Vỉ','','VD-20356-13',1002,50086,983,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4464,621,'VIE008','Viên ngậm ho Bezut, H/20','','','Vỉ','','26005/2014/ATTP-XNCB',1002,50086,1040,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4469,626,'VIE010','Viên ngậm Manukan Cinnamon, H/16','','','Viên','','22941/2013/ATTP-XNCB',1002,50086,953,170);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4500,647,'VIE017','Viên ngậm Mekotricin 1mg, H/46','','','Hộp','','VD-6987-09',1002,50086,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4495,642,'VIE016','Viên ngậm Star Benko, H/16','','','Viên','','',1002,50087,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4494,641,'VIE015','Viên ngậm Star Cough Relife, H/16','','','Viên','','VD-6832-09',1002,50087,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4493,640,'VIE014','Viên ngậm Star Sore Throat, H/16','','','Viên','','VD-14755-11',1002,50087,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4490,637,'VIE011','Viên ngậm Strepsils Cam, H/100','','','Vỉ','','VN-17195-13',1002,50087,770,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4491,638,'VIE012','Viên ngậm Strepsils Cool, H/100','','','Vỉ','','',1002,50087,770,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4492,639,'VIE013','Viên ngậm Strepsils đỏ, H/200','','','Vỉ','','VN-17154-13',1002,50087,770,205);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4623,764,'VIE022','Viên sáng mắt, H/10','','','Hộp','','VD-12722-10',1001,50109,747,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4406,563,'VIE006','Viên tăng lực Rebull, H/30','','','Viên','','',1001,50067,947,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4636,777,'VIE024','Viên uống Hoa Thiên, H/30','','','Hộp','','1742/2014/ATTP-XNCB',1001,50055,949,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4635,776,'VIE023','Viên uống Hoa Thiên, H/60','','','Hộp','','1742/2014/ATTP-XNCB',1001,50055,949,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4550,691,'VIE021','Viên uống ngừa mụn An Bảo, H/40','','','Hộp','','18973/2013/ATTP-XNCB',1001,50067,836,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4465,622,'VIE009','Viên vai gáy, H/12','','','Hộp','','6936/2012/YT-CNTC',1001,50109,863,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4323,480,'VIG001','Vigamox 0.5% 5ml','','','Lọ','Moxifloxacin','',1042,50072,1002,18);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4499,646,'VIT050','Vita C glucose, H/46','','','Gói','Vitamin C','VD-17683-12',1002,50087,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5082,1132,'VIT053','Vitamin 3B, H/100 - Abipha','','','Viên','Vitamin B1 + B6 + B12','7296/2012/YT-CNTC',1001,50109,873,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4228,386,'VIT041','Vitamin 3B, H/100 - NIC','','','Viên','Vitamin B1 + B6 + B12','',1001,50109,962,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4247,405,'VIT046','Vitamin A 5000IU, H/100','','','Viên','Vitamin A','',1001,50109,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4236,394,'VIT042','Vitamin AD 5500IU, H /100','','','Viên','Vitamin A + D','VD-20770-14',1001,50109,969,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4248,406,'VIT047','Vitamin B1 250mg, H/100','','','Viên','Vitamin B1','',1001,50109,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5033,1118,'VIT052','Vitamin B1 250mg, L/100 - Phong Phú','','','Lọ','Vitamin B1','6346/2014*ATTP-XNCB',1001,50067,857,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4466,623,'VIT048','Vitamin B12 Kabi 1000mcg, H/10A','','','Ống','Cyanocobalamin','VD-18044-12',1015,50072,733,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4112,270,'VIT040','Vitamin B6 250mg, H/100','','','Viên','Vitamin B6','',1001,50109,713,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4244,402,'VIT045','Vitamin C 1000mg, H/10','','','Tuýp','Vitamin C','',1001,50109,832,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5318,1258,'VIT058','Vitamin C 250mg, L/100','','','Viên','Vitamin C','6340/2014/ATTP-XNCB',1001,50067,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4241,399,'VIT043','Vitamin C 500mg, H/100 Caps','','','Viên','Vitamin C','',1001,50109,714,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5180,1166,'VIT054','Vitamin D3 B.O.N 200 000UI/ml, H/1A','','','Ống','Cholecalciferol','',1009,50068,789,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4009,167,'VIT039','Vitamin K1 10mg/ml, H/10A','','','Ống','Phytomenadion(Vitamin K1)','',1015,50072,0,55);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4242,400,'VIT044','Vitamin PP 500mg, H/100','','','Viên','Vitamin PP','',1001,50109,766,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4467,624,'VIT049','Vitaplex Inj 500ml, T/12','','','Chai','','VN-13872-11',1019,50068,826,216);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5286,1251,'VIT055','Vitarals Drop 20ml','','','Chai','Thuốc bổ trẻ em','',1001,50109,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4066,224,'VOM002','Võ Mỵ Nương, H/30','','','Hộp','','',1001,50067,947,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4006,164,'VOL003','Voltaren 75mg/3ml, H/5A','','','Ống','Diclofenac','',1015,50072,926,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4682,823,'VOL004','Voltaren Emulgel 20g','','','Tuýp','Diclofenac','VN-17535-13',1022,50081,926,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5111,1144,'VOL006','Voltaren SR 75mg, H/100','','','Viên','Diclofenac','VN-11972-11',1001,50109,926,105);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4917,1051,'VOL005','Voltaren Suppo 100mg, H/5','','','Viên','Diclofenac','VN-16847-13',1027,50072,926,39);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3374,137,'VOM001','Vomina 50, H/100','','','Viên','Dimenhydrinat','VD-20493-14',1001,50109,768,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4325,482,'VRO001','Vrohto Cool 12ml','','','Lọ','','',1042,50072,814,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5231,1208,'VRO003','Vrohto Dryeye 13ml','','','Lọ','Hydroxyethylcellulose','VD-21160-14',1042,50072,814,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4326,483,'VRO002','Vrohto New 13ml','','','Lọ','','',1042,50072,814,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4297,454,'XAT003','Xatral XL 10mg, H/30','','','Viên','Alfuzosin','',1001,50109,741,71);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4722,863,'XIS001','Xisat người lớn 75ml','','','Lọ','Nước biển sâu','12/2014/BYT-BT-CT',1038,50068,997,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4723,864,'XIS002','Xisat trẻ em 15ml, L/10','','','Lọ','Nước biển sâu','12/2014/BYT-TB-CT',1038,50068,997,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4724,865,'XIS003','Xisat trẻ em 75ml','','','Lọ','Nước biển sâu','12/2014/BYT-BT-CT',1038,50068,997,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5125,1150,'XOA001','Xoang Bách Phục, H/20','','','Hộp','','27257/2013/ATTP-XNCB',1001,50067,839,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4773,914,'XUL001','Xu Log Bou, L/36caps','','','Lọ','','',1001,50109,0,108);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4590,731,'XUO001','Xương khớp Nhất Nhất, H/20','','','Hộp','','V277-H12-13',1001,50055,829,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4121,279,'YBI001','Ybio, H/25','','','Gói','Lactobacillus acidophilus','',1001,50109,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4587,728,'YEN001','Yến sào Sanest 70ml','','','Lọ','','',1001,50067,1066,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4053,211,'YUC001','Yucca TD, H/60','','','Hộp','','',1001,50067,940,222);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4240,398,'ZED001','Zedcal syrup 100ml','','','Chai','','',1001,50109,971,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5260,1233,'ZED002','Zedcal syrup 200ml','','','Chai','','',1001,50109,971,98);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5250,1223,'ZEN005','Zensalbu nebules 2,5mg','','','Ống','Salbutamol','VD-21553-14',1036,50072,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5249,1222,'ZEN004','Zensalbu nebules 5mg','','','Ống','Salbutamol','VD-21553-14',1036,50072,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4765,906,'ZEN002','Zentel 200mg, H/1','','','Viên','Albendazol','GC-0182-12',1001,50109,925,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5242,1215,'ZEN003','Zentokid, H/10','','','Ống','Mutivitamin','21443/2015/ATTP-XNCB',1001,50109,1167,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4307,464,'ZES002','Zestril 5mg, H/28','','','Viên','Lisinopril','',1001,50109,779,75);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4571,712,'ZIL002','Zilgo 1.9x7.2cm, H/102M','','','Miếng','','',1025,50110,1061,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4572,713,'ZIL003','Zilgo 3.8x7.2cm, H/30','','','Miếng','','',1025,50110,1061,41);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4231,389,'ZIN003','ZinC 70mg, H/100','','','Viên','Kẽm Gluconat','',1001,50109,712,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(5278,1243,'ZIN004','Zincelen, H/50v','','','Viên','A+C+E+Selen+Kẽm','',1001,50109,782,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(3393,140,'ZOL002','Zolmed 150mg, H/1','','','Viên','Fluconazol','',1001,50109,734,229);
INSERT INTO dmduoc(id,stt,ma,ten,tyle1,tyle2,dang,hoatchat,sodk,idduongdung,idloaiduoc,idhangsx,idquocgia) VALUES(4061,219,'ZYM001','Zymafluor D 500, H/90','','','Viên','','',1001,50067,943,55);


DROP TABLE IF EXISTS nhapkhoct;
DROP TABLE IF EXISTS nhapkho;
CREATE TABLE nhapkho
(
  id numeric(25,0) NOT NULL DEFAULT 0,
  idlydonx numeric(5,0) DEFAULT 0, -- dmlydonx.id
  idnhacc numeric(10,0) DEFAULT 0, -- dmnhacc.id
  idkho numeric(14,0) DEFAULT 0, -- dmkho.id
  ngay timestamp without time zone DEFAULT now(), -- ngay nhap kho
  ngaytk timestamp without time zone DEFAULT now(), -- ngay ton kho
  ngayhd character varying(16) DEFAULT ''::character varying, -- ngay hoa don
  sohd character varying(28) DEFAULT ''::character varying,
  ngaykk character varying(16) DEFAULT ''::character varying, -- ngay kiem ke
  ngaynhan character varying(16) DEFAULT ''::character varying, -- ngay nhan
  sophieu character varying(28) DEFAULT ''::character varying,
  chietkhau numeric(18,5) DEFAULT 0, -- chiet khau so tien
  chiphivc numeric(18,5) DEFAULT 0, -- chi phi van chuyen
  miengiam1 numeric(18,5) DEFAULT 0,
  miengiam2 numeric(18,5) DEFAULT 0,
  miengiam3 numeric(18,5) DEFAULT 0,
  miengiam4 numeric(18,5) DEFAULT 0,
  miengiam5 numeric(18,5) DEFAULT 0,
  vat numeric(18,5) DEFAULT 0, -- vat: tong so tien
  sotien numeric(18,5) DEFAULT 0, -- so tien: tong cong truoc thue
  sotiendg numeric(18,5) DEFAULT 0, -- so tien: tong cong truoc thue
  sotienhd numeric(18,5) DEFAULT 0, -- so tien hoa don: sotienhd = sotien + vat + chiphivc - chietkhau
  nguoinhan character varying(255) DEFAULT ''::character varying,
  nguoigiao character varying(255) DEFAULT ''::character varying,
  noinhan character varying(255) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(15,0) DEFAULT 0,
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT nhapkho_pkey PRIMARY KEY (id),
  CONSTRAINT fk_nhapkho_id_kho FOREIGN KEY (idkho)
      REFERENCES dmkho (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT
)
WITH (
  OIDS=TRUE
);
ALTER TABLE nhapkho
  OWNER TO msolution;
COMMENT ON TABLE nhapkho
  IS 'nhap kho = {ton dau, mua moi, chuyen kho}';
COMMENT ON COLUMN nhapkho.idlydonx IS 'dmlydonx.id';
COMMENT ON COLUMN nhapkho.idnhacc IS 'dmnhacc.id';
COMMENT ON COLUMN nhapkho.idkho IS 'dmkho.id';
COMMENT ON COLUMN nhapkho.ngay IS 'ngay nhap kho';
COMMENT ON COLUMN nhapkho.ngaytk IS 'ngay ton kho';
COMMENT ON COLUMN nhapkho.ngayhd IS 'ngay hoa don';
COMMENT ON COLUMN nhapkho.sohd IS 'so hoa don';
COMMENT ON COLUMN nhapkho.ngaykk IS 'ngay kiem ke';
COMMENT ON COLUMN nhapkho.ngaynhan IS 'ngay nhan';
COMMENT ON COLUMN nhapkho.chietkhau IS 'chiet khau so tien';
COMMENT ON COLUMN nhapkho.chiphivc IS 'chi phi van chuyen';
COMMENT ON COLUMN nhapkho.vat IS 'vat: tong so tien';
COMMENT ON COLUMN nhapkho.sotien IS 'so tien: tong cong truoc thue';
COMMENT ON COLUMN nhapkho.sotienhd IS 'so tien hoa don: sotienhd = sotien + vat + chiphivc - chietkhau';
CREATE TABLE nhapkhoct
(
  id numeric(25,0) NOT NULL DEFAULT 0, -- {id, id_bd, id_nguon, stt}
  idnhapkho numeric(25,0) NOT NULL DEFAULT 0, -- nhapkho.id
  idduoc numeric(10,0) DEFAULT 0, -- cm_dmduoc.id
  idnguon numeric(5,0) DEFAULT 0,
  mavach character varying(50) DEFAULT ''::character varying, -- ma vach
  losx character varying(50) DEFAULT ''::character varying, -- lo san xuat
  ngaysx character varying(10) DEFAULT ''::character varying, -- ngay san xuat (dd/mm/yyyy)
  handung character varying(10) DEFAULT ''::character varying, -- han dung (dd/mm/yyyy)
  baohanh numeric(10,5) DEFAULT 0, -- so thang bao hanh
  vat numeric(18,5) DEFAULT 0, -- ty le vat
  chietkhau numeric(18,5) DEFAULT 0, -- chiet khau so tien
  soluongdg numeric(18,5) DEFAULT 0, -- so luong dong goi
  soluongsd numeric(18,5) DEFAULT 0, -- so luong su dung
  soluongn numeric(18,5) DEFAULT 0, -- soluongn = soluongdg*soluongsd
  soluongx numeric(18,5) DEFAULT 0, -- sum(cm_khoxuatct.soluong, xuatthuocxk.soluong)
  dongia numeric(18,5) DEFAULT 0, -- don gia  
  dongiadg numeric(18,5) DEFAULT 0, -- don gia
  dongiavat numeric(18,5) DEFAULT 0, -- don gia vat
  dongiadgvat numeric(18,5) DEFAULT 0, -- don gia vat
  sotien numeric(18,5) DEFAULT 0, -- so tien
  sotiendg numeric(18,5) DEFAULT 0, -- so tien
  sotienvat numeric(18,5) DEFAULT 0, -- so tien vat
  sotiendgvat numeric(18,5) DEFAULT 0, -- so tien vat
  ghichu character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0,
  ngayud timestamp without time zone DEFAULT now(),
  soluongyeucau numeric(18,5) DEFAULT 0,
  CONSTRAINT nhapkhoct_pkey PRIMARY KEY (id),
  CONSTRAINT nhapkhoct_fkey_dmduoc_id FOREIGN KEY (idduoc)
      REFERENCES dmduoc (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT nhapkhoct_fkey_nhapkho_idnhapkho FOREIGN KEY (idnhapkho)
      REFERENCES nhapkho (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=TRUE
);
ALTER TABLE nhapkhoct
  OWNER TO msolution;
COMMENT ON TABLE nhapkhoct
  IS 'nhap kho chi tiet';
COMMENT ON COLUMN nhapkhoct.id IS '{id, id_bd, id_nguon, stt}';
COMMENT ON COLUMN nhapkhoct.idnhapkho IS 'nhapkho.id';
COMMENT ON COLUMN nhapkhoct.idduoc IS 'cm_dmduoc.id';
COMMENT ON COLUMN nhapkhoct.mavach IS 'ma vach';
COMMENT ON COLUMN nhapkhoct.losx IS 'lo san xuat';
COMMENT ON COLUMN nhapkhoct.ngaysx IS 'ngay san xuat (dd/mm/yyyy)';
COMMENT ON COLUMN nhapkhoct.handung IS 'han dung (dd/mm/yyyy)';
COMMENT ON COLUMN nhapkhoct.baohanh IS 'so thang bao hanh';
COMMENT ON COLUMN nhapkhoct.vat IS 'ty le vat';
COMMENT ON COLUMN nhapkhoct.chietkhau IS 'chiet khau so tien';
COMMENT ON COLUMN nhapkhoct.soluongdg IS 'so luong dong goi';
COMMENT ON COLUMN nhapkhoct.soluongsd IS 'so luong su dung';
COMMENT ON COLUMN nhapkhoct.soluongn IS 'soluongn = soluongdg*soluongsd';
COMMENT ON COLUMN nhapkhoct.soluongx IS 'sum(cm_khoxuatct.soluong, xuatthuocxk.soluong)';
COMMENT ON COLUMN nhapkhoct.dongia IS 'don gia';
COMMENT ON COLUMN nhapkhoct.dongiavat IS 'don gia vat';
COMMENT ON COLUMN nhapkhoct.sotien IS 'so tien';
COMMENT ON COLUMN nhapkhoct.sotienvat IS 'so tien vat';


DROP TABLE IF EXISTS btdkh;
CREATE TABLE btdkh
(
  id character varying(25) NOT NULL DEFAULT ''::character varying, -- tenvien.id(10)+yy(2)+stt(8)
  idtt character varying(3) DEFAULT '000'::character varying, -- btdtt.id
  idquan character varying(5) DEFAULT '00000'::character varying, -- btdquan.id
  idxa character varying(7) DEFAULT '0000000'::character varying, -- btdxa.id
  idphai numeric(1,0) DEFAULT 0, -- dmphai.id
  idquocgia numeric(3,0) DEFAULT 0, -- dmquocgia.id
  hoten character varying(100) DEFAULT ''::character varying,
  ngaysinh character varying(10) DEFAULT ''::character varying,
  namsinh character varying(4) DEFAULT ''::character varying,
  diachi character varying(255) DEFAULT ''::character varying,
  email character varying(50) DEFAULT ''::character varying,
  dtnha character varying(50) DEFAULT ''::character varying,
  dtcq character varying(50) DEFAULT ''::character varying,
  dtdd character varying(50) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0,
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT btdkh_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE btdkh
  OWNER TO msolution;
COMMENT ON COLUMN btdkh.id IS 'tenvien.id(10)+yy(2)+stt(8)';
COMMENT ON COLUMN btdkh.idtt IS 'btdtt.id';
COMMENT ON COLUMN btdkh.idquan IS 'btdquan.id';
COMMENT ON COLUMN btdkh.idxa IS 'btdxa.id';
COMMENT ON COLUMN btdkh.idphai IS 'dmphai.id';
COMMENT ON COLUMN btdkh.idquocgia IS 'dmquocgia.id';


DROP TABLE IF EXISTS phieuban;
CREATE TABLE phieuban
(
  id numeric(28,0) NOT NULL DEFAULT 0, -- id_donvi(10)+yyyymmdd(8)+hhmmss(6)+stt(4)
  idkh character varying(20) DEFAULT ''::character varying, -- btdbn.mabn
  idloaikh numeric(1,0) DEFAULT 0,
  iddmcosoyte numeric(10,0) DEFAULT 0,
  bacsi numeric(18,0) DEFAULT 0,
  maicd numeric(9,0) DEFAULT 0,
  chandoan character varying(255) DEFAULT ''::character varying,
  sophieu character varying(20) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),
  userid numeric(18,0) DEFAULT 0, -- dlogin.id
  CONSTRAINT phieuban_pkey PRIMARY KEY (id),
  CONSTRAINT phieuban_fkey_btdkh_idkh_id FOREIGN KEY (idkh)
      REFERENCES btdkh (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=FALSE
);
ALTER TABLE phieuban
  OWNER TO msolution;
COMMENT ON COLUMN phieuban.id IS 'id_donvi(10)+yyyymmdd(8)+hhmmss(6)+stt(4)';
COMMENT ON COLUMN phieuban.idkh IS 'btdbn.mabn';
COMMENT ON COLUMN phieuban.userid IS 'users.id';



DROP TABLE IF EXISTS xuatthuoc;
CREATE TABLE xuatthuoc
(
  id numeric(25,0) NOT NULL DEFAULT 0,
  idkh character varying(20) DEFAULT ''::character varying, -- btdkh.id
  idphieuban numeric(25,0) DEFAULT 0, -- phieuban.id
  noidung character varying(500) DEFAULT ''::character varying,
  ghichu character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0, -- dlogin.id
  ngay timestamp without time zone DEFAULT now(),
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT xuatthuoc_pkey PRIMARY KEY (id),
  CONSTRAINT xuatthuoc_fkey_btdkh_idkh_id FOREIGN KEY (idkh)
      REFERENCES btdkh (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT xuatthuoc_fkey_phieuban_idphieuban_id FOREIGN KEY (idphieuban)
      REFERENCES phieuban (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=TRUE
);
ALTER TABLE xuatthuoc
  OWNER TO msolution;
COMMENT ON TABLE xuatthuoc
  IS 'chi dinh biet duuoc: (xu tri cap thuoc)';
COMMENT ON COLUMN xuatthuoc.idkh IS 'btdkh.id';
COMMENT ON COLUMN xuatthuoc.idphieuban IS 'phieuban.id';
COMMENT ON COLUMN xuatthuoc.userid IS 'dlogin.id';


DROP TABLE IF EXISTS xuatthuocct;
CREATE TABLE xuatthuocct
(
  id numeric(28,0) NOT NULL DEFAULT 1, -- id chi tiet: ={id, id_bd, stt, madoituong}
  idxuatthuoc numeric(28,0) NOT NULL DEFAULT 0, -- cm_chidinhbd.id
  idduoc numeric(10,0) NOT NULL DEFAULT 0, -- cm_dmbd.id
  stt numeric(5,0) NOT NULL DEFAULT 1,
  soluong numeric(10,5) NOT NULL DEFAULT 0,
  idkho numeric(14,0) DEFAULT 0,
  idnguon numeric(2,0) DEFAULT 0,
  dongia numeric(18,5) NOT NULL DEFAULT 0,
  mien_sl numeric(10,5) NOT NULL DEFAULT 0,
  mien_st numeric(18,5) NOT NULL DEFAULT 0,
  mien_tl numeric(8,5) NOT NULL DEFAULT 0,
  giam_sl numeric(10,5) NOT NULL DEFAULT 0,
  giam_st numeric(18,5) NOT NULL DEFAULT 0,
  giam_tl numeric(8,5) NOT NULL DEFAULT 0,
  slngay numeric(8,5) NOT NULL DEFAULT 0, -- so lan dung trong 1 ngay
  sllan numeric(8,5) NOT NULL DEFAULT 0, -- so luong dung trong 1 lan
  cachngay numeric(8,5) NOT NULL DEFAULT 1,
  songay numeric(8,5) NOT NULL DEFAULT 0, -- so ngay dung het toa (tinh tu dong)
  duongdung character varying(255) DEFAULT ''::character varying,
  thoigian character varying(255) DEFAULT ''::character varying,
  cachdung character varying(255) DEFAULT ''::character varying,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  sl_tra numeric(4,0) DEFAULT 0,
  userid numeric(18,0) DEFAULT 0,
  ngayud timestamp without time zone DEFAULT now(),
  CONSTRAINT xuatthuocct_pkey PRIMARY KEY (id),
  CONSTRAINT xuatthuocct_fkey_cm_chidinhbd_idxuatthuoc_id FOREIGN KEY (idxuatthuoc)
      REFERENCES xuatthuoc (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT xuatthuocct_fkey_dmduoc_idduoc_id FOREIGN KEY (idduoc)
      REFERENCES dmduoc (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=TRUE
);
ALTER TABLE xuatthuocct
  OWNER TO msolution;
COMMENT ON TABLE xuatthuocct
  IS 'chi dinh biet duoc chi tiet: (chi tiet xu tri cap thuoc)';
COMMENT ON COLUMN xuatthuocct.id IS 'id chi tiet: ={id, id_bd, stt, madoituong}';
COMMENT ON COLUMN xuatthuocct.idxuatthuoc IS 'cm_chidinhbd.id';
COMMENT ON COLUMN xuatthuocct.idduoc IS 'cm_dmbd.id';
COMMENT ON COLUMN xuatthuocct.slngay IS 'so lan dung trong 1 ngay';
COMMENT ON COLUMN xuatthuocct.sllan IS 'so luong dung trong 1 lan';
COMMENT ON COLUMN xuatthuocct.songay IS 'so ngay dung het toa (tinh tu dong)';
