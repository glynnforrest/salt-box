# use this file to define the different states for your machines.
# https://docs.saltstack.com/en/latest/topics/tutorials/states_pt1.html#preparing-the-top-file
base:
  'work-laptop':
    - mac
    - dev
    - emacs
    - browsers
    - vagrant
  'home-pc':
    - dev
    - emacs
    - browsers
