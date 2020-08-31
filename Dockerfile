FROM mongo:3.6

ARG BUILD_DATE
ARG VERSION
LABEL build_date="${BUILD_DATE}"
LABEL version="${VERSION}"

ENV MONGO_HOST mongo
ENV LEANOTE_COLLECTION leanote

RUN apt-get update \
    && apt-get install -y subversion \
    && svn export https://github.com/leanote/leanote/trunk/mongodb_backup/leanote_install_data/ /leanote_data

CMD mongorestore -h $MONGO_HOST -d $LEANOTE_COLLECTION --dir /leanote_data
