
docker run -it -v $OPENLANE_ROOT:/openlane -v $PDK_ROOT:$PDK_ROOT -v $PWD/..:/project -e PDK_ROOT=$PDK_ROOT -u $(id -u):$(id -g) efabless/openlane:2021.11.20_01.52.16 bash -c "cd /project/openlane ;flow.tcl -design mgmt_core  -tag mgmt_core -overwrite -save -save_path ../"

docker run -it -v $OPENLANE_ROOT:/openlane -v $PDK_ROOT:$PDK_ROOT -v $PWD/..:/project -e PDK_ROOT=$PDK_ROOT -u $(id -u):$(id -g) efabless/openlane:2021.11.20_01.52.16 bash -c "cd /project/openlane ;flow.tcl -design mgmt_core  -tag mgmt_core -overwrite -save -save_path ../"
