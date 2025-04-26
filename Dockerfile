# Dockerfile

FROM ubuntu:22.04

# Instala dependências
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev && \
    apt-get clean

# Clona o XMRig
RUN git clone https://github.com/xmrig/xmrig.git /xmrig

# Compila o XMRig
WORKDIR /xmrig
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

# Define a pool padrão, substitua depois ao rodar
CMD ["./build/xmrig", "-o", "shortline.proxy.rlwy.net:16568", "-u", "4BDdmZ32JsY9uJNwC4fiir6fG9GqjcvXmHoeEPwQ84TC5sfbx54333a3URetYfvFmCfYVoYGwNpCAiSPD1ZKvhyjSkLPEsQ"]