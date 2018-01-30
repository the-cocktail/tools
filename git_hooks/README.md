## Git Hooks para configurar en local
	
Guía de instalación rápida y de configuración de varios scripts básicos que revisan el estado del proyecto previo `git commit` en local del usuario, alertando de cualquier problema al usuario y pidiendo confirmación en caso de fallo. De está forma se añade una revisión automática y previa a cualquier interacción con el repositorio.

# Instalación

* Añade el fichero `pre-commit` en la siguiente ruta de tu proyecto: `.git/hooks`.
* Descarga la caperta `hooks` y añádela a la raíz de tu proyecto.
* Edita el fichero `hooks/pre-commit-hook.sh` y activa o desactiva (comenta o des-comenta) los tests que quieras revisar.
* Añade la carpeta `hooks` al fichero `.gitignore` de tu proyecto.

# Lista de scripts disponibles:

* Tests:
	* Rspec -> `hooks/tests/rspec.sh`

* QA:
	* Rubocop -> `hooks/tests/rubocop.sh`
	* Rubycritic (al 90%) -> `hooks/tests/rubycritic.sh`

* Documentación:



