-- Creacion de las 13 tablas con sus respectivas relaciones.

-- Creacion de la tabla tipos de documentos.

CREATE TABLE `type_of_documents` (
  `id` int,
  `abbreviation` varchar(10),
  `name_of_document` varchar(100),
  PRIMARY KEY (`id`)
);

-- Creacion de la tabla tipos de roles

CREATE TABLE `roles` (
  `id` int ,
  `name` varchar (50) ,
  `descripcion` varchar(200) ,
  PRIMARY KEY (`id`)
);

-- Creacion de la tabla tipos de estudiantes teniendo relacion con la tabla de tipos de documentos.

CREATE TABLE `students` (
  `id` int ,
  `name` varchar (100) ,
  `num_of_document` varchar(50) ,
  `birthdate` date,
  `role_id` int ,
  `type_of_document_id` int ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`type_of_document_id`) REFERENCES `type_of_documents`(`id`)
);

-- Creacion de la tabla jornadas.

CREATE TABLE `schedules` (
  `id` int,
  `name` varchar (50) not null,
  PRIMARY KEY (`id`)
);

-- Creacion de la tabla cursos (refiendose a cursos de grados como: septimo, octavo, noveno entre otros) teniendo relacion con la tabla jornadas.

CREATE TABLE `courses` (
  `id` int ,
  `name` varchar (50) ,
  `description` varchar (100) ,
  `schedule_id` int,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`schedule_id`) REFERENCES `schedules`(`id`)
);

-- Creacion de la tabla materias 

CREATE TABLE `subjects` (
  `id` int,
  `name` varchar (100) ,
  PRIMARY KEY (`id`)
);

-- Creacion de la tabla sedes

CREATE TABLE `sedes` (
  `id` int ,
  `name` varchar (150) ,
  `municipality` varchar(50) ,
  `address` varchar(100) ,
  `cant_floor` int ,
  `cant_classroom` int ,
  `cant_campus_store` int ,
  `cant_bathroom` int ,
  `cant_backyard` int ,
  PRIMARY KEY (`id`)
);

-- Creacion de la tabla cursos_sedes debido a la relacion de muchos a muchos entre la tabla cursos y la tabla sedes.

CREATE TABLE `courses_sedes` (
  `course_id` int,
  `sede_id` int,
  FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`),
  FOREIGN KEY (`sede_id`) REFERENCES `sedes`(`id`)
);

-- Creacion de la tabla materias_cursos debido a la relacion de muchos a muchos entre la tabla cursos, materias y estudiantes.

CREATE TABLE `subjects_courses` (
  `course_id` int,
  `student_id` int,
  `subject_id` int,
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`),
  FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`),
  FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`)
);

-- Creacion de la tabla estudiantes_roles debido a la relacion de muchos a muchos entre la tabla estudiantes y roles.

CREATE TABLE `students_roles` (
  `student_id` int,
  `role_id` int,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`),
  FOREIGN KEY (`student_id`) REFERENCES `students`(`id`)
);

-- Creacion de la tabla empleados teniendo relacion con la tabla roles y tipo de documento.

CREATE TABLE `employees` (
  `id` int ,
  `name` varchar (100) ,
  `num_of_document` varchar(50) ,
  `birthdate` date,
  `salary` float,
  `role_id` int,
  `type_of_document_id` int ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`),
  FOREIGN KEY (`type_of_document_id`) REFERENCES `type_of_documents`(`id`)
);

-- Creacion de la tabla materias_empleados debido a la relacion de muchos a muchos entre la tabla empleados (profesores especificamente) y materias.

CREATE TABLE `subjects_employees` (
  `employee_id` int,
  `subject_id` int,
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`),
  FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`)
);

-- Creacion de la tabla sedes_empleados debido a la relacion de muchos a muchos entre la tabla sedes y empleados.

CREATE TABLE `sedes_employees` (
  `sede_id` int,
  `employee_id` int,
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`),
  FOREIGN KEY (`sede_id`) REFERENCES `sedes`(`id`)
);

