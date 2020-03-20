# Notebook


## Abstract :

A container image of jupyter notebook development environment with anaconda3, python2.7, some other runtimes and packages.

### Runtimes :

* python3
* python2
* ~~octave~~
* ~~c~~

### Packages :

* tensorflow
* pytorch
* pyod
* pyspark



## Quick start :

```shell
cd /path/to/your/directory/
docker run -d --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook
# Then Open your browser with url `localhost:8888` / `<ip>:8888` for notebook
#                          or url `localhost:8889` / `<ip>:8889` for lab.
```



## Usage :

1. GET IMAGE (Optional, but suggested)

    ```shell
    docker pull mooyxu/notebook
    ```

2. ALIAS (Optional, but suggested)

    * LINUX

      ```shell
      echo alias notebook=\''docker run -d --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'\' >> ~/.bashrc
      source ~/.bashrc
      ```

    * or MAC

      ```shell
      echo alias notebook=\''docker run -d --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'\' >> ~/.bash_profile
      source ~/.bash_profile
      ```

3. RUN

   * WITHOUT PASSWORD

     ```shell
     cd /path/to/your/directory/
     notebook
     
     # Depend on step 2, otherwise use command 'docker run -d --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'.
     ```

   * or WITH PASSWORD

     ```shell
     docker run -it --rm mooyxu/notebook python -c 'from notebook.auth import passwd; print(passwd())'  # Input PASSWORD, copy OUTPUT, then paste it below
     cd /path/to/your/directory/
     notebook /bin/bash /opt/run.sh '<OUTPUT>'  # [EXAMPLE] notebook /bin/bash /opt/run.sh 'a1b2c3'
     
     # Depend on step 2, otherwise use command: docker run -d --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook /bin/bash /opt/run.sh '<OUTPUT>'.
     ```

4. USE

    Open your browser with url `localhost:8888` / `<ip>:8888` for notebook
    
    or url `localhost:8889` / `<ip>:8889` for lab.

5. STOP

    ```shell
    docker stop notebook
    ```

6. REMOVE

    ```shell
    docker rmi mooyxu/notebook \
    | docker images | grep mooyxu/notebook | awk '{print $3}' \
    | xargs docker rmi \
    && sed -i '/mooyxu\/notebook/d' ~/.bashrc  # or MAC: instead of '~/.bash_profile'
    ```



## ADVANCED :

1. BUILD

    ```shell
    docker build -t mooyxu/notebook .

    # Suggested in linux: docker build -t mooyxu/notebook -t mooyxu/notebook:`date -I` .
    ```

2. DEBUG

    ```shell
    docker run -it --rm -p 8888:8888 -p 8889:8889 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook bash
    jupyter notebook

    # Then you will get one or two images: mooyxu/notebook:latest and mooyxu/notebook:<date_of_today>
    ```

3. TEST tensorflow

    ```python
    import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([5000, 5000])))
    ```

4. TEST pytorch

    ```python
    from __future__ import print_function
    import torch
    x = torch.rand(5, 3)
    print(x)
    ```

5. QUICK commands

    ```shell
    alias pip='docker exec -it notebook pip'
    alias ipython='docker exec -it notebook ipython'
    alias pyspark='docker exec -it notebook pyspark'
    alias java='docker exec -it notebook java'
    # alias octave='docker exec -it notebook octave'
    ```



## Contact :
Email: xumengyu2008@qq.com
