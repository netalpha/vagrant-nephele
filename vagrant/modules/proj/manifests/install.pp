class proj::install {
  include proj::config

  # exec {"apt":
  #   command => 'apt-get update',
  # }

  # package { "wget":
  #   ensure  => "latest",
  #   require => Exec['apt'],
  # }

  class { 'java' :
    distribution => 'jdk',
  }

}
