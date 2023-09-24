FROM nvcr.io/nvidia/pytorch:23.04-py3  
# pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
# Copy the requirements file and install dependencies
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Copy the project files
COPY . /app
WORKDIR /app

# Specify the volume
VOLUME /app

ENTRYPOINT ["python"]
CMD ["gan_in_pytorch_with_fid.py"]

# docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=536870912 -it pytorch-project
# docker build -t pytorch-project .
# notepad "$env:USERPROFILE/.wslconfig"