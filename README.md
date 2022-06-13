# Real Time Object Detection with OpenCV, C++, and Yolo v5

## Install dependencies

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

### MacOS specific

> Tested out on M1 (ARM) only. Might work on Intel (amd64) as well.

```bash
brew install opencv cmake ffmpeg@4
```

### Linux specific

Install OpenCV by following the GoCV guide - https://gocv.io/getting-started/linux/


## Run the C++ program

```bash
git clone https://github.com/genert/real_time_object_detection
cd real_time_object_detection
mkdir build
cd build
cmake ..
make
./receiver --device_id 0 --d --port 35675
open http://localhost:35675
```

Use UDP source instead of device for video capture:

```bash
./receiver --device_address "udp://0.0.0.0:35001" --d --port 35675
```

Use CUDA for detection:
```bash
./receiver --device_id 0 --d --port 35675 --cuda
  
```

## Exporting Yolo v5 models to .onnx format

```bash
git clone https://github.com/ultralytics/yolov5
cd yolov5
pip install -r requirements.txt
python3 export.py --weights yolov5n.pt --img 640 --include onnx
```
