# Use dotfiles to check out and install git repos.

# dotfiles:
#     repos:
#         - { user: glynn, repo: "https://github.com/glynnforrest/dotfiles.git", target: "/home/glynn/.dotfiles", run: "make" }

# Make sure target is an absolute path.
# It may be useful to template the home directory for multiple systems.

# {% if grains['os'] == 'MacOS' %}
# {% set home = '/Users/glynn' %}
# {% else %}
# {% set home = '/home/glynn' %}
# {% endif %}

# dotfiles:
#     repos:
#         - { user: glynn, repo: "https://github.com/glynnforrest/dotfiles.git", target: "{{home}}/.dotfiles", run: "make" }
