/etc/yum.repos.d/amzn-graphics.repo:
  file.managed:
    - source: salt://gpu/yum/amzn-graphics.repo

install_gpu_packages:
  pkg.installed:
    - pkgs:
      - nvidia
      - cuda

# salt -G 'hostgroup:worker' state.apply gpu