PWD=`pwd`
GCP_AUTH := ${HOME}/.config/gcloud


build-gx:
	@echo "Building great expectations image"
	@docker build -f projects/great-expectations/Dockerfile projects/great-expectations \
	-t gx

run-gx:
	@echo "Running great expectations in container"
	@docker run \
		--rm \
		-v ${GCP_AUTH}:/creds -it \
		-v ${PWD}/projects/great-expectations/:/app \
		--entrypoint /bin/bash \
		-p 8083:8080 \
		gx
