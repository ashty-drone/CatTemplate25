FROM sandy1709/catuserbot:slim-buster

#clonning repo 
RUN git clone https://github.com/ashty-drone/nekopack.git /

COPY . .

# Install requirements
RUN python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install --no-cache-dir -r requirements.txt

CMD ["bash","start"]
