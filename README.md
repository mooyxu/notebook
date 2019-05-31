# notebook3
Container image with jupyter notebook in anaconda3.


## Usage:
1. BUILD

    ```shell
    docker build -t mooyxu/notebook3 .
    ```

2. RUN

    ```shell
    docker run -d -p 8888:8888 --rm --name notebook3 -v $PWD/data:/opt/notebooks mooyxu/notebook3
    ```

3. OPEN

    `localhost:8888`
