FROM debian:testing

RUN apt-get update
RUN apt-get install -y git vim curl
# Dependencies for GHCUP
# RUN apt install -y build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 &&
# Headless GHC up install
# RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=latest BOOTSTRAP_HASKELL_CABAL_VERSION=latest BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh

CMD /bin/bash
