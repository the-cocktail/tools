# Jenkins Plugins

  * [Alertas](#alertas)
    * [Slack](#slack)
    * [Mailing](#mailing)
    * [Confirmación del usuario](#confirmación-del-usuario)
  * [Docker Compose](#docker-compose)
    * [Container name](#container-name)
  * [Accesorios](#accesorios)
    * [Publicar](#publicar)
    * [Limpiar logs](#limpiar-logs)
    * [Short commits](#short-commits)
  * [Aplicaciones](#aplicaciones)
    * [SonarQube](#sonarqube)


## Alertas

### Slack

```
  environment {
      // Slack configuration
      SLACK_COLOR_DANGER  = '#E01563'
      SLACK_COLOR_INFO    = '#6ECADC'
      SLACK_COLOR_WARNING = '#FFC300'
      SLACK_COLOR_GOOD    = '#3EB991'
      SLACK_CHANNEL       = '#channel'

      AUTHOR = sh (
          script: 'git --no-pager show -s --format="%an" ${commit}',
          returnStdout: true
      ).trim()
  }


  slackSend (color: "${env.SLACK_COLOR_INFO}",
i                         channel: "${env.SLACK_CHANNEL}",
                         message: "*STARTED:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${env.AUTHOR}\n More info at: ${env.BUILD_URL}")

  slackSend (color: "${env.SLACK_COLOR_GOOD}",
                     channel: "${env.SLACK_CHANNEL}",
                     message: "*SUCCESS:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${env.AUTHOR}\n More info at: ${env.BUILD_URL}")
```

### Mailing

```
  mail bcc: '',
  body: "You can go to ${env.BUILD_URL} to review the build",
  cc: '',
  from: 'jenkins@the-cocktail.com',
  replyTo: '',
  subject: "[${env.PROYECT_NAME}] Jenkins Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) SUCCESS",
  to: 'mail@the-cocktail.com'
```

### Confirmación del usuario

```
  mail (from: 'jenkins@the-cocktail.com',
        to: 'mail@the-cocktail.com',
        subject: "[${env.PROYECT_NAME}] Se requiere aprobación manual para continuar.",
        body: "Por favor, visita ${env.JOB_URL} para confirmar como debe proceder.");

  script {
    def userInput = false
    try {
      timeout(time: 10, unit: 'MINUTES') {
        userInput = input(id: 'Proceed1', message: '¿Qué debo hacer?', parameters: [
          [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Confirmación', name: 'Continuar con este paso']
        ])
      }
    } catch(err) {
      userInput = false
    }

    if (userInput == true) {
      echo 'Doing your step...'
    } else {
      echo 'Doing nothing...'
    }
  }
```

## Docker Compose

### Container name

Es recomendable en el `docker-compose-jenkins.yml` añadir a todos los contenedores la variable `container_name`. Este valor debe ser lo más sencillo y corto posible, además de no contener caracteres especiales.

Esto servirá para que los nombres de los contenedores que usará Jenkins sean completamente compatibles con Docker y no se produzcan errores a la hora de generarlos.

Si no se hace, entonces Jenkins utilizará 80 caracteres para el nombre de las imágenes, usándose 52 para el hash, los restantes son rellenados por el nombre de la rama, comenzando por el final. Esto provoca que a veces el primer carácter pudiese ser un carácter inválido para Docker, como "-" o "/".

## Accesorios

### Publicar

```
  publishHTML target: [
      allowMissing: false,
      alwaysLinkToLastBuild: false,
      keepAll: true,
      reportDir: 'path/to/file',
      reportFiles: 'file.txt',
      reportName: 'Report Name'
  ]
```

### Limpiar logs

```
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
```

### Short commits

```
  environment {
      SHORT_COMMIT = sh (
          script: 'git rev-parse --short=7 HEAD',
          returnStdout: true
      ).trim()
  }
```

Se puede usar posteriormente en los steps de los stages:

```
  sh """
      docker tag \
          ${env.REPO_NAME}:latest \
          ${env.REPO_URI}/${env.PROJECT_ID}/${env.REPO_NAME}:${env.BRANCH_NAME}-${env.SHORT_COMMIT}
      docker tag \
          ${env.REPO_NAME}:latest \
          ${env.REPO_URI}/${env.PROJECT_ID}/${env.REPO_NAME}:${env.BRANCH_NAME}-latest
      docker push ${env.REPO_URI}/${env.PROJECT_ID}/${env.REPO_NAME}:${env.BRANCH_NAME}-${env.SHORT_COMMIT}
      docker push ${env.REPO_URI}/${env.PROJECT_ID}/${env.REPO_NAME}:${env.BRANCH_NAME}-latest
  """
```
```
  sh """
      ...
      kubectl --namespace "${env.BRANCH_NAME}" set image "${env.K8S_RESOURCE_TYPE}/${env.REPO_NAME}-${env.K8S_RESOURCE_TYPE}" "${env.REPO_NAME}"="${env.REPO_URI}/${env.PROJECT_ID}/${env.REPO_NAME}:${env.BRANCH_NAME}-${env.SHORT_COMMIT}"
  """
```

## Aplicaciones

### SonarQube

```
  script {
    scannerHome = tool 'SonarQubeScanner'
  }
  withSonarQubeEnv('SonarQubeScanner') {
    sh "${scannerHome}/bin/sonar-scanner"
  }

```

Además, añadir el fichero `sonar-project.properties`:

```
  # projectKey: repo name (e.g. "sonar.projectKey=thecocktail2016")
  sonar.projectKey=repo-name
  # sources: path to code (e.g. "sonar.sources=app")
  sonar.sources=path-to-code

  # Solo para proyectos Ruby con Covertura de test basada en Simplecov
  sonar.ruby.coverage.reportPath=coverage/.resultset.json
  sonar.ruby.coverage.framework=RSpec
```
