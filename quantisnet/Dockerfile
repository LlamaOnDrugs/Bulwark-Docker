FROM ubuntu:18.04
LABEL maintainer="Llama <llamaquan@gmail.com>"
LABEL version="2.3.2.2"
LABEL name="QuantisNet"

ENV QUANTISNET_VERSION 2.3.2.2
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

ADD https://github.com/QuantisDev/QuantisNet-Core/releases/download/v2.1.3.2/quantisnetcore-2.1.3.2-x86_64-linux-gnu.tar.gz /
ADD https://raw.githubusercontent.com/LlamaOnDrugs/Bulwark-Docker/master/quantisnet/scripts/entrypoint.sh /usr/local/bin/

RUN apt-get update \
  && apt-get install --no-install-recommends -y nano \
  && apt-get clean \
  && apt-get install apt-utils libc6 unzip -y \
  && rm -rf /var/lib/apt/lists/* \
  && tar xzf quantisnetcore-2.1.3.2-x86_64-linux-gnu.tar.gz \
  && mv quantisnetcore-2.1.3/bin/quantisnetd /usr/local/bin \
  && mv quantisnetcore-2.1.3/bin/quantisnet-cli /usr/local/bin \
  && rm -r quantisnetcore-2.1.3/bin quantisnetcore-2.1.3/include quantisnetcore-2.1.3/lib quantisnetcore-2.1.3/share \
  && rm quantisnetcore-2.1.3.2-x86_64-linux-gnu.tar.gz \
  && adduser quantisnet --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password > /dev/null \
  && mkdir /home/quantisnet/.quantisnetcore && chown -R quantisnet:quantisnet /home/quantisnet/.quantisnetcore \
  && chmod a+x /usr/local/bin/entrypoint.sh \
  && chown quantisnet:quantisnet /usr/local/bin/entrypoint.sh

USER quantisnet
VOLUME [ "/home/quantisnet/.quantisnetcore" ]
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
EXPOSE 9801