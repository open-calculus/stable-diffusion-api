FROM siutin/stable-diffusion-webui-docker:latest-cuda

RUN git clone https://github.com/Mikubill/sd-webui-controlnet /app/stable-diffusion-webui/extensions/sd-webui-controlnet
RUN bash webui.sh --exit --xformers --no-download-sd-model --skip-torch-cuda-test
CMD bash webui.sh
