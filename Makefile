PWD=`pwd`
GCP_AUTH := ${HOME}/.config/gcloud


build-gx:
	@echo "Building great expectations image"
	@docker build -t gx .

run-gx:
	@echo "Running great expectations in container"
	@docker run \
		--rm \
		-v ${GCP_AUTH}:/creds -it \
		-v ${PWD}:/app \
		--entrypoint /bin/bash \
		-p 8083:8080 \
		gx
