/etc/yum.repos.d/amzn-graphics.repo:
  file.managed:
    - source: salt://gpu/yum/amzn-graphics.repo

install_gpu_packages:
  pkg.installed:
    - pkgs:
      - nvidia
      - cudatoolkit

# salt 'hostgroup:worker' state.apply gpu