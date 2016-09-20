class proj::master {
  include proj::install

  # exec { "wget-lrb":
  #   command => "wget ${CAR_DATA} -O /vagrant_data/cardatapoints.txt",
  # }

  # exec { "run-master":
  #   command => 'nohup java -cp "*" uk.ac.imperial.lsds.proj.Main Master proj-lrb-0.0.1-SNAPSHOT.jar Base &',
  # }
}
