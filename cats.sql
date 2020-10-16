-- list papers only with their students in the format first_name, last_name, title, grade. Ordered in grade in descending order
select
		first_name, last_name,
from papers inner join students on students.id=papers.student_id