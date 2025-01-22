# docker-yocto-orangepi5

### Machine name = rockchip-rk3588-evb

### Use this scripts to add layers 
```sh
bitbake-layers add-layer ../meta-openembedded/meta-oe && \
bitbake-layers add-layer ../meta-openembedded/meta-python && \
bitbake-layers add-layer ../meta-openembedded/meta-networking && \
bitbake-layers add-layer ../meta-openembedded/meta-multimedia && \
bitbake-layers add-layer ../meta-rockchip
```