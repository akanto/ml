/etc/yum.repos.d/amzn-graphics.repo:
  file.managed:
    - source: salt://gpu/yum/amzn-graphics.repo

install_gpu_packages:
  pkg.installed:
    - pkgs:
      - nvidia
      - cuda

/etc/environment:
  file.managed:
    - source: salt://gpu/etc/environment

# salt -G 'hostgroup:master' state.apply gpu