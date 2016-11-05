all: build

build:
	docker build -t local/apache2:2.4 .

run:
	docker run -p 8080:80 -itd local/apache2:2.4
