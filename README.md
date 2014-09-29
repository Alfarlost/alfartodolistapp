<p>alfartodolistapp</p>
Heroku link: http://safe-hollows-3446.herokuapp.com/

Test user: test@gmail.com, password: test1234

Answers for SQL requests:

We have tables with columns:
<p>● tasks (id, name, status, project_id)</p>
<p>● projects (id, name)</p>

1. get all statuses, not repeating, alphabetically ordered.
<blockquote>
<p>SELECT DISTINCT status</p>
<p>FROM tasks</p>
<p>ORDER BY status</p></blockquote>

2. get the count of all tasks in each project, order by tasks count descending.
<blockquote><p>SELECT projects.id, COUNT(tasks) AS task_count</p>
<p>FROM tasks RIGHT JOIN projects</p>
<p>ON tasks.project_id = projects.id</p>
<p>GROUP BY projects.id</p>
<p>ORDER BY task_count DESC</p>
</blockquote>
3. get the count of all tasks in each project, order by projects names.
<blockquote><p>SELECT projects.name, COUNT(tasks) AS task_count</p>
<p>FROM tasks RIGHT JOIN projects</p>
<p>ON task.project_id=projects.id</p>
<p>GROUP BY projects.id</p>
<p>ORDER BY projects.name</p>
</blockquote>
4. get the tasks for all projects having the name beginning with “N” letter.
<blockquote><p>SELECT projects.name, tasks.name</p>
<p>FROM tasks RIGHT JOIN projects</p>
<p>ON tasks.project_id=projects.id</p></p>
<p>WHERE projects.name LIKE '%N%'</p>
</blockquote>
5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL.
<blockquote><p>SELECT projects.name, COUNT(tasks) AS task_count</p>
<p>FROM tasks RIGHT JOIN projects</p>
<p>ON task.project_id = projects.id</p>
<p>GROUP BY projects.name </p>
<p>HAVING projects.name like '%a%' </p>
<p>AND task.name <>'NULL'</p>
</blockquote>
6. get the list of tasks with duplicate names. Order alphabetically.
<blockquote><p>SELECT id, name</p>
<p>FROM tasks</p>
<p>WHERE name IN</p>
<p>(SELECT name FROM tasks GROP BY name HAVING COUNT(*) >1)</p>
<p>ORDER BY name</p>
</blockquote>
7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count.
<blockquote><p>SELECT tasks.name</p>
<p>FROM tasks RIGHT JOIN projects</p>
<p>ON tasks.projects_id = projects.id</p>
<p>WHERE projects.name = 'Garage' </p>
<p>GROUP BY tasks.name, tasks.status</p>
<p>HAVING COUNT(tasks) >1</p>
<p>ORDER BY COUNT(tasks)</p>
</blockquote>
8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id
<blockquote><p>SELECT  projects.name</p>
<p>FROM tasks RIGTH JOIN projects</p>
<p>ON tasks.projects_id = projects.id</p>
<p>WHERE tasks.status = 'completed'</p>
<p>GROUP BY projects.id HAVING COUNT(tasks) >10</p>
<p>ORDER BY projects.id HAVING status from tasks ORDER BY status</p></blockquote>
