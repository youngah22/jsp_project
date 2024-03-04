create or replace trigger num_SEQUENCE_TRIGGER
BEFORE INSERT
ON board
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT num_seq.nextval INTO :NEW.num FROM dual;
END;