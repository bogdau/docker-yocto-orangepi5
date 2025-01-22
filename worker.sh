#! /bin/bash

case $1 in
  build)
   echo -e "\e[0;32m building is started \e[0;0m"
    podman build -t yocto-orange-pi-5  .
   ;;
  run|start)
   echo -e "\e[0;32m The Container is started \e[0;0m"
    podman run -it --name orange-pi-5-container yocto-orange-pi-5
   ;;
  bridge)
    podman run -it --name orange-pi-5-container -v $(pwd):/home/developer/yocto yocto-orange-pi-5
   ;;
  clean)
    podman stop orange-pi-5-container
    podman rm orange-pi-5-container
    echo -e "\e[0;32m The Container(s) cleaned \e[0;0m"
  ;;
  rm)
    podman rmi yocto-orange-pi-5
    echo -e "\e[0;32m The Container(s) removed \e[0;0m"
   ;;
   *)
   ;;
esac