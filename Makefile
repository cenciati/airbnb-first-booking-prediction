install:
	pip install --upgrade pip
	pip install -r requirements.txt

run:
	docker build -t jupyter-airbnb:latest .
	docker container run \
	-dit \
	--rm \
	--name notebook-airbnb \
	jupyter-airbnb
