FROM debian:testing

RUN apt-get update
RUN apt-get install -y git vim curl

CMD /bin/bash
