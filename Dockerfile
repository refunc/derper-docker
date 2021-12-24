FROM golang:1.17 AS builder
WORKDIR /app
RUN mkdir /app/cert

# https://tailscale.com/kb/1118/custom-derp-servers/
RUN go install tailscale.com/cmd/derper@main

FROM gcr.io/distroless/base-debian11
WORKDIR /app

# https://github.com/GoogleContainerTools/distroless/issues/419
COPY --from=builder --chown=nonroot:nonroot /app /app

COPY --from=builder /go/bin/derper .

# https://github.com/GoogleContainerTools/distroless#entrypoints
ENTRYPOINT ["/app/derper"]
