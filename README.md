# Real Time Object Detection with OpenCV, C++, and Yolo v5

## Install dependencies

```bash
brew install opencv cmake ffmpeg
```

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
git clone https://github.com/genert/real_time_object_detection
cd real_time_object_detection
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
