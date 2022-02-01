FROM sandy1709/catuserbot:slim-buster

# Installing some packages not available in the image
RUN apt-get update && apt-get install -y iputils-ping

# Cloning-Repo
RUN git clone https://github.com/ashty-drone/nekopack.git /root/userbot

#Setting up Working Directory
WORKDIR /root/userbot

# Installing requirements
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install -r requirements.txt

# Configuring Environment
ENV PATH="/home/userbot/bin:$PATH"

# Catuserbot!
CMD ["bash","start"]
