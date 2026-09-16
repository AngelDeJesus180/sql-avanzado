USE bdrh;

DELIMITER //

CREATE TRIGGER trg_validar_salario
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
    DECLARE min_sal DECIMAL(8,2);
    DECLARE max_sal DECIMAL(8,2);

    SELECT salario_min, salario_max INTO min_sal, max_sal
    FROM trabajos WHERE trabajo_id = NEW.trabajo_id;

    IF NEW.salario < min_sal OR NEW.salario > max_sal THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El salario está fuera del rango permitido';
    END IF;
END;
//

DELIMITER ;

-- Este insert fallará si el salario está fuera del rango del trabajo_id 9
INSERT INTO empleados(nombres, apellidos, email, fecha_ingreso, trabajo_id, salario, departamento_id)
VALUES ('Pedro','Gomez','pedro.gomez@empresa.com','2020-01-01',9,20000,6);

SHOW TRIGGERS FROM bdrh;
