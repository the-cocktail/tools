# Cobertura de tests con SimpleCov

Con esta gema podremos conocer el porcentaje de código que nuestros tests cubren. Nos permite exportarlo tanto el HTML como en JSON y se ejecuta y calcula a la vez que los tests, con lo que no requiere níngún proceso adicional.

## Instalación

Gemfile
```ruby
  gem 'simplecov', :require => false
  gem 'simplecov-json', :require => false
```

## Montaje

Esta instalación es para `rspec` y es posible que para `minitest` difiera un poco, pero no demasiado.

spec_helper.rb
```ruby
	require 'simplecov'
	require 'simplecov-json'

	SimpleCov.formatters = [
	  SimpleCov::Formatter::HTMLFormatter,
	  SimpleCov::Formatter::JSONFormatter
	]

	SimpleCov.start 'rails' do
	  coverage_dir 'reports/simplecov'
	end
```


## Output y Jenkins

Con el `coverage_dir` veremos que generamos los informes en la carpeta `reports/simplecov` y al usar los dos formatos (HTML, JSON) esto nos generará un árbol dé páginas HTML y un fichero JSON para poder pasarselo a aplicaciones externas.

Para poder interactuar con Jenkins y tener visibles los resultados, simplemente publicaremos las páginas HTML, siempre después de haber pasado los tests.

Jenkinsfile
```
  publishHTML target: [
    allowMissing: false,
    alwaysLinkToLastBuild: false,
    keepAll: true,
    reportDir: '/tmp/simplecov/',
    reportFiles: 'index.html',
    reportName: 'Test Coverage Report'
  ]
 ```

### Posibles errores en Jenkins

 Si se producen errores de permisos en la generación de los informes de simplecov, se puede añadir un paso que fuerce el borrado de los reports antes de apagar el contenedor de la ejecución.


 Jenkinsfile
```
  post {
    always {
      sh 'docker-compose -f docker-compose-jenkins.yml run --rm web rm -rf /app/reports/*'
      sh 'docker-compose -f docker-compose-jenkins.yml run --rm web rm -rf /app/reports/.*'
      sh 'docker-compose -f docker-compose-jenkins.yml down -v'
    }
 ```