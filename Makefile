-include /opt/basics/common/common.mk

compose-setup: compose-build

compose:
	docker-compose up

compose-bash:
	docker-compose run exercises bash

compose-build:
	docker-compose build

compose-test:
	docker-compose run exercises make test

compile:
	@(for i in $$(find . -type f -name main.d); do cd $$(dirname $$i) && dmd *.d ; done)

compose-compile:
	docker-compose run exercises make compile

clear:
	@(for i in $$(find . -type f -name main.o); do cd $$(dirname $$i) && rm *.o ; done)
	@(for i in $$(find . -type f -name test_runner.out); do cd $$(dirname $$i) && rm *.out ; done)

compose-clear:
	docker-compose run exercises make clear

compose-code-lint:
	docker-compose run exercises make code-lint

code-lint:
	# TODO: add linter
	echo "code-lint"

compose-description-lint:
	docker-compose run exercises make description-lint

compose-schema-validate:
	docker-compose run exercises make schema-validate

ci-check:
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit

find-todo:
	git grep TODO
