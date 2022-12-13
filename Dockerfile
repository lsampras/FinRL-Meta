FROM python:3.8.16

RUN apt-get update && apt-get install -q -y wget

RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install

RUN pip install git+https://github.com/AI4Finance-LLC/ElegantRL.git
RUN pip install git+https://github.com/AI4Finance-LLC/FinRL-Library.git
RUN pip install yfinance stockstats
RUN pip install alpaca_trade_api
RUN pip install ray[default]
RUN pip install lz4
RUN pip install ray[tune]
RUN pip install tensorboardX
RUN pip install gputil
RUN pip install trading_calendars
RUN pip install wrds
RUN pip install rqdatac
RUN pip install sqlalchemy==1.2.19
RUN pip install tushare
RUN pip install TA-Lib
RUN pip install baostock
RUN pip install quandl
RUN pip install tensorboard
RUN pip install dm-tree
RUN pip install opencv-python
RUN apt-get install ffmpeg libsm6 libxext6  -y


RUN pip install jupyterlab

WORKDIR /src

COPY . .

RUN pip install --upgrade jupyter_http_over_ws>=0.0.7 && jupyter serverextension enable --py jupyter_http_over_ws

CMD ["jupyter", "notebook", "--NotebookApp.allow_origin='https://colab.research.google.com'", "--port=8888", "--NotebookApp.port_retries=0", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
