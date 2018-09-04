# Jenkins Plugins

  * [Alertas](#alertas)
    * [Slack](#slack)
    * [Mailing](#mailing)
  * [Accesorios](#accesorios)
    * [Publicar](#publicar)
    * [Limpiar logs](#limpiar-logs)
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
      AUTHOR = sh (
          script: 'git --no-pager show -s --format="%an" ${commit}',
          returnStdout: true
      ).trim()
  }


  slackSend (color: "${env.SLACK_COLOR_INFO}",
                         channel: "#name",
                         message: "*STARTED:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} by ${env.AUTHOR}\n More info at: ${env.BUILD_URL}")

  slackSend (color: "${env.SLACK_COLOR_GOOD}",
                     channel: "#name",
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

## Aplicaciones

### SonarQube

```
  environment {
    SONAR_SCANNER_HOME = tool name: 'SonarQubeScanner'
  }


  withSonarQubeEnv('SonarQubeServer') {
    sh "${env.SONAR_SCANNER_HOME}/bin/sonar-scanner"
  }
```

Además, añadir el fichero `sonar-project.properties`:

```
  # projectKey: repo name (e.g. "sonar.projectKey=thecocktail2016")
  sonar.projectKey=repo-name
  # sources: path to code (e.g. "sonar.sources=app")
  sonar.sources=path-to-code
```