FROM alpine:3.20

ENV KUBE_LATEST_VERSION="v1.28.0"
ENV TARGETARCH="amd64"

RUN apk add --update --no-cache curl jq \
    && curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Replace for non-root version
ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
