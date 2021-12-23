FROM golang:17 AS builder
WORKDIR /app

# https://tailscale.com/kb/1118/custom-derp-servers/
RUN go install tailscale.com/cmd/derper@main

FROM gcr.io/distroless/base-debian11
WORKDIR /app

RUN mkdir /app/cert

ENV DERP_DOMAIN your-hostname.com
ENV DERP_CERT_MODE letsencrypt
ENV DERP_CERT_DIR /app/certs
ENV DERP_ADDR :443
ENV DERP_STUN true

COPY --from=builder /go/bin/derper .

CMD /app/derper --hostname $DERP_DOMAIN --certmode $DERP_CERT_MODE --certdir $DERP_CERT_DIR --a $DERP_ADDR --stun $DERP_STUN
