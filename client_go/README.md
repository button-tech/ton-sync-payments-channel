# Dev build

Dependencies - `gox`

```
go get github.com/mitchellh/gox
./dev_build.sh
docker run -ti -p port:port -v catalog_with_files:/app/data test
```

# Prod build

```
docker build -t username/image .
docker run -ti -p port:port -v catalog_with_files:/app/data username/image

```
