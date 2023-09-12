FROM debian:testing-slim

RUN apt-get update
RUN apt-get install -y git vim curl sudo procps net-tools jq nodejs


##############
# Set up user
##############
ARG USERNAME=code
ARG USER_HOME=/home/$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
WORKDIR /home/$USERNAME


#######################
# Install other tools
#######################
# SCM Breeze
RUN git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
RUN ~/.scm_breeze/install.sh


#######################
# VIM Config
#######################
COPY .vimrc $USER_HOME/.vimrc
RUN sudo chown $USERNAME:$USERNAME .vimrc
# Install Vim plugins
RUN vim +PlugInstall +qall

# Command to run when container starts, overrideable
CMD /bin/bash
