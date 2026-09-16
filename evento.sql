USE bdrh;

-- Evento mensual para dar bono de antigüedad
-- Cada fin de mes, RRHH quiere generar un ajuste automático de bono de antigüedad para empleados con más de 20 años en la empresa
CREATE EVENT bono_antiguedad
ON SCHEDULE EVERY 1 MONTH
DO
    UPDATE empleados
    SET salario = salario + 500
    WHERE TIMESTAMPDIFF(YEAR, fecha_ingreso, CURDATE()) >= 20;
    
SHOW EVENTS;

UPDATE empleados
SET salario = salario + 500
WHERE TIMESTAMPDIFF(YEAR, fecha_ingreso, CURDATE()) >= 20;

-- Después del evento (o después de ejecutar el UPDATE manual)
SELECT empleado_id, nombres, apellidos, salario
FROM empleados
WHERE TIMESTAMPDIFF(YEAR, fecha_ingreso, CURDATE()) >= 20;

