IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $IP

docker run --rm -it -e DISPLAY=$IP:0 -v "$PWD:/home/user" coral-python:2 \
 python3 /home/user/TFLite_detection_stream.py \
--modeldir /home/user \
--streamurl http://139.196.205.52:18080/home/low.flv \
--labels /home/user/coco_labels.txt