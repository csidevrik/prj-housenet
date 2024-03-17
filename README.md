# prj-housenet
la red de casa con docker para poder levantarla en donde sea que tenga docker

Hoy me ha pasado lo siguiente he querido crear un volumen y luego asociar el contenedor que va a correr asociado a este volumen de docker y que este asociado a un path especifico.

En mi caso voy a mencionar las dos opciones de las cuales luego usare solo la segunda opcion y solo por ahora la opcion 1

*  [Metodo 1](#methode1)
*  [Metodo 2](#methode2)

# methode1
## Creacion del directorio de volumenes
En este primer caso ya he generado un folder para contener los volumenes
```bash
    mkdir -p ~/volumes
```
el flag -p es en caso de que no exista pues lo crea
Ahora creamos el folder para la base de datos en nuestro cado mongodb
```bash
    mkdir -p ~/volumes/mongodb-0
```
## Creacion del volumen en docker asociado a este path
```bash
    docker volume create --driver local \
    --opt type=none \
    --opt device=~/volumes/mongodb-0 \
    --opt o=bind \
    volmongodb0
```
## Creacion del contenedor asociado a este volumen
```bash
docker run --name mongodbc0 -v /var/lib/docker/volumes/volmongodb0/_data:/data/db -d --restart always -p 27017:27017/tcp mongodb/mongodb-community-server:latest
```



# methode2
En este metodo no vamos a asociar ningun path especifico sino directamente confiamos el path /var/lib/docker/volumes/ que es donde normalmente se guardan los volumenes de docker
## Creacion del volumen en docker asociado a este path
```bash
    docker volume create volmongodb0
```
## Creacion del contenedor asociado a este volumen
```bash
docker run -d --name mongodbc0 -v volmongodb0:/data/db mongodb/ --restart always mongodb-community-server:latest
```

## nota: 
El parametro always es usado porque normalmente se tiene que reinciar los servidores y en ese momento lo conveniente es que el contenedor se reinicie automaticamente tambien.
