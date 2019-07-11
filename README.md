# Notebook


## Abstract :

A container image of jupyter notebook based on anaconda3 with python2.7 and some other runtimes in it.



## Usage :

1. GET IMAGE (Optional)

    ```shell
    # PULL (suggested)
    docker pull mooyxu/notebook
    
    # or BUILD
    docker build -t mooyxu/notebook .
    ```

2. ALIAS (Optional)

    ```shell
    # LINUX
    echo 'alias notebook=\'docker run -d -p 8888:8888 --rm --name notebook -v $PWD:/opt/notebooks mooyxu/notebook\'' >> ~/.bashrc
    source ~/.bashrc
    
    # or MAC
    echo 'alias notebook=\'docker run -d -p 8888:8888 --rm --name notebook -v $PWD:/opt/notebooks mooyxu/notebook\'' >> ~/.bash_profile
    source ~/.bash_profile
    ```

3. RUN
   ```shell
   cd /path/to/your/file/
   docker run -d -p 8888:8888 --rm --name notebook -v $PWD:/opt/notebooks mooyxu/notebook  # If you did the step 2, then you can execute just 'notebook' instead.
   ```

4. USE

    Open your browser with url `localhost:8888`.
    
5. STOP

    ```shell
    docker stop notebook
    ```

    

    
