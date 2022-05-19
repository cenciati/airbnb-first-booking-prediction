run:
	docker build -t jupyter-airbnb .
	docker container run -it --rm \
	--name jupyter-airbnb \
	-v ${PWD}:/home/jovyan/airbnb-first-booking-prediction \
	-p 8888:8888 \
	-p 4040:4040 \
	jupyter-airbnb
