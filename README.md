# Notebook


## Abstract :

A container image of jupyter notebook based on anaconda3 with python2.7 and some other runtimes:

* python3
* python2
* octave
* c



## Quick start :

```shell
cd /path/to/your/direction/
docker run -d -p 8888:8888 --rm --name notebook -v $PWD:/opt/notebooks mooyxu/notebook
# Then open your browser with url `localhost:8888`.
```



## Usage :

1. GET IMAGE (Optional)

    ```shell
    # PULL (suggested)
    docker pull mooyxu/notebook
    
    # or BUILD
    docker build -t mooyxu/notebook .
    ```

2. ALIAS (Suggested)

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
   notebook  # Depend on step 2, otherwise use 'docker run ...' command.
   ```

4. USE

    Open your browser with url `localhost:8888`.
    
5. STOP

    ```shell
    docker stop notebook
    ```

    

    
