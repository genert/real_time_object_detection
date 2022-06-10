# Real Time Object Detection with OpenCV, C++, and Yolo v5

## Install dependencies

### MacOS

> Tested out on M1 (ARM) only. Might work on Intel (amd64) as well.

```bash
brew tap denji/nginx
brew install opencv cmake ffmpeg@4
brew install nginx-full --with-rtmp-module
```

### Linux

```bash
git clone https://github.com/nadjieb/cpp-mjpeg-streamer.git
cd cpp-mjpeg-streamer
mkdir build && cd build
cmake ../
make
sudo make install
git clone https://github.com/Taywee/args
cd args
sudo make install
```

## Run the C++ program

```bash
sudo ufw allow 1935/tcp
sudo ufw allow 8088/tcp
sudo mkdir -p /var/www/html/stream


git clone https://github.com/genert/real_time_object_detection
cd real_time_object_detection
mkdir build
cd build
cmake ..
make
./receiver --device_id 0
open http://localhost:8080/stream.mjpg
```

Or using CUDA if available:
```bash
./receiver cuda


  
```

## Exporting Yolo v5 models to .onnx format

```bash
git clone https://github.com/ultralytics/yolov5
cd yolov5
pip install -r requirements.txt
python3 export.py --weights yolov5n.pt --img 640 --include onnx
```
