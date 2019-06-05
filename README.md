# notebook
A container image of jupyter notebook based on anaconda3 with python2.7 in it.


## Usage:
1. BUILD (optional)

    ```shell
    docker build -t mooyxu/notebook .
    ```

2. RUN

    ```shell
    docker run -d -p 8888:8888 --rm --name notebook -v $PWD/data:/opt/notebooks mooyxu/notebook
    ```

3. OPEN

    `localhost:8888`
