# Mejoras para Jenkins en proyectos de Ruby-Rails

.

## Rspec

Al lanzar la suite de tests de Rspec se puede lanzar con el flag **--fail-fast** para ahorrar tiempo en caso de producirse algún error
```
    sh 'docker-compose -f docker-compose-jenkins.yml run --rm web rspec --fail-fast'
```

## Cucumber

Se puede mejorar la suite de tests de Cucumber provocando un _early return_ cuando falle uno de sus test.
Se modificará el archivo de configuración **features/support/env.rb**
```
    After do |scenario|
        Cucumber.wants_to_quit = true if scenario.failed?
    end
```

## Jenkins - Deploys automáticos utilizando capistrano

Para entornos de trabajo de pre-producción se puede quere integrar un deploy automático.
Para ello se añade un nuevo step en el Jenkinsfile


_Jenkinsfile_
```
    stage('Deploy in Staging') {
        when {
            branch 'staging'
        }
        steps {
            sh "echo 'Ready to make a staging deploy'"
            sh 'docker-compose -f docker-compose-jenkins.yml run --rm web sh .deploy_actions.sh'
        }
    }
 ```

 Esto requiere que en el step donde se declaran las variables de entorno, al comienzo del Jenkinsfile, tengan algunas variables que van a hacer falta.

**CONFIGURACION AWS**

_Jenkinsfile_
 ```
    environment {

        //Capistrano configuration
        AWS_SECRET_ACCESS_KEY = credentials('aws-env-credentials')
        AWS_ACCESS_KEY_ID     = credentials('aws-env-credentials')
        AWS_DEFAULT_REGION    = 'eu-west-1'

        //ssh configuration
        SSH_CREDENTIALS = credentials('some_authorized_id_rsa')
    }
 ```
Las variables de tipo AWS_ servirán para autenticar el proyecto en AWS y poder obtener roles e IP's de las maquinas donde se hará el deploy.
Necesitaremos que estén disponibles en el contenedor declarándolas en los archivos

_docker-compose-jenkins.yml_

 ```
    services:
        web:
        ...
        args:
            - AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
            - AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
            - AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
 ```

_Dockerfile_
 ```
    ARG AWS_SECRET_ACCESS_KEY
    ARG AWS_ACCESS_KEY_ID
    ARG AWS_DEFAULT_REGION

    ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
    ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
    ENV AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
 ```

*CONFIGURACION SSH-CAPISTRANO*

 ```
    environment {
        //ssh configuration
        SSH_CREDENTIALS = credentials('some_authorized_id_rsa')
    }
 ```
 Las variables de tipo SSH_ servirán para la conexión tipo ssh que utiliza capistrano para hacer el deploy.


 ```
    stage('Preparation') {
        steps {

            sh 'cat $SSH_CREDENTIALS > ./id_rsa'
        }
    }
 ```
Copiamos la clave privada.
Necesitaremos que estén disponibles en el contenedor declarándolas en los archivos

_Dockerfile_
 ```
    RUN mkdir /root/.ssh
    COPY id_rsa /root/.ssh/id_rsa
    RUN chmod 400 /root/.ssh/id_rsa
 ```

Copiamos en la ruta por defecto donde el ssh-agent espera encontrar la clave privada con la que autenticar contra el servidor de pre-producción.
Será el usuario root el que inicie el deploy.
(esta)

En el servidor de pre-producción deberemos haber copiado la clave pública en el archivo /home/deploys/.ssh/authorized_keys.
De esta manera será posible el tunel ssh desde el contenedor de la aplicación corriendo en Jenkins a la máquina de pre-producción

___


El archivo _.deploy_actions.sh_ es el que lanzará el deploy
 ```
    #!/usr/bin/env sh

    eval `ssh-agent`
    ssh-add /root/.ssh/id_rsa

    echo '------------------------ shows if ssh agent has loaded the key correctly -----------------------------'
    ssh-add -l

    bundle exec cap staging deploy BRANCH=Staging
 ```

## Slack

Casi todos los proyectos tienen integración con slack.
Para no generar demasiado ruido en las fases de pruebas se puede crear un canal de Slack dedicado dentro del _docker-compose-jenkins.yml_
```
        //SLACK_CHANNEL       = '#canal_general'
        // Slack_channel for Testing
        SLACK_CHANNEL       = '#canal_pruebas_jenkins'
```