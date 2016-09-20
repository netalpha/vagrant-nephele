class proj::slave {
  include proj::install

  # exec { 'run-slaves':
  #   command => 'nohup java -cp "*" uk.ac.imperial.lsds.proj.Main Worker &',
  # }
}
