-- Inserccion de datos 

-- Inserccion a la tabla tipos de documentos
INSERT INTO type_of_documents 
(id, abbreviation, name_of_document) VALUES
(1, 'DNI', 'Documento Nacional de Identidad'),
(2, 'LC', 'Libreta Cívica'),
(3, 'LE', 'Libreta de Enrolamiento'),
(4, 'CI', 'Cédula de Identidad'),
(5, 'PAS', 'Pasaporte');

-- Inserccion a la tabla roles
INSERT INTO roles 
(id, name, descripcion) VALUES
(1, 'Estudiante', 'Rol para los estudiantes'),
(2, 'Docente', 'Rol para los docentes'),
(3, 'Administrativo', 'Rol para el personal administrativo'),
(4, 'Director', 'Rol para los directores'),
(5, 'Auxiliar', 'Rol para los auxiliares');

-- Relacion 1
-- Inserccion a la tabla estudiantes teniendo relacion con las tablas roles y tipo de documentos 
INSERT INTO students
(id, name, num_of_document, birthdate, role_id, type_of_document_id) VALUES
(1, 'Juan Pérez', '12345678', '2000-05-15', 1, 1),
(2, 'María López', '23456789', '1999-10-20', 1, 2),
(3, 'Pedro Gómez', '34567890', '2001-03-25', 1, 3),
(4, 'Ana Martínez', '45678901', '2002-08-30', 1, 4),
(5, 'Carlos Sánchez', '56789012', '1998-12-05', 1, 5),
(6, 'Mateo Mendoza', '1001469192', '1998-12-05', 1, 1);

-- Inserccion a la tabla jornadas
INSERT INTO schedules 
(id, name) VALUES
(1, 'Mañana'),
(2, 'Tarde'),
(3, 'Noche'),
(4, 'Fines de semana'),
(5, 'Mixto');

-- Relacion 2
-- Inserccion a la tabla cursos teniendo relacion con las tabla jornadas

INSERT INTO courses 
(id, name, description, schedule_id) VALUES
(1, 'Séptimo', 'Personas del grado séptimo', 1),
(2, 'Octavo', 'Personas del grado octavo', 2),
(3, 'Noveno', 'Personas del grado noveno', 3),
(4, 'Décimo', 'Personas del grado décimo', 1),
(5, 'Undécimo', 'Personas del grado undécimo', 2);

-- Inserccion a la tabla materias

INSERT INTO subjects (id, name) VALUES
(1, 'Álgebra'),
(2, 'Geografía'),
(3, 'Algoritmos'),
(4, 'Literatura Clásica'),
(5, 'Gramática Inglesa');

-- Inserccion a la tabla sedes

INSERT INTO sedes 
(id, name, municipality, address, cant_floor, cant_classroom, cant_campus_store, cant_bathroom, cant_backyard) VALUES
(1, 'Sede Central', 'Ciudad Capital', 'Av. Principal 123', 5, 30, 2, 6, 1),
(2, 'Sede Norte', 'Ciudad del Norte', 'Calle Norteña 456', 3, 20, 1, 4, 0),
(3, 'Sede Sur', 'Ciudad del Sur', 'Calle Sureña 789', 4, 25, 1, 5, 0),
(4, 'Sede Este', 'Ciudad del Este', 'Calle del Este 101', 2, 15, 1, 3, 0),
(5, 'Sede Oeste', 'Ciudad del Oeste', 'Calle del Oeste 202', 3, 18, 1, 4, 0);

-- Relacion 3
-- Inserccion a la tabla courses_sedes teniendo relacion de muchos a muchos con las tablas cursos y sedes

INSERT INTO courses_sedes (course_id, sede_id) VALUES
(1, 1), -- Séptimo en Sede Central
(2, 2), -- Octavo en Sede Norte
(3, 3), -- Noveno en Sede Sur
(4, 4), -- Décimo en Sede Este
(5, 5); -- Undécimo en Sede Oeste

-- Relacion 4
-- Inserccion a la tabla courses_sedes teniendo relacion de muchos a muchos con las tablas cursos, estudiantes y materias

INSERT INTO subjects_courses (course_id, student_id, subject_id) VALUES
(1, 1, 1), -- Estudiante Juan Pérez inscrito en Álgebra para Séptimo
(2, 2, 2), -- Estudiante María López inscrito en Geografía para Octavo
(3, 3, 3), -- Estudiante Pedro Gómez inscrito en Algoritmos para Noveno
(4, 4, 4), -- Estudiante Ana Martínez inscrito en Literatura Clásica para Décimo
(5, 5, 5),-- Estudiante Carlos Sánchez inscrito en Gramática Inglesa para Undécimo
(1, 6, 1), -- Estudiante Mateo Mendoza inscrito en Álgebra para Séptimo
(1, 6, 2), -- Estudiante Mateo Mendoza inscrito en Geografía para Séptimo
(1, 6, 4); -- Estudiante Mateo Mendoza inscrito en Literatura Clásica para Séptimo

-- Relacion 5
-- Inserccion a la tabla estudiantes_roles teniendo relacion de muchos a muchos con las tablas estudiantes, roles

INSERT INTO students_roles (student_id, role_id) VALUES
(1, 1), -- Juan Pérez es estudiante
(2, 1), -- María López es estudiante
(3, 1), -- Pedro Gómez es estudiante
(4, 1), -- Ana Martínez es estudiante
(5, 1); -- Carlos Sánchez es estudiante

-- Relacion 6
-- Inserccion a la tablas empleados teniendo relacion con las tablas roles y tipos de documento

INSERT INTO employees (id, name, num_of_document, birthdate, salary, role_id, type_of_document_id) VALUES
(1, 'Laura Rodríguez', '3456789', '1985-06-10', 25000.00, 3, 2), -- Administrativo con LC
(2, 'Javier Pérez', '4567890', '1978-03-15', 35000.00, 2, 1), -- Docente con DNI
(3, 'Ana González', '5678901', '1980-09-20', 30000.00, 4, 3), -- Director con LE
(4, 'Pedro Sánchez', '6789012', '1982-12-05', 28000.00, 5, 4), -- Auxiliar con CI
(5, 'María López', '7890123', '1975-04-25', 32000.00, 2, 5); -- Docente con Pasaporte

-- Relacion 7
-- Inserccion a la tablas materias_empleados (profesores) teniendo relacion de muchos a muchos con las tablas empleados y materias

INSERT INTO subjects_employees (employee_id, subject_id) VALUES
(2, 1), -- Javier Pérez enseña Álgebra
(2, 2), -- Javier Pérez enseña Geografía
(5, 3), -- María López enseña Algoritmos
(5, 4), -- María López enseña Literatura Clásica
(5, 5); -- María López enseña Gramática Inglesa

-- Relacion 8
-- Inserccion a la tablas materias_empleados (profesores) teniendo relacion de muchos a muchos con las tablas sedes y empleados
INSERT INTO sedes_employees (sede_id, employee_id) VALUES
(1, 3), -- Ana González trabaja en Sede Central
(2, 4), -- Pedro Sánchez trabaja en Sede Norte
(3, 5), -- María López trabaja en Sede Sur
(4, 1), -- Laura Rodríguez trabaja en Sede Este
(5, 2); -- Javier Pérez trabaja en Sede Oeste