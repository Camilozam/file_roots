# Install packages
core_camilo:
  pkg.installed:
    - pkgs: [git, vim, tmux, sudo]


# Create user
camilo:
  user.present:
    - fullname: Camilo Zambrano
    - shell: /bin/bash
    - home: /home/camilo

/home/camilo/.ssh:
  file.directory:
    - user: camilo
    - group: camilo
    - mode: 755
    - require:
      - user: camilo

/home/camilo/.ssh/authorized_keys:
  file.managed:
    - user: camilo
    - group: camilo
    - mode: 644
    - contents:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoRLgyoJMlMYwGDPxwfLS+8wptYkxpQmEvQqWeuwzd69kxZ7wB1biqD5Rzn9GN+87glpn+0nNwh6Ygr24UuzuSr8HqB4ZPNlnPV0SOCpu5IVgCXHcQjyooO1P688+Vg6sjVlzaNMR5dv9yDZ00WsPsvCVhCYA7uwijje7ILffiOj+KKqpx03II5+iP0eUGPfd28Cx7hGlCJclvYoiV7sbu7wt6UrbK1VJu/Bcjw9HTbMpX9BlFPACALskf+CTfYVU3uzMNM39Q/qvLi2Om44shVmeyNhxQ5uNuRWJAV+p8DQmv/vtuuaLhmtLKxD06MA/r4x9oAvgjlW2zpANPZQAT"
    - require:
      - user: camilo


# Deploy sudo rule
/etc/sudoers.d/camilo:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - contents:
      - "camilo ALL=(ALL) NOPASSWD:ALL"
    - require:
      - user: camilo

# Add some foo
/home/camilo/test.foo:
  file.managed:
    - user: camilo
    - goup: root
    - mode: 744
    - contents:
      - "This is a test"
    - require:
      - user: camilo