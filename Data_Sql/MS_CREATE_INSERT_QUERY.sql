-- select 'INSERT INTO dmphai(id,id_cha,idtt,idquan,idxa,idtuyen,idloai,idhang,idvung,ma,ten,diachi,dienthoai,fax,email,website,masothue,nganhang,giamdoc,phogiamdoc,quantri,ketoan,mabh) VALUES ('||id||','||id_cha||','''||matt||''','''||maquan||''','''||maxa||''','||matuyen||','||maloai||','||mahang||','||mavung||','''||ma||''','''||ten||''','''||diachi||''','''||dienthoai||''','''||fax||''','''||email||''','''||website||''','''||masothue||''','''||nganhang||''','''||giamdoc||''','''||phogiamdoc||''','''||quantri||''','''||ketoan||''','''||mabh||''');' from cm_data.tenvien order by MA



select 'INSERT INTO dmdonvi(id,ten) VALUES ('||id||','''||ten||''');' from cm_data.cm_dmdonvisd order by MA


DROP TABLE IF EXISTS dmdonvi;

CREATE TABLE dmdonvi
(
  id numeric(5,0) NOT NULL DEFAULT 0,
  ma character varying(50) DEFAULT ''::character varying,
  ten character varying(255) DEFAULT ''::character varying,
  ten_en character varying(255) DEFAULT ''::character varying,
  stt serial,
  tinhtrang character varying(10) DEFAULT '0000000000'::character varying,
  userid numeric(18,0) DEFAULT 0,
  ngayud timestamp without time zone DEFAULT now(),
  ten_fr character varying(255) DEFAULT ''::character varying,
  CONSTRAINT dmdonvi_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE dmdonvi
  OWNER TO msolution;
COMMENT ON TABLE dmdonvi
  IS 'danh muc don vi su dung';

INSERT INTO dmdonvi(id,ten) VALUES (1,'Bồn');
INSERT INTO dmdonvi(id,ten) VALUES (2,'Sylanh');
INSERT INTO dmdonvi(id,ten) VALUES (3,'Chiếc');
INSERT INTO dmdonvi(id,ten) VALUES (4,'Kit/6v');
INSERT INTO dmdonvi(id,ten) VALUES (5,'Bột pha huyền dịch');
INSERT INTO dmdonvi(id,ten) VALUES (6,'Dung dịch tiêm truyền');
INSERT INTO dmdonvi(id,ten) VALUES (7,'Giọt');
INSERT INTO dmdonvi(id,ten) VALUES (8,'Điếu');
INSERT INTO dmdonvi(id,ten) VALUES (9,'Chai');
INSERT INTO dmdonvi(id,ten) VALUES (10,'Quyển');
INSERT INTO dmdonvi(id,ten) VALUES (11,'Ofloxacin');
INSERT INTO dmdonvi(id,ten) VALUES (12,'Sọi');
INSERT INTO dmdonvi(id,ten) VALUES (13,'Túi nhựa');
INSERT INTO dmdonvi(id,ten) VALUES (14,'Bộ thuốc');
INSERT INTO dmdonvi(id,ten) VALUES (15,'Dây');
INSERT INTO dmdonvi(id,ten) VALUES (16,'Can');
INSERT INTO dmdonvi(id,ten) VALUES (17,'Gói');
INSERT INTO dmdonvi(id,ten) VALUES (18,'Cerivastatin sodium');
INSERT INTO dmdonvi(id,ten) VALUES (19,'Viên sủi');
INSERT INTO dmdonvi(id,ten) VALUES (20,'Tép');
INSERT INTO dmdonvi(id,ten) VALUES (21,'Lọ/Hộp');
INSERT INTO dmdonvi(id,ten) VALUES (22,'Bút');
INSERT INTO dmdonvi(id,ten) VALUES (23,'Thùng');
INSERT INTO dmdonvi(id,ten) VALUES (24,'Hủ');
INSERT INTO dmdonvi(id,ten) VALUES (25,'Bóng');
INSERT INTO dmdonvi(id,ten) VALUES (26,'Cetirizine hydrochlo');
INSERT INTO dmdonvi(id,ten) VALUES (27,'Vịt');
INSERT INTO dmdonvi(id,ten) VALUES (28,'Cefprozil');
INSERT INTO dmdonvi(id,ten) VALUES (29,'C/100');
INSERT INTO dmdonvi(id,ten) VALUES (30,'Celiprolol');
INSERT INTO dmdonvi(id,ten) VALUES (31,'Đĩa');
INSERT INTO dmdonvi(id,ten) VALUES (32,'Lắt');
INSERT INTO dmdonvi(id,ten) VALUES (33,'1');
INSERT INTO dmdonvi(id,ten) VALUES (34,'Nhộng');
INSERT INTO dmdonvi(id,ten) VALUES (35,'Bảng');
INSERT INTO dmdonvi(id,ten) VALUES (36,'UI');
INSERT INTO dmdonvi(id,ten) VALUES (37,'Bình xịr');
INSERT INTO dmdonvi(id,ten) VALUES (38,'Liều');
INSERT INTO dmdonvi(id,ten) VALUES (39,'Lần');
INSERT INTO dmdonvi(id,ten) VALUES (40,'Cm');
INSERT INTO dmdonvi(id,ten) VALUES (41,'Mg');
INSERT INTO dmdonvi(id,ten) VALUES (42,'Bút tiêm');
INSERT INTO dmdonvi(id,ten) VALUES (43,'Viên đặt');
INSERT INTO dmdonvi(id,ten) VALUES (44,'Quả');
INSERT INTO dmdonvi(id,ten) VALUES (45,'Dàn');
INSERT INTO dmdonvi(id,ten) VALUES (46,'Lít');
INSERT INTO dmdonvi(id,ten) VALUES (47,'Xấp');
INSERT INTO dmdonvi(id,ten) VALUES (48,'Kg');
INSERT INTO dmdonvi(id,ten) VALUES (49,'Bơm xịt');
INSERT INTO dmdonvi(id,ten) VALUES (50,'Khoanh');
INSERT INTO dmdonvi(id,ten) VALUES (51,'Cây');
INSERT INTO dmdonvi(id,ten) VALUES (52,'Miếng');
INSERT INTO dmdonvi(id,ten) VALUES (53,'Vitamin C');
INSERT INTO dmdonvi(id,ten) VALUES (54,'Carteolol');
INSERT INTO dmdonvi(id,ten) VALUES (55,'');
INSERT INTO dmdonvi(id,ten) VALUES (56,'Mét');
INSERT INTO dmdonvi(id,ten) VALUES (57,'Đội');
INSERT INTO dmdonvi(id,ten) VALUES (58,'Lưỡi');
INSERT INTO dmdonvi(id,ten) VALUES (59,'Chậu');
INSERT INTO dmdonvi(id,ten) VALUES (60,'50 Gram/Lọ');
INSERT INTO dmdonvi(id,ten) VALUES (61,'Cefalexin');
INSERT INTO dmdonvi(id,ten) VALUES (62,'Tấm');
INSERT INTO dmdonvi(id,ten) VALUES (63,'Ceftibuten');
INSERT INTO dmdonvi(id,ten) VALUES (64,'Bình');
INSERT INTO dmdonvi(id,ten) VALUES (65,'Tube');
INSERT INTO dmdonvi(id,ten) VALUES (66,'Tub');
INSERT INTO dmdonvi(id,ten) VALUES (67,'Cyanocobalamin');
INSERT INTO dmdonvi(id,ten) VALUES (68,'Cặp');
INSERT INTO dmdonvi(id,ten) VALUES (69,'Lọ');
INSERT INTO dmdonvi(id,ten) VALUES (70,'Lit');
INSERT INTO dmdonvi(id,ten) VALUES (71,'Amoxicillin tryhydrat');
INSERT INTO dmdonvi(id,ten) VALUES (72,'Lẵng');
INSERT INTO dmdonvi(id,ten) VALUES (73,'Test');
INSERT INTO dmdonvi(id,ten) VALUES (74,'Bao');
INSERT INTO dmdonvi(id,ten) VALUES (75,'Viên');
INSERT INTO dmdonvi(id,ten) VALUES (76,'Ceftizoxime');
INSERT INTO dmdonvi(id,ten) VALUES (77,'Trái');
INSERT INTO dmdonvi(id,ten) VALUES (78,'Tập');
INSERT INTO dmdonvi(id,ten) VALUES (79,'Hộp 50 miếng');
INSERT INTO dmdonvi(id,ten) VALUES (80,'Discs');
INSERT INTO dmdonvi(id,ten) VALUES (81,'Cuốn');
INSERT INTO dmdonvi(id,ten) VALUES (82,'Đơn vị');
INSERT INTO dmdonvi(id,ten) VALUES (83,'Con');
INSERT INTO dmdonvi(id,ten) VALUES (84,'Cục');
INSERT INTO dmdonvi(id,ten) VALUES (85,'Tuýp');
INSERT INTO dmdonvi(id,ten) VALUES (86,'?“i');
INSERT INTO dmdonvi(id,ten) VALUES (87,'Cefalexin monohydrat');
INSERT INTO dmdonvi(id,ten) VALUES (88,'Cards');
INSERT INTO dmdonvi(id,ten) VALUES (89,'Vĩ');
INSERT INTO dmdonvi(id,ten) VALUES (90,'Bộ/2 Cái');
INSERT INTO dmdonvi(id,ten) VALUES (91,'Tes');
INSERT INTO dmdonvi(id,ten) VALUES (92,'Đơn vị răng');
INSERT INTO dmdonvi(id,ten) VALUES (93,'Thanh');
INSERT INTO dmdonvi(id,ten) VALUES (94,'Ống');
INSERT INTO dmdonvi(id,ten) VALUES (95,'Bơm tiêm');
INSERT INTO dmdonvi(id,ten) VALUES (96,'Vĩ/12');
INSERT INTO dmdonvi(id,ten) VALUES (97,'Đôi');
INSERT INTO dmdonvi(id,ten) VALUES (98,'Hộp');
INSERT INTO dmdonvi(id,ten) VALUES (99,'Tờ');
INSERT INTO dmdonvi(id,ten) VALUES (100,'Bơm');
INSERT INTO dmdonvi(id,ten) VALUES (101,'??a');
INSERT INTO dmdonvi(id,ten) VALUES (102,'Liếp');
INSERT INTO dmdonvi(id,ten) VALUES (103,'Cartridges');
INSERT INTO dmdonvi(id,ten) VALUES (104,'Cuộn');
INSERT INTO dmdonvi(id,ten) VALUES (105,'Bịch');
INSERT INTO dmdonvi(id,ten) VALUES (106,'Ml');
INSERT INTO dmdonvi(id,ten) VALUES (107,'Bát');
INSERT INTO dmdonvi(id,ten) VALUES (108,'Gram');
INSERT INTO dmdonvi(id,ten) VALUES (109,'Sợi');
INSERT INTO dmdonvi(id,ten) VALUES (110,'Cefaclor');
INSERT INTO dmdonvi(id,ten) VALUES (111,'Tệp');
INSERT INTO dmdonvi(id,ten) VALUES (112,'Taurine');
INSERT INTO dmdonvi(id,ten) VALUES (113,'Bộ');
INSERT INTO dmdonvi(id,ten) VALUES (114,'Ống tiêm nạp sẵn');
INSERT INTO dmdonvi(id,ten) VALUES (115,'Bịt');
INSERT INTO dmdonvi(id,ten) VALUES (116,'Cái');
INSERT INTO dmdonvi(id,ten) VALUES (117,'Hoàn');
INSERT INTO dmdonvi(id,ten) VALUES (118,'Mắt');
INSERT INTO dmdonvi(id,ten) VALUES (119,'Túi');
INSERT INTO dmdonvi(id,ten) VALUES (120,'Thang');
INSERT INTO dmdonvi(id,ten) VALUES (121,'B?');
INSERT INTO dmdonvi(id,ten) VALUES (122,'Que');
INSERT INTO dmdonvi(id,ten) VALUES (123,'H/1');
INSERT INTO dmdonvi(id,ten) VALUES (124,'Chloramphenicol');

UPDATE dmdangbd SET ma = 'DAN'||lpad(stt,4,'0');






