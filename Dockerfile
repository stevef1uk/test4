# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/stevef1uk/test4

# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN cd /go/src/github.com/stevef1uk/test4; GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o main  server/cmd/simple-server/main.go

# Final
FROM golang:alpine
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=0 /go/src/github.com/stevef1uk/test4/main /go/bin/main
# Run the outyet command by default when the container starts.
CMD ["/go/bin/main"]
# Document that the service listens on port 5000
EXPOSE 5000
