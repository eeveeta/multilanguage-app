# Multilanguage-app
A Dockerized app with Python and R. It preprocesses the dataset with python and then uses R to calculate the mean of the salaries.


## Building a Docker Image

```
 git clone https://github.com/eeveeta/multilanguage-app
 cd multilanguage-app 
 docker image build -t eeveeta/multilang-app:1.0.0 . 
```


## Running the  container 

```
 docker run --rm --name multilang-app -d eeveeta/multilang-app:1.0.0 . 
```

