FROM hexletbasics/base-image:latest

RUN apt-get update

RUN curl https://dlang.org/install.sh | bash -s

RUN apt-get install dub -y

WORKDIR /exercises-dlang

COPY . .

ENV PATH=~/.local/bin/:/exercises-dlang/bin:$PATH
ENV PATH=~/.local/bin/:/root/dlang/dmd-2.101.2/linux/bin64:$PATH
