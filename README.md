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
cp -r my-resources/. ~/.exegol/my-resources/
```

### Create a new container

```
exegol start default -fs -cwd -l --hostname my-host
```

### Setup Tilix profile

Create Tilix Profile

```
sudo dconf load /com/gexperts/Tilix/ < my-terminal/tilix.dconf
```

Add shortcut

```
cp my-terminal/exegol.desktop ~/.local/share/applications/
```