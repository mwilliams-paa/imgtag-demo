# imgtag-demo
A simple demonstration of using multiple-tags for container promotion/management

## Building
To build the image, just execute `./run.sh`

If you are not me, you will likely want to change the value of `IMAGE_BUILD_REPO`

## Pulling
You can view the image tags [on Quay.io](https://quay.io/repository/mwpaa/tagdemo?tab=tags)

You can pull them with
```
docker pull quay.io/mwpaa/tagdemo:$BUILD_NUMBER
```
or
```
docker pull quay.io/mwpaa/tagdemo:prod
```
