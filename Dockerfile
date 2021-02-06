FROM golang:alpine

# Set necessary environment variables needed for this image
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Move to working directory /build
WORKDIR /build

# Copy and download dependency using go mod 
COPY go.mod .
COPY go.sum .
RUN  go mod download

# Copy into the container
COPY . .

#Build the app
RUN go build -o main .

#Move to /dist directory as the place for resulting binary folder
WORKDIR /dist

# Copy binary from buld to main folder
RUN cp /build/main .

#Expose necessary port
EXPOSE 3000

# Command to run when sarting the container
CMD ["/dist/main"]