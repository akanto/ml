
install_drivers() {
  cat > /etc/yum.repos.d/amzn-graphics.repo <<'EOF'
[amzn-graphics]
name=amzn-graphics-Base
mirrorlist=http://repo.$awsregion.$awsdomain/$releasever/graphics/mirror.list
mirrorlist_expire=300
metadata_expire=300
priority=9
failovermethod=priority
fastestmirror_enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-amazon-ga
enabled=1
retries=5
timeout=10
EOF
  yum -y install nvidia cuda
  #yum -y update 
}

update_path() {
  echo PATH=/opt/nvidia/cuda/bin:/bin:/usr/bin > /etc/environment
  echo CUDA_HOME=/opt/nvidia/cuda >> /etc/environment 
}

load_driver() {
  modprobe nvidia
  modprobe nvidia_uvm
  lsmod | grep nv
  nvidia-smi -q
  ldconfig /etc/ld.so.conf.d/cuda.conf
  ldconfig -p | grep cublas
}

main() {
    install_drivers
    update_path
    load_driver
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"