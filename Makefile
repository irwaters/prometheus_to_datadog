all: clean deps build-linux

deps: 
	glide install

release: clean deps build-linux

build-linux:
	GOOS=linux GOARCH=amd64 go build -o bin/prom_to_datadog main.go

clean:
	rm -f bin/prom_to_datadog

docker: release
	docker build -t docker-registry.zende.sk/prometheus_datadog .
	docker push docker-registry.zende.sk/prometheus_datadog:latest

