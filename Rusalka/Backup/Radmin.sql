CREATE TABLE U_POSTAVKI (
	ID int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	DATA date NULL,
	NAIMENOVANIE varchar2(200) NULL,
	MASSA number(18, 0) NULL,
	KOLICHESTVO_VAGONOV smallint NULL,
	ID_BRIGADY int NULL,
	ID_LOKOMOTIVA int NULL,
	ID_POSTAVSCHIKA int NULL,
	ID_DOC int NULL);
    
insert into u_postavki
    (data, naimenovanie, massa, kolichestvo_vagonov, id_brigady, id_lokomotiva, id_postavschika, id_doc)
values
    (CURRENT_DATE,'Груз из оракла на погрузке', 1024, 8, null, null, null, null);
    
delete from u_postavki where id=7;    
    
commit;

select * from u_postavki order by id;

