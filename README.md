# Notebook


## Abstract :

A container image of jupyter notebook development environment with anaconda3, python2.7, some other runtimes and packages.

### Runtimes :

* python3
* python2
* octave
* c

### Packages :

* tensorflow
* pytorch
* pyod



## Quick start :

```shell
cd /path/to/your/directory/
docker run -d --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook
# Then open your browser with url `localhost:8888`.
```



## Usage :

1. GET IMAGE (Optional)

    * PULL (suggested)

      ```shell
      docker pull mooyxu/notebook
      ```

    * or BUILD

      ```shell
      docker build -t mooyxu/notebook .
      
      # Suggested in linux: docker build -t mooyxu/notebook -t mooyxu/notebook:`date -I` .
      ```

2. ALIAS (Suggested)

    * LINUX

      ```shell
      echo alias notebook=\''docker run -d --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'\' >> ~/.bashrc
      source ~/.bashrc
      ```

    * or MAC

      ```shell
      echo alias notebook=\''docker run -d --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'\' >> ~/.bash_profile
      source ~/.bash_profile
      ```

3. RUN

   * WITHOUT PASSWORD

     ```shell
     cd /path/to/your/directory/
     notebook
     
     # Depend on step 2, otherwise use command 'docker run -d --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook'.
     ```

   * or WITH PASSWORD

     ```shell
     docker run -it --rm mooyxu/notebook python -c 'from notebook.auth import passwd; print(passwd())'  # Input PASSWORD, copy OUTPUT, then paste it below
     cd /path/to/your/directory/
     notebook jupyter notebook --NotebookApp.password='<OUTPUT>'  # [LIKE] notebook jupyter notebook --NotebookApp.password='<OUTPUT>'
     
     # Depend on step 2, otherwise use command: docker run -d --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook jupyter notebook --NotebookApp.password='<OUTPUT>'.
     ```

4. USE

    Open your browser with url `localhost:8888` or `<ip>:8888`.

5. STOP

    ```shell
    docker stop notebook
    ```

6. REMOVE

    ```shell
    docker rmi mooyxu/notebook \
    | docker images | grep mooyxu/notebook | awk '{print $3}' \
    | xargs docker rmi \
    && sed -i '/mooyxu\/notebook/d' ~/.bashrc  # or MAC: '~/.bash_profile'
    ```



## ADVANCED :

1. DEBUG

    ```shell
    docker run -it --rm -p 8888:8888 --name notebook -v $PWD:/opt/notebooks mooyxu/notebook bash
    jupyter notebook
    ```

2. TEST tensorflow

    ```python
    import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([5000, 5000])))
    ```

3. TEST pytorch

    ```python
    from __future__ import print_function
    import torch
    x = torch.rand(5, 3)
    print(x)
    ```
