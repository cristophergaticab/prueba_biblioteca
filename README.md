# prueba_biblioteca

Descripción
Se requiere modelar una base de datos para una biblioteca, de acuerdo a las reglas de
negocio que ha definido el cliente. Debes prestar especial atención en la relación entre las
entidades para crear el modelo conceptual, físico y lógico e implementar la base de datos de
acuerdo a dicho modelamiento.
En detalle, se requiere modelar lo siguiente:
En la biblioteca se guardan los siguientes datos para cada préstamo que se realiza: los
datos del libro (ISBN, título, número de páginas, código del autor, nombre y apellido del autor,
fecha de nacimiento y muerte del autor, tipo de autor (principal, coautor)), datos del
préstamo (fecha de inicio, fecha esperada de devolución y fecha real de devolución) y los
datos del socio (rut, nombre, apellido, dirección y teléfono).
Además, se deben considerar las siguientes restricciones:
- Se registra una única dirección y teléfono para cada socio.
- El ISBN (International Standard Book Number), es un número de 13 cifras que
identifica de una manera única a cada libro o producto de editorial publicado.
- Para este ejercicio, asumirá que la biblioteca posee un ejemplar de cada libro.
- El número único del autor es un correlativo interno que maneja la biblioteca para
identificarlos y facilitar la búsqueda.
- Un libro tiene al menos un autor principal, puede tener además registrado un coautor.
- Un socio sólo puede pedir un libro a la vez.
