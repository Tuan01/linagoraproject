# ---- Python base ----
FROM python:3.7.6-slim-buster AS python-base

WORKDIR /src

# Install Chrome and chromedriver for Selenium
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    gnupg \
    wget \
    unzip \
  && wget -q https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_linux64.zip \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    google-chrome-stable \
  && unzip chromedriver_linux64.zip \
  && rm chromedriver_linux64.zip \
  && mv chromedriver /usr/local/bin \
  && chmod +x /usr/local/bin/chromedriver \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install -q -r /tmp/requirements.txt
ENTRYPOINT ["/usr/local/bin/robot", "--timestampoutputs", "-d", "Results"]
CMD ["--argumentfile", "staging.args", "Tests/Web/"]
