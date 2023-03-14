# Nginx With Upload Module

- Base Image
    - andarius/nginx-upload
        - nginx-1.22.1-alpine
        - nginx-upload-module-2.3.0

## Docker Pull Command

`docker pull siriuszg/nginx-upload:TAG`

## Run

- start the nginx server
  ```sh
  docker run --rm \
    -p 8088:8088 \
    -v "$(pwd)/files:/nginx/share/" \
    --name nginx-upload nginx-upload
  ```
