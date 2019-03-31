# ProgramadoroTracker

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

ProgramadoroTracker is a project that will to help you to keep your focus with mind-refreshing breaks. 
Utilizing technique of Pomodoro divided in categories tasks to do and done.
What do you need to do?

## Index

- [Requirements](#requirements)
- [First steps](#first-steps)
- [Authors](#authors)
- [Tests](#tests)
- [License](#license)

### Requirements

You must have installed on your machine:

- Docker
- Docker Compose

## First steps


Follow the instructions to have a project present and able to run it locally.

After copying the repository to your machine, go to the project's root site and:


1.  Construct the container

```
docker-compose build
```

2.  Create of Database

```
docker-compose run --rm website bundle exec rails db:create
```

3.  up the project

```
docker-compose up
```

4. Without turning off the server, open a new window and run the migrations

```
docker-compose run --rm website bundle exec rails db:migrate if necessary populate database

```

## Tests

For to do the tests it is necessary in docker container running:

Test using Rspec:

Model
category

docker-compose run --rm app bundle exec rspec spec/models/category_spec.rb

configuration_task

docker-compose run --rm app bundle exec rspec spec/models/configuration_task_spec.rb

task

docker-compose run --rm app bundle exec rspec spec/models/task_spec.rb

user

docker-compose run --rm app bundle exec rspec spec/models/user_spec.rb

Controller

categories

docker-compose run --rm app bundle exec rspec spec/controllers/categories_controller.spec.rb

configurationTask

docker-compose run --rm app bundle exec rspec spec/controllers/configuration_task_controller.spec.rb

tasks

docker-compose run --rm app bundle exec rspec spec/controllers/tasks_controller.spec.rb

pages

docker-compose run --rm app bundle exec rspec spec/controllers/pages_controller.spec.rb


## Authors

Project created by the following developers

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars1.githubusercontent.com/u/1753070?s=460&v=4" width="100px;"/><br /><sub><b>Thiago Cardoso</b></sub>](https://github.com/Thiago-Cardoso)<br /> | [<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br /> | [<img src="https://avatars0.githubusercontent.com/u/5173633?s=460&v=4" width="100px;"/><br /><sub><b>Jorge Toledo</b></sub>](https://github.com/jorgemtoledo)<br /> | [<img src="https://avatars3.githubusercontent.com/u/753592?s=460&v=4" width="100px;"/><br /><sub><b>Vanildo Prates</b></sub>](https://github.com/vprates)<br /> | [<img src="https://avatars0.githubusercontent.com/u/25970313?s=460&v=4" width="100px;"/><br /><sub><b>Guilherme Arôxa</b></sub>](https://github.com/GuilhermeAroxa)<br /> |
| :---: | :---: | :---: | :---: | :---: |

## Licença

This project is licensed under a Apache license 2.0 - see file [LICENSE](LICENSE) for more details
