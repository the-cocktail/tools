# Jenkins en Front

  * [Metodología](#metodología)
    * [Scripts](#scripts)
    * [Sonarqube](#sonarqube)
  * [JenkinsFile](#JenkisFile)
   

## Metodología
Todos los proyectos de Front deberán pasar por una integración continua (en este caso Jenkins) para correr determinados scripts que garanticen la calidad y fiabilidad de nuestro código.

Incluso si el CI no realizara ningún tipo de despliegue, el proyecto deberá igualmente ser ejecutado por Jenkins para correr los siguientes scripts:

* **JavaScript Linter:** *npm run lint*
* **Style Linter:** *npm run stylelint*
* **JavaScript Unit Testing:** *npm run test:unit*

A su vez el proyecto deberá enviarse al **Sonarqube** de The Cocktail para analizar posibles *code smells* del mismo y también mostrar en un sitio centralizado la cobertura de los tests. 

### Scripts
Los scripts mencionados anteriormente serán los principales encargados de correr, según la configuración de cada proyecto, determinadas tareas que evaluaran nuestro código. Estos scripts se correrán bajo *node* y cada uno de ellos apuntara a las ejecuciones descriptas en el *package.json* de su proyecto.

Ejemplo de *package.json*
```
  "scripts": {
    "lint": "vue-cli-service lint --fix",
    "stylelint": "stylelint 'src/**/*.scss' --fix; exit 0",
    "test:unit": "vue-cli-service test:unit"
  },
```

### Sonarqube
Para que el proyecto se envíe a **Sonarqube** es necesario un archivo de configuración bajo el siguiente naming *sonar-project.properties*.

Ejemplo de *sonar-project.properties*

```
# projectKey: repo name (e.g. "sonar.projectKey=thecocktail2016")
sonar.projectKey=roadis-risk-management-front
# sources: path to code (e.g. "sonar.sources=app")
sonar.sources=src
sonar.tests=tests
```

### JenkinsFile

Para que todos estos scripts y Sonar se corran en nuestra herramienta de integración continua todos los projectos deberán tener un imagen de *docker* con *node*.
A continuación se muestra la configuración básica de un *Jenkinsfile* para que se corrán los scripts de *node* y se envie el proyecto al Sonar de TCK.

```
stage('Test & Coverage') {
    steps {
        echo 'Testing...'
        sh "docker run --rm ${env.PROJECT}:latest npm run test:unit"
    }
}
stage('Code Review') {
    steps {
        echo 'Code reviewing...'
        echo 'Running JS Linter'
        sh "docker run --rm ${env.PROJECT}:latest npm run lint"
        echo 'Running Style Linter'
        sh "docker run --rm ${env.PROJECT}:latest npm run stylelint"

        echo 'Code Review w/ SonarQubeScanner...'
        script {
          scannerHome = tool 'SonarQubeScanner'
        }
        withSonarQubeEnv('SonarQubeScanner') {
          sh "${scannerHome}/bin/sonar-scanner"
        }
    }
}
```

