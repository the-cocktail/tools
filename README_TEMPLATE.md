Template para README
Remplaza todo lo que este entre comillas, si algun literal no aplica para tu proyecto dejalo en blanco pero no lo borres.

# "Nombre del proyecto"
"Describe tu proyecto, ¿que tipo de proyecto es? ¿que hace?"

## Stack tecnológico
"¿Que tipo de arquitectura es? (MVC, Componentes, Microservicios...)"

* "Lenguaje con su version específica"
* "Framework con su version específica"
* "Base de datos con su version específica"
* "‎Servicio de cache ej: Redis"
* "Servicio de cola de trabajos ej: Sidekiq"

## Instalación y configuración
"Escribe los pasos necesarios para poder iniciar la aplicación y sus servicios principales, puedes enlazar a documentación externa o agregarlo como prerequisito; pero no des por hecho que otro desarrollador ya lo sabe.

En los procesos de instalación describe los servicios que deben ser iniciados para que funcione ej: base de datos, redis, etc. Si es posible describe como hacerlo con docker.

Puedes agregar mas literales en el orden que necesites pero no borres ninguno de estos.
si existe un script o una imagen que ya ha ejecutado ese proceso escribe que el proceso ya ha sido ejecutado."

- Prerequisitos

"¿Qué prerequisitos necesita el proyecto?"
- ‎Gestión de claves

"Escribe o enlaza como se consiguen las claves necesarias para iniciar el proyecto"
- Instalar dependencias
```sh

```
- ‎Aprovisionamiento de datos

"Explica los pasos necesarios para aprovisionar la aplicación de datos ej: ejecutando una seed o descargando un backup de base de datos"
```sh

```
- ‎Iniciar

"Escribe el comando o los comandos necesarios para que la aplicación inicie"
```sh

```

## Enlaces de interés

* Wiki:
* ‎Staging:
* ‎Producción:
* Documentación en drive:
* Canales de comunicación:
* Claves y permisos:
* Proceso de despliegue:
* Monitorización:
* Integración continua:

## Ayuda para el desarrollador
"Algún consejo importante o cualquier problema recurrente que encuentres como desarrollador agregalo aqui o pon un enlace a la wiki"

### usuarios de prueba
"si tu aplicacion no necesita usuarios de prueba, escribe que debe crear una cuenta y donde"

### despliegue
```sh
"comando o comandos que utilices para desplegar a staging"
```
### test
```sh
"comando que utilices para ejecutar la suite de test"
```
### linter
```sh
"comando que utilices para ejecutar tu validador de guia de estilos
ej: bundle exec rubocop, npm run eslint, mix dogma"
```
