USE bdrh;

-- Vista para reporte de empleados con su cargo y departamento
CREATE VIEW reporte_empleados AS
SELECT e.empleado_id, e.nombres, e.apellidos,
	t.trabajo_nombre, e.salario, d.departamento_nombre
FROM empleados e 
JOIN trabajos t ON e.trabajo_id = t.trabajo_id
JOIN departamentos d ON e.departamento_id = d.departamento_id;

SELECT * from reporte_empleados;

