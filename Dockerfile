FROM mono

RUN useradd -ms /bin/bash builder
WORKDIR /home/builder

RUN apt-get update && apt-get install -y libunwind8 libcurl3 libicu52 && apt-get install wget

RUN mkdir buildAgent && cd buildAgent
RUN wget https://github.com/Microsoft/vsts-agent/releases/download/v2.107.0/vsts-agent-ubuntu.14.04-x64-2.107.0.tar.gz
RUN tar xzf vsts-agent-ubuntu.14.04-x64-2.107.0.tar.gz

USER builder
CMD ./config.sh && ./run.sh
