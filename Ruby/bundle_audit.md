# Análisis de vulnerabilidades con Audit

Con esta gema podremos conocer las vulnerabilidades de seguridad asociadas a nuestro árbol de dependencias.

## Instalación

Gemfile
```
    group :development, :test do
        gem 'bundler-audit'
```

## Uso

Se actualiza la lista de vulnerabilidades publicadas
```
    bundle audit update
```

Se lanza el comando que las lista
```
    bundle audit
```

Este sería el flujo en un entorno local

## Output y Jenkins

Si se quiere incluir esta capa de seguridad en nuestros builds de Jenkins, se podría añadir lo siguiente dentro del Jenkinsfile, en el stage correspondiente al build, y antes de lanzar la suite de tests o el análisis de código.


Jenkinsfile
```
    stage('Build') {
        steps {
            echo 'Building...'
            sh 'docker-compose -f docker-compose-jenkins.yml build'

            sh 'docker-compose -f docker-compose-jenkins.yml run --rm web bundle audit update'
            sh 'docker-compose -f docker-compose-jenkins.yml run --rm web bundle audit'
            }
 ```

 Si existen vulnerabilidades devolverá un exit 1 e interrumpirá la ejecución.

 Algunas vulnerabilidades son muy difíciles de corregir, por lo que este proceso es muy restrictivo.

 Si se llega al punto de tener alguna vulnerabilidad imposible de corregir en nuestro proyecto, se deberían comentar/eliminar las referencias a audit dentro del Jenkinsfile
 
 ### Añadir excepciones
 
 En el caso de encontrar alguna vulnerabilidad que no se puede solucionar en el momento, existe una manera de hacer que audit la ignore.
 
 La sintaxis sera de este tipo:
 
 `bundle audit --ignore CVE-2018-16476`
 
donde se le pase el identificador de vulnerabilidad que te haya devuelto al pasar el audit.
Un ejemplo:
```
Name: activejob
Version: 4.2.10
Advisory: CVE-2018-16476
Criticality: Unknown
URL: https://groups.google.com/forum/#!topic/rubyonrails-security/FL4dSdzr2zw
Title: Broken Access Control vulnerability in Active Job
Solution: upgrade to ~> 4.2.11, ~> 5.0.7.1, ~> 5.1.6.1, >= 5.2.1.1
```
En el siguiente escaneo ya no aparecería esta vulnerabilidad y el build de Jenkins pasaría sin problemas.
