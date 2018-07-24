select ((

		(select count(a.finalgrade)-- a.courseid, b.name, a.finalgrade
		from course_has_student a inner join course b on a.courseid = b.courseid
		where b.name like '%Tree climbing%' and a.finalgrade >= 6) /*<-- If I wanted to count the students who failed, I should use instead the < comparison operator*/
    
		/ 
    
		(select count(a.finalgrade)/*a.courseid, b.name, a.finalgrade*/
		from course_has_student a inner join course b on a.courseid = b.courseid
		where b.name like '%Tree climbing%') /*<-- here goes the course name you are filtering by*/
    
    )
		*100) as 'Percentage of students that passed a given course';