-- EN PROCESO
select a.courseid, b.name, a.finalgrade
from course_has_student a inner join course b on a.courseid = b.courseid;