FROM ubuntu:noble AS system
RUN apt update -y && apt install wget tar build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev -y && wget -O python.tar.gz https://www.python.org/ftp/python/3.11.12/Python-3.11.12.tgz && tar -zxf python.tar.gz && cd Python-3.11.12 && ./configure --enable-optimizations && make -j8 && make install -j8 && apt remove -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev && apt autoremove -y
CMD ["python"]
