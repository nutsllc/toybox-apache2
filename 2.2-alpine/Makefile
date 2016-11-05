all: build

build:
	docker build -t local/apache2:2.2-alpine .

run:
	docker run -p 8080:80 -e TOYBOX_UID=1234 -e TOYBOX_GID=9876 -itd local/apache2:2.2-alpine
