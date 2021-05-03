base:
  '*':
    - salt_minion
    - network
    - sshd
    - user_chrissi
    - user_camilo

  'salt':
    - salt_master

#  'oa[12]':
#    - match: pcre
#    - openattic

  'vmaster[12]':
    - match: pcre
    - drbd
    - opennebula_frontend
    - opennebula_node

  'vhost[1-9]':
    - match: pcre
    - opennebula_node

  'davical':
    - davical

  'zeiterfassung':
    - match: pcre
    - timas

  'gitlab':
    - match: pcre
    - gitlab