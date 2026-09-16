USE bdrh;

DELIMITER //
-- Procedimiento para registrar un dependiente de un empleado
CREATE PROCEDURE registrar_dependiente(
   IN emp_id INT,
   IN nombre VARCHAR(50),
   IN apellido VARCHAR(50),
   IN vinculo VARCHAR(25)
)
BEGIN
   INSERT INTO dependientes(nombres, apellidos, vinculo, empleado_id)
   VALUES (nombre, apellido, vinculo, emp_id);
END;
//

DELIMITER ;
-- inserta un dependiente Laura King como Spouse del empleado con id 100
CALL registrar_dependiente(100, 'Laura', 'King', 'Spouse');

SELECT * FROM empleados WHERE empleado_id= 100;
SELECT * FROM dependientes;