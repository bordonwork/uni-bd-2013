
<!-- saved from url=(0087)https://raw.github.com/bordonwork/uni-bd-2013/master/hisakazu.ishibashi.intro_joins.sql -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head><body><pre style="word-wrap: break-word; white-space: pre-wrap;">/**
 Trabajo #1 - Base de Datos 2013 - UNI
 
 Respuesta a los ejercicios propuestos
 
 Alumno: Hisakazu Ishibashi - kazutron@gmail.com 
 Obs: Este es un archivo de ejemplo
*/


use intro_joins;


-- 1) Lista de todos los miembros

Select * from members;
-- 2)Lista de todos los libros en catalogo
select * from books;
-- 3) Ver que libro tiene actualmente el miembro Dave
-- En la base de datos proporcionada no figura ningun Dave,el id de DAve del pdf pertenece a Harry en la Base de datos
select title from books, loans where (id= book_id) and (member_id=103);
-- 4) Ver que miembros no tienen prestado ningun libro
select name from loans right join members on member_id= id where member_id is null;
-- 5) Lista de todos los libros en stock
select id, title from books left join loans on id= book_id where book_id is null;
-- 6) Lista de los titulos prestados actualmente con el nombre de los socios que lo prestaron

select name, title from (select title, member_id from books left join loans on book_id= books.id where book_id is not null) 
as libros, 
(select name, member_id from members left join loans on id= member_id where member_id is not null) as miembros where libros.member_id = miembros.member_id;    