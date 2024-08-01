TIMESTAMP := $(shell date +'%F %T')

package:
	(cd ../hackaton-gateway; mvn clean && mvn spring-boot:build-image)
	(cd ../hackaton-discovery-service; mvn clean && mvn spring-boot:build-image)
	(cd ../hackaton-usuarios-app; mvn clean && mvn spring-boot:build-image -DskipTests)
	(cd ../hackaton-pagamentos-app; mvn clean && mvn spring-boot:build-image -DskipTests)

compose:
	docker-compose build

up:
	docker-compose up

daemon:
	docker-compose up -d

down:
	docker-compose down

status:
	docker ps -a

cleanup:
	docker rm $$(docker images | grep "^hackaton" | awk "{print $$3}")

cleanup-images:
	docker rmi $$(docker images | grep "^hackaton" | awk "{print $$3}")
