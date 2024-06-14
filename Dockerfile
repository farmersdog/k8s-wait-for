FROM alpine:3.20.0

ENV KUBE_LATEST_VERSION="v1.28.0"
ENV TARGETARCH="amd64"

RUN apk add --update --no-cache curl=7.83.1-r4 jq=1.6-r1 \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/$TARGETARCH/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Replace for non-root version
ADD wait_for.sh /usr/local/bin/wait_for.sh

ENTRYPOINT ["wait_for.sh"]
