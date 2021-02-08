## Aplicacion RoR
A continuación se detallará brevemente acerca de ciertas decisiones que se fueron tomando a lo largo del desarrollo de la aplicacion 'My Notes' desarrollada en Ruby on Rails.
Para comenzar, se debe hablar acerca de la roganizacion del modelo de datos. Se cuenta con tres entidades (User, Note y Book), las cuales se relacionan basados en las siguientes cardinalidades:
Usuarios y Libros: un usuario posee 0 o N libros, y cada libro pertenece a un usuario.
Libros y Notas: un libro posee 0 o N notas, y una nota conoce a un libro.

Se consideró la idea de hacer una relacion entre usuarios y notas, pero teniendo la regla de negocio que cada nota debe estar en un libro, resultó mejor opción evitar posible redundancia de información, y obtener las notas de un usuario a partir de los libros que posee.

Saliendo un poco del modelo se implementó una capa extra de abstracción para las consultas a la BD, a través de clases 'Services'. La idea es seguir el patrón 'Facade', de modo de centralizar las querys en estas clases, y que desde ellas se utilice al modelo para realizar las consultas.

Finalmente, las vistas fueron implementadas con el sistema de plantillas 'erb', haciendo uso en algunos casos de vistas parciales para modularizar.