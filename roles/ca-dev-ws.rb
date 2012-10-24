name "ca-dev-ws"
description "Development workstation for CA AppLogic"
run_list "recipe[vim]", "recipe[tmux]", "recipe[subversion]", "recipe[yum]", "recipe[ntp]", "recipe[timezone]","recipe[ca-wstation]"
