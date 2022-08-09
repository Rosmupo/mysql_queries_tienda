
/*1-Llista el nom de tots els productes que hi ha en la taula producto*/
select nombre from producto; 

/*2-Llista els noms i els preus de tots els productes de la taula producto*/
select nombre, precio from producto;

/*3-Llista totes les columnes de la taula producto*/
select * from producto;

/*4-LLista els noms del productes, el preu en euros i el preu en dòlars(USD)*/
select nombre, precio as precio_euros, format (precio * 0.98, 2) as precio_dolars from producto;

/*5-LLista els noms dels productes, el preu en euros i el preu en dòlars(USD) amb els següents àlies, nomb de producto, euros, dòlars*/
select nombre as nom_de_producto, precio as euros, ROUND (precio * 1.03 , 2) as dolars from producto;

/*6-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.*/
select ucase(nombre) as nombre, precio from producto;

/*7-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
select lcase(nombre) as nombre, precio from producto;

/*8-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
select nombre, ucase (left (nombre,2)) as código_fabricante from fabricante;

/*9-Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
select nombre, round(precio, 0) as precio from producto;

/*10-Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
select nombre, truncate (precio, 0) as precio from producto;

/*11-Llista el codi dels fabricants que tenen productes en la taula producto.*/
select codigo_fabricante from producto;

/*12-Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
select distinct codigo_fabricante from producto;

/*13-Llista els noms dels fabricants ordenats de manera ascendent.*/
select nombre from fabricante order by nombre asc;

/*14-Llista els noms dels fabricants ordenats de manera descendent.*/
select nombre from fabricante order by nombre desc;

/*15-Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
select nombre, precio from producto order by nombre asc, precio desc;

/*16-Retorna una llista amb les 5 primeres files de la taula fabricante.*/
select * from fabricante limit 5;

/*17-Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
select * from fabricante limit 3,2;

/*18-Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
select nombre, precio from producto order by precio asc limit 1;

/*19-Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
select nombre, precio from producto order by precio desc limit 1;

/*20-Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
select nombre from producto where codigo_fabricante = 2;

/*21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
select producto.nombre, producto.precio, fabricante.nombre as fabricante from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;

/*22-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.*/
select producto.nombre, producto.precio, fabricante.nombre as fabricante from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre;

/*23-Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.*/
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre as fabricante from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;

/*24-Retorna el nom del producte, el seu preu i el nom del seu fabricant, 
del producte més barat.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio asc limit 1;

/*25-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo  order by producto.precio desc limit 1;

/*26-Retorna una llista de tots els productes del fabricant Lenovo.*/
select fabricante.nombre, producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo';

/*27-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.*/
select fabricante.nombre, producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Crucial' and producto.precio > 200;

/*28-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.*/
select fabricante.nombre, producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Hewlett-Packard' or fabricante.nombre = 'Asus' or fabricante.nombre = 'Seagate';

/*29-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.*/
select fabricante.nombre, producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre in ('Hewlett-Packard','Asus','Seagate');

/*30-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like '%e';

/*31-Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like '%w%';

/*32-Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where producto.precio >= 180 order by producto.precio desc, producto.nombre asc;

/*33-Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.*/
select distinct fabricante.codigo, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo;

/*34-Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/
select fabricante.nombre, producto.nombre from fabricante left join producto on fabricante.codigo = producto.codigo_fabricante;

/*35-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.*/
select fabricante.nombre from fabricante left join producto on producto.codigo_fabricante = fabricante.codigo where producto.codigo_fabricante is null group by fabricante.nombre;

/*36-Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).*/
select producto.nombre, fabricante.nombre from producto, fabricante where  producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo';

/*37-Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).*/
select producto.*, fabricante.nombre from producto, fabricante where  producto.codigo_fabricante = fabricante.codigo and producto.precio = (select max(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo');

/*38-Llista el nom del producte més car del fabricant Lenovo.*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where  producto.precio = (select max(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo');

/*39-Llista el nom del producte més barat del fabricant Hewlett-Packard.*/
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where  producto.precio = (select min(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Hewlett-Packard');

/*40-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.*/
select precio, nombre from producto where precio >=  (select max(precio) from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Lenovo');

/*41-Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo  where fabricante.nombre='Asus' and producto.precio > any (select avg(producto.precio) from producto, fabricante where  producto.codigo_fabricante = fabricante.codigo and fabricante.nombre = 'Asus');


