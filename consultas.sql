-- 1) Ver listado de estudiantes de un grupo x.
-- Se le coloca el group by para que me agrupe por nombre en dado caso que el estudiante de ese mismo curso este viendo otras materias como es en elcaso de Mateo Mendoza

select st.name as "User name", c.name as "Course name" from students st 
join subjects_courses sc on st.id = sc.student_id 
join courses c on c.id = sc.course_id  where sc.course_id = 1 group by st.name;

-- 2) Ver la lista de estudiantes que vean una asignatura x.
-- En este caso se busca los estudiantes que esten inscritos a la materia con id 1 que tiene como nombre "Algebra"

select st.name as "Student name", st.num_of_document as "Document number", su.name as "Subject name" from students st 
join subjects_courses sc on st.id = sc.student_id 
join subjects su on su.id = sc.subject_id where su.id = 1 ;

-- 3) Ver la lista de profesores que le dictan clase a un estudiante x.
-- En este punto no se agrupa ya que es prudente mostrar el nombre de la materias que le dicta el estudiante en este caso con id 6 que es Mateo Mendoza.

select em.name as "Teacher name", sb.name as "Subject name", st.name as "Student name"  
from employees em join subjects_employees se on em.id = se.employee_id 
join subjects sb on sb.id = se.subject_id join subjects_courses sc on sb.id = sc.subject_id 
join students st on sc.student_id = st.id  where sc.student_id = 6;

-- 4) Ver los grupos ordenados de forma descendente por la cantidad de estudiantes que tiene inscritos.
-- En este caso se utiliza distic para contar solo una vez al estudiante que aparece repetido debido a que aparece varias veces por materia que tenga inscrita.

select co.name as "Name course", count(distinct so.student_id) as "Students count" from courses co join subjects_courses so on co.id = so.course_id group by co.name order by so.student_id DESC;