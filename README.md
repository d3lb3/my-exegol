# my-exegol

### Clone with Exegol-images submodule

```
git clone --recurse-submodules https://github.com/d3lb3/my-exegol && cd my-exegol
```

### Add my custom image to Exegol

```
cp -r my-sources/. Exegol-images/sources
cp -r my-dockerfiles/. Exegol-images
exegol install --build-path $PWD/Exegol-images custom custom
```

###  Add my custom resources to Exegol

```
sudo cp -r my-resources/. ~/.exegol/my-resources/
```

### Create a new container

```
exegol start my-exegol --hostname jbedel-ocd -cwd -fs -l
```

