# Testing y QA

La presente documentación pretende establecer un protocolo para la implantación de testing y QA en [proyectos existentes](#proyectos-existentes) o en [nuevos proyectos](#nuevos-proyectos).

Existe un [glosario](#glosario) así como un compendio de [buenas prácticas](#buenas-practicas) que se consideran vitales para conseguir un equilibrio entre la [cobertura](#cobertura) y la [mantenibilidad](#mantenibilidad) de los tests.

En la versión actual se hace énfasis en los [tests de integración](#test-de-integraci-n) como un primer paso a implementar, con vista a extender la guía en el futuro con __integración continua__, __certificación__, __paridad de entornos__, etc.

## Proyectos existentes

1. Identificar __funcionalidades críticas__ para el negocio,
2. Escribir __historias de usuario__ de esas funcionalidades,
3. Implementar los __tests de integración__ de las historias de usuario.

En un proyecto que ya está funcionando y en el que por tanto no vamos a hacer [TDD](tdd), el objetivo es añadir [tests de integración](#test-de-integraci-n) para __funcionalidades críticas__ y así evitar [regresiones](#regresi-n).

Idealmente es el cliente o en su defecto el [_Product Owner_](#product-owner) quien debe identificar dichas funcionalidades y escribir [historias de usuario](#historia-de-usuario) que el equipo de desarrollo se encargará de implementar como [especificaciones ejecutables](#especificaci-n-ejecutable) en forma de [tests de integración](#test-de-integraci-n).

Una vez identificadas y escritas las historias de usuario en formato [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin), debe implementarse el código que interactúa con la aplicación ([Steps](#steps)). Para ello podemos valernos de librerías como [Cucumber](https://github.com/cucumber/cucumber/) o [Spinach](https://github.com/codegram/spinach) (ruby) o [Behat](http://behat.org/) (PHP).

Idealmente, en este último paso deberíamos seguir las [prácticas](#buenas-practicas) recomendadas más abajo.

No es un escenario ideal porque al estar ya en funcionamiento la aplicación todos los participantes en el proyecto van a estar condicionados a la hora de escribir las historias y los tests (en contraposición a [TDD](#tdd)).

## Nuevos proyectos

En un proyecto nuevo el objetivo es hacer [TDD](#tdd). Los pasos a seguir en realidad son los mismos que en un [proyecto existente](#proyectos-existentes), con la diferencia de que los tests de integración han de estar escritos __antes__ de hacerlos pasar.

Es un escenario ideal en el que los tests de integración son aún más si cabe [especificaciones ejecutables](#especificaciones-ejecutables) y que además permite recopilar las historias de usuario de una forma más natural mediante metodologías como [Event Storming](https://en.wikipedia.org/wiki/Event_storming).

# Glosario

## Cobertura

Es una métrica que indica qué porcentaje del código de la aplicación está siendo probado por los tests. Hay que tener cuidado con ella porque puede generar una falsa sensación de seguridad: una cobertura alta no es sinónimo ni de robustez del código ni de calidad de los tests, pero al mismo tiempo probablemente no queremos que haya una cobertura baja.

No obstante, hay que tener en cuenta que en el testing no se trata de llegar al 100% de cobertura. Se trata de testear de forma adecuada cada parte de la aplicación. Las funcionalidades críticas mediante [tests de integración](#test-de-integraci-n), los casos extremos con [tests unitarios](#test-unitario), etc. y siempre bajo el criterio de quien desarrolle la aplicación. ¿Merece la pena testear una vista en un test unitario? Normalmente no, pero depende del caso. En el fondo es una cuestión de retorno de inversión.

## Mantenibilidad

En el contexto del testing, que los tests estén desacoplados del código se traduce en una mayor mantenibilidad de los mismos. En el caso de los [tests de integración](#test-de-integraci-n) es fácil conseguir esto si se siguen [buenas prácticas](#buenas-practicas).

## Historia de usuario

Es una representación por escrito de un requisito de la aplicación contada desde el punto de vista del usuario. Es importante que esté expresada en términos del cliente y jamás debe incorporar jerga técnica (a no ser que el negocio del cliente tenga que ver con asuntos técnicos, obviamente).

Es muy habitual el formato [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin), con la estructura _Given-When-Then_.

## Step

Es cada una de las líneas que componen una historia de usuario:

```
Dado un usuario registrado
Si visita la home
Entonces ve un mensaje de bienvenida
```

Ejemplo:

```ruby
step "visita la home" do
  visit home_path
end

step "ve un mensaje de bienvenida" do
  expect(page).to have_text("¡Hola!")
end
```

Estos _Steps_ deben implementarse siguiendo [buenas prácticas](#buenas-practicas).

## TDD

Test-driven development. Metodología de desarrollo que requiere que los tests se escriban __antes__ de la funcionalidad.

Incluso en el caso de proyectos que ya están funcionando, puede (y debe) hacerse TDD a la hora de solucionar [regresiones](#regresi-n).

## Test de integración

A diferencia de los [tests unitarios](#test-unitario), los test de integración prueban todo el stack interactuando con la aplicación como si de un usuario final se tratase. Son por tanto ideales para asegurar el correcto funcionamiento de funcionalidades críticas para el negocio.

Su mayor pega es que son lentos, y sus ventajas es que son fáciles de escribir, no requieren mayor conocimiento del código de la aplicación si se [evita el acoplamiento en los steps](#evitar-el-acoplamiento-en-los-steps), que además conlleva un incremento de su [mantenibilidad](#mantenibilidad).

## Test funcional

Se utilizan para testear parte de la aplicación sin llegar a levantar todo el stack, pero implicando varias clases o funciones. Queda a criterio de la persona que los implemente saber cuándo y por qué es necesario un test funcional y no varios unitarios o uno de integración.

Un caso típico sería una test de una clase pero que necesita interactuar con la base de datos (y por tanto tiene como mínimo una dependencia en el ORM y en la propia base de datos).

## Test unitario

Pruebas de código que verifican el funcionamiento de clases/métodos/funciones de forma aislada, sin dependencias. Tienen la ventaja de que se ejecutan mucho más rápido que los [tests funcionales](#test-funcional) o los de [integración](#test-de-integraci-n).

1. Ayudan a diseñar buen código.
  * Si una clase o una función es difícil de testear es que está mal diseñada o tiene demasiadas responsabilidades.
  * Para obtener el mayor beneficio de este punto lo ideal es hacer [TDD](#tdd).
2. Son ideales para testear casos extremos de forma rápida.
  * Por ejemplo, un sistema de descuentos en el que haya que probar que se aplican correctamente según diferentes criterios, a saber: compra mínima, peso del pedido, productos que ya tienen descuento, etc. Probar todos los casos con tests de integración sería demasiado lento.
3. Son ideales para reproducir bugs y evitar regresiones sin falta de tener que levantar todo el stack en un test de integración para el mismo cometido.
4. Similar al punto 3, pueden usarse para testear casos erróneos.
  * Otra vez, usar tests de integración para probar cada caso en el que puede aparecer un error en pantalla es excesivo e ineficiente.

La desventaja de los tests unitarios es que son más difíciles de escribir y de mantener y requieren por tanto más experiencia que los de integración. No resulta siempre fácil que estén desacoplados del código (aunque el acoplamiento suele ser un indicativo de que o bien el test no está bien pensado o el código que se está testeando no está bien diseñado).

## Fragilidad

Un test frágil es aquel que tiene más probabilidad de fallar debido a cambios en la implementación, incluso aunque el comportamiento no haya cambiado. Esto es, es un test que está acoplado con el código que testea.

Los tests deben siempre comprobar que el __comportamiento__ de la aplicación es el adecuado, nunca la __implementación__. En resumen, los tests deben ser pruebas de __caja negra__.

## Especificación ejecutable

Un test escrito de forma consensuada con el cliente en forma de [test de integración](#test-de-integracion). La clave aquí es que la especificación no deja de ser un __contrato__ con el cliente: __especifica qué debe hacer la aplicación y evita regresiones__.

## Regresión

Aparición de un bug en una funcionalidad que hasta ahora funcionaba sin problema.
A la hora de solucionar este tipo de bugs, lo que se debe hacer es usar [TDD](#tdd): reproducimos el bug en un test, y lo hacemos pasar.

## Product Owner

Este término proviene de scrum, pero en cualquier proyecto sería el rol desempeñado por la persona que ejerce de interlocutor con el cliente: conoce el proyecto, las necesidades de negocio y sabe priorizar tareas e identificar las funcionalidades críticas.

## Refactorizar

Es un proceso de desarrollo que no afecta a la funcionalidad, y que sólo persigue mejorar el diseño del código. En un proyecto sin tests el protocolo a seguir sería el siguiente:

1. Añadir un test de integración o funcional para evitar una regresión,
2. Hacer los cambios que se consideren necesarios,
3. Asegurarse de que el test sigue pasando.

¿Por qué podríamos querer refactorizar? Pues un buen ejemplo es el caso en el que queremos hacer un test unitario sobre una funcionalidad crítica o compleja pero el diseño actual del código dificulta escribir el test, normalmente por tener la clase o la función demasiadas responsabilidades y/o dependencias.

En estos casos lo que se pretende es desacoplar el código sin que la funcionalidad que provee deje de funcionar.

# Buenas prácticas

## Evitar el acoplamiento en los _steps_

Imaginemos que tenemos un _step_:

```
  Dado un usuario registrado
```

Aquí hay dos enfoques diferentes a la hora de implementarlo:

1. Interactuar con la aplicación y registrar el usuario, rellenando el formulario de registro, pinchando en el mail de verificación, etc.
  ```ruby
    step "un usuario registrado" do
      visit home_path
      fill_in "Username", with: "JohnDoe"
      fill_in "Password", with: "mypass"
      fill_in "Password confirmation", with: "mypass"
      click_button "Sign up"
    end
  ```
2. Crear el usuario en la base de datos directamente usando el modelo de la aplicación.
  ```ruby
  step "un usuario registrado" do
    User.create!(username: "JohnDoe", password: "mypass")
  end
  ```

Obviamente con el segundo enfoque vamos a ahorrar código y tiempo de ejecución en el test, pero esto tiene un problema y es que el test va a estar acoplado con el código y va a incrementar la [fragilidad](#fragilidad) del test.

La ventaja del primer enfoque es que el test va a ser 100% un test de integración y ni siquiera requiere que quien lo desarrolla conozca los detalles de la implementación de lo que significa que un usuario esté registrado, acercándose más por tanto a ser una prueba de __caja negra__.

## Solucionar regresiones

Siempre debe escribirse un test que reproduzca el bug y después debe hacerse pasar ([TDD](#tdd)). Es la única manera de asegurarse que el test cubre el problema.

Idealmente debería usarse un test unitario si es posible, normalmente no merece la pena usar un test de integración.

## Cucumber vs. Spinach

El buque insignia de los tests de integración siempre ha sido [Cucumber](https://github.com/cucumber/cucumber/). No obstante, su flexibilidad puede inducir a algunos problemas, y por tanto cualquier otra librería que sea un _port_ de Cucumber va a heredarlos:

### Los _steps_ son globales

En [Spinach](https://github.com/codegram/spinach) los steps están escritos en módulos de ruby normales y corrientes, __no son globales__ y en caso de necesitar reutilizarlos es tan fácil como usar `include`.

### Soporte para variables y tablas en los steps:
```ruby
  Dado /un descuento del (.+) en los productos del tipo (.+)%/ do |discount,type|
    [...]
  end
```

Es muy flexible, pero por motivos de legibilidad y mantenibilidad es mejor ceñirse a frases concretas y directamente no usar variables. (Spinach no soporta variables a propósito).

```
Scenario Outline: eating
  Given there are <start> cucumbers
  When I eat <eat> cucumbers
  Then I should have <left> cucumbers

  Examples:
    | start | eat | left |
    |  12   |  5  |  7   |
    |  20   |  5  |  15  |
```

Esta especificación lo que haría sería ejecutar las diferentes permutaciones del escenario según la tabla provista en "Examples".

Es fácil ver por qué alguien querría usar este estilo. Tenemos un [test de integración](#test-de-integraci-n) y podemos reutilizarlo para probar casos extremos y cómo estos se solapan. Problema: los [tests de integración](#test-de-integraci-n) son __lentos__. Lo ideal sería probar __un caso base__ desde un [test de integración](#test-de-integraci-n) __sin variables__, y las diferentes permutaciones aquí representadas en la tabla de ejemplos en [tests unitarios](#test-unitario), que son mucho más rápidos.

### Conclusión

Aunque se utilice Cucumber u otra librería que tenga soporte para variables y tablas, es mejor ceñirse a _steps_ que no soporten variables. Esto obviamente queda siempre a discreción de quien desarrolle los tests y no es obligatorio, es simplemente una recomendación.

Una buena explicación de todo esto se puede ver en [esta presentación sobre Spinach](http://codegram.github.io/spinach-presentation).
