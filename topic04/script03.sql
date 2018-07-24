select /*a.courseid,*/a.name as 'Course Name', /*a.teacherid,*/ b.lastname as 'Profesor Last Name', b.firstname as 'Profesor First Name', /*c.studentid,*/ d.lastname as 'Student Last Name',d.firstname as 'Student First Name'
from ( (course a inner join teacher b on a.teacherid=b.teacherid)
	  inner join course_has_student c on a.courseid = c.courseid )
      inner join student d on c.studentid = d.studentid
-- where a.name = 'The art of running'; --here goes the course name you are looking for