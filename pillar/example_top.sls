# use this file to declare pillar data for each of your machines.
# each item refers to a pillar file you create.
# https://docs.saltstack.com/en/latest/topics/tutorials/pillar.html
base:
  '*':
    - common
  'work-laptop':
    - work
  'home-pc':
    - home
