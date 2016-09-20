node master {
  include proj::master
}

#node /slave[1-3]/ {
#  include proj::slave
#}

node default {
  require proj::install
  include proj::config
}
