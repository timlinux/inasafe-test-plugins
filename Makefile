SHELL := /bin/bash

default: web

run: build web

rm:
	@echo
	@echo "--------------------------"
	@echo "Killing production instance!!! "
	@echo "--------------------------"
	@fig  -p jakarta-test-repository kill
	@fig  -p jakarta-test-repository rm

web:
	@echo
	@echo "--------------------------"
	@echo "Running in production mode"
	@echo "--------------------------"
	@fig  -p jakarta-test-repository up -d web
	@dipall

build:
	@echo
	@echo "--------------------------"
	@echo "Building in production mode"
	@echo "--------------------------"
	@fig  -p jakarta-test-repository build

kill:
	@echo
	@echo "--------------------------"
	@echo "Killing in production mode"
	@echo "--------------------------"
	@fig -p jakarta-test-repository kill

btsynclogs:
	@echo
	@echo "--------------------------"
	@echo "Showing uwsgi logs in production mode"
	@echo "--------------------------"
	@fig -p jakarta-test-repository logs btsync

nginxlogs:
	@echo
	@echo "--------------------------"
	@echo "Showing nginx logs in production mode"
	@echo "--------------------------"
	@fig -p jakarta-test-repository logs web

shell:
	@echo
	@echo "--------------------------"
	@echo "Shelling in in production mode"
	@echo "--------------------------"
	@fig -p jakarta-test-repository run cron /bin/bash
