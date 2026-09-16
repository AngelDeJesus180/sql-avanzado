USE bdrh;

-- Índice para acelerar búsquedas por salario
CREATE INDEX idx_empleado_salario ON empleados(salario);


SELECT nombres, apellidos, salario
FROM empleados
WHERE salario BETWEEN 8000 AND 12000;

SHOW INDEX FROM empleados;
