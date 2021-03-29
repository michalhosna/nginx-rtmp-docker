ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

ARG NGINX_VERSION
ARG FFMPEG_VERSION

RUN apk add --no-cache \
    nginx=~${NGINX_VERSION} \
    nginx-mod-rtmp=~${NGINX_VERSION} \
    bash~=5.0 \
    ffmpeg=~${FFMPEG_VERSION} \
    ffmpeg-libs=~${FFMPEG_VERSION} \
 && rm /etc/nginx/nginx.conf

COPY stat.xsl /var/stat/stat.xsl
COPY conf.d /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
