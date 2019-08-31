FROM python:3.6-alpine

COPY requirements.txt .

RUN apk --no-cache --update-cache add gcc gfortran pkgconfig python python-dev py-pip build-base wget freetype-dev libpng-dev openblas-dev



RUN pip install -r requirements.txt

RUN wget https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz

RUN tar -xzf basemap-1.1.0.tar.gz

RUN cd basemap-1.1.0/

RUN cd geos-3.3.3/

RUN export GEOS_DIR=/usr/local

RUN ./configure --prefix=$GEOS_DIR

RUN make; make install

ENTRYPOINT ["jupyter", "notebook"]
