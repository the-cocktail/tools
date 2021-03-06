- [Tests](#tests)
- [Logging and monitoring](#logging-and-monitoring)
- [API Builders & DSL](#api-builders--dsl)
- [Ruby Gems](#ruby-gems)
  - [Our gems](#our-gems)
  - [Third party gems](#third-party-gems)
- [Ruby Web Frameworks](#ruby-web-frameworks)
- [PHP Web Frameworks](#php-web-frameworks)
- [Python Web Frameworks](#python-web-frameworks)
- [Ecommerce Frameworks](#ecommerce-frameworks)
- [React utilities](#react-utilities)
- [JS libraries](#js-libraries)
- [Front End Frameworks](#front-end-frameworks)
- [Front End Tools](#front-end-tools)
- [Infrastructure management utilities](#infrastructure-management-utilities)
- [ORM](#orm)
- [Shell Plugins](#shell-plugins)
- [Editor Plugins](#editor-plugins)
- [IDE & Text Editor](#ide--text-editor)
- [Linux utilities](#linux-utilities)
- [Development environments](#development-environments)
- [Other awesome lists](#other-awesome-lists)

## Tests
  * [rubocop](https://github.com/bbatsov/rubocop) - A Ruby static code analyzer, based on the community Ruby style guide (*NOTA*: nuestro estilo lo estamos definiendo *entre todo el equipo* [este .rubocop.yml](https://github.com/the-cocktail/tools/blob/master/.rubocop.yml). No te cortes, comenta cualquier capricho que tengas!!)
  * [minitest](https://github.com/seattlerb/minitest) - _minitest_ provides a complete suite of testing facilities supporting TDD, BDD, mocking, and benchmarking.
  * [rspec](https://github.com/rspec/rspec) - Behaviour Driven Development for Ruby
  * [circleci](https://circleci.com/docs/2.0/hello-world/) - Continuous Integration and Continuous Deployment with Ruby/Rails [.config.yml](https://github.com/the-cocktail/tools/blob/master/.config.yml)
  * [Tests y QA](QA/) - About testing and QA

## Logging and monitoring
  * [grafana](https://github.com/grafana/grafana) - The tool for beautiful monitoring and metric analytics & dashboards for Graphite, InfluxDB & Prometheus & More
  * [scoutapp](https://scoutapp.com/) - Ruby on Rails app monitoring to track down memory leaks, N+1s, slow code and more

## API Builders & DSL
  * [flask](http://flask.pocoo.org/) - Flask is a microframework for Python based on Werkzeug, Jinja 2 and good intentions
  * [sinatra](http://www.sinatrarb.com/) - Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.
  * [plug](https://github.com/elixir-lang/plug) - A specification and conveniences for composable modules between web applications
  * [grape](https://github.com/ruby-grape/grape) - An opinionated framework for creating REST-like APIs in Ruby.
  * [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) - Doorkeeper is a gem that makes it easy to introduce OAuth 2 provider functionality to your Rails or Grape application.
  * [Postman](https://www.getpostman.com/) - A powerful GUI platform to make your API development faster & easier, from building API requests through testing, documentation and sharing.
  * [GraphQL](https://www.graphql.com/) - GraphQL is an open spec for a flexible API layer. Put GraphQL over your existing backends to build products faster than ever before.

## Ruby Gems
### Our gems
  * [Our gems](/Ruby/our_gems.md) - Gems developed by The Cocktail.
  
### Third party gems
  * [Goldiloader](https://github.com/salsify/goldiloader) - Lazy-loading con ActiveRecord.
  * [Pronto](https://github.com/prontolabs/pronto) - Quick automated code review of your changes
  * [spreadsheet](https://github.com/zdavatz/spreadsheet) - The Ruby Spreadsheet by ywesee GmbH
  * [tacoma](https://github.com/pantulis/tacoma) - Simple wrapper for AWS credential key management
  * [rails_panel](https://github.com/dejan/rails_panel) - Chrome extension for Rails development
  * [awesome_print](https://github.com/awesome-print/awesome_print) - Pretty print your Ruby objects with style -- in full color and with proper indentation
  * [shoryuken](https://github.com/phstc/shoryuken) - A super efficient AWS SQS thread based message processor for Ruby
  * [Better Errors](https://github.com/charliesome/better_errors) - Better Errors replaces the standard Rails error page with a much better and more useful error page. It is also usable outside of Rails in any Rack app as Rack middleware.
  * [Pry](http://pryrepl.org/) - An IRB alternative and runtime developer console
  * [MailCatcher](https://mailcatcher.me/) - MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface. Run mailcatcher, set your favourite app to deliver to smtp://127.0.0.1:1025 instead of your default SMTP server, then check out http://127.0.0.1:1080 to see the mail that's arrived so far.
  * [Sidekiq](http://sidekiq.org/) - Simple, efficient background processing for Ruby.

## Ruby Web Frameworks
  * [rails](http://rubyonrails.org/)

## PHP Web Frameworks
  * [symfony](http://symfony.es/)
  * [laravel](https://laravel.com/)

## Python Web Frameworks
  * [Django](https://www.djangoproject.com/)

## Ecommerce Frameworks
  * [Spree](https://github.com/spree/spree) - Spree is a complete open source ecommerce solution for Ruby on Rails
  * [Sylius](https://github.com/Sylius/Sylius) - eCommerce PHP framework built on top of Symfony with component-based architecture and format-agnostic rendering. (HTML/JSON/XML)

## React utilities
  * [react-devtools](https://github.com/facebook/react-devtools) - An extension that allows inspection of React component hierarchy in Chrome Developer Tools.

## JS libraries
  * [GMapz](https://github.com/carloscabo/gmapz) - GMapz is yet another Google Maps JS library. It eases the creation of Google Maps, it's responsive, supports the creation of multiple instances in the same page (each one with its own settings), the creation of custom styled infowindows, and other useful helpers.
  * [React](https://facebook.github.io/react/) - A Javascript library for building user interfaces.
  * [Polymer](https://www.polymer-project.org/) - Polymer is a JavaScript library that helps you create custom reusable HTML elements, and use them to build performant, maintainable apps.
  * [Jest](https://facebook.github.io/jest/) - An automated testing library for React.
  * [Apollo Client](http://dev.apollodata.com/) - The flexible, production ready GraphQL client for React and native apps.

## Front End Frameworks
  * [Angular](https://angular.io/)
  * [VueJs](https://vuejs.org/)

## Front End Tools
  * [Webpack](https://webpack.js.org/) - A module bunlder with dependencies.
  * [Yarn](https://yarnpkg.com/lang/en/) - A deterministic dependency manager.
  * [Figma](https://www.figma.com/) - The collaborative interface design tool (17/11/2017 Clara y Rossi reportan que no termina de importar bien algunas fuentes y documentos de Sketch).

## Infrastructure management utilities
  * [Route53 Gem](https://github.com/pcorliss/ruby_route_53) - Ruby gem and command line tool for Amazon's Route 53 service. http://blog.50projects.com
  * [AWS Command line tool](https://github.com/aws/aws-cli) - Universal Command Line Interface for Amazon Web Services
  * [S3cmd](https://github.com/s3tools/s3cmd) - Official s3cmd repo -- Command line tool for managing Amazon S3 and CloudFront services http://s3tools.org/s3cmd
  * [cap-ec2 (Capistrano v3)](https://github.com/forward3d/cap-ec2) - Capify-EC2 rewritten for Capistrano v3
  * [capify-ec2 (Capistrano v2)](https://github.com/forward/capify-ec2) - Capify-EC2 is used to generate Capistrano namespaces and tasks from Amazon EC2 instance tags, dynamically building the list of servers to be deployed to. https://rubygems.org/gems/capify-ec2

## ORM
  * [active-record](https://github.com/rails/rails/tree/master/activerecord) - Object-relational mapping in Rails
  * [doctrine](http://www.doctrine-project.org/) - The Doctrine Project is the home to several PHP libraries primarily focused on database storage and object mapping

## Shell Plugins
  * [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) - A delightful community-driven (with 1,000+ contributors) framework for managing your zsh configuration. Includes 200+ optional plugins (rails, git, OSX, hub, capistrano, brew, ant, php, python, etc), over 140 themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community.
    * [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Highlighing of commands whilst they are typed at a zsh prompt into an interactive terminal.
  * [fzf](https://github.com/junegunn/fzf) - fzf is a general-purpose command-line fuzzy finder.
  * [jq](https://github.com/stedolan/jq) - jq is a lightweight and flexible command-line JSON processor.
  * [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) - A code searching tool similar to ack, with a focus on speed.

## Editor Plugins
  * [ESLint](http://eslint.org/) - The pluggable linting utility for JavaScript and JSX
  * [Sass-Lint](https://www.npmjs.com/package/sass-lint) - A Node-only Sass linter for both sass and scss syntax!

## IDE & Text Editor
  * [sublime-text-3](https://www.sublimetext.com/3) - Sublime Text is a sophisticated text editor for code, markup and prose.
  * [vim](http://www.vim.org) - Vim is a highly configurable text editor built to make creating and changing any kind of text very efficient.
  * [Vs Code](https://code.visualstudio.com/) - Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud applications.

## Linux utilities
  * [shutter](http://shutter-project.org/) - Shutter is a feature-rich screenshot program for Linux based operating systems such as Ubuntu

## Development environments
  * [Docker basics](develop_with_docker.md) - Basical commands to use docker in development environments

## Other awesome lists
  * [Chatbots](https://github.com/BotCube/awesome-bots) - Awesome Bots
  * [Data Engineering](https://github.com/igorbarinov/awesome-data-engineering) - Awesome Data Engineering
