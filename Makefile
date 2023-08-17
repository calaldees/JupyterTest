
gitpod_build_docker:
	docker build --tag gitpod --file .gitpod.Dockerfile .
gitpod_run_docker:
	docker run --rm -it gitpod /bin/bash
