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
