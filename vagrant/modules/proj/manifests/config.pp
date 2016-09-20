class proj::config {
  include proj::params

  Exec {
    path => ["/usr/bin", "usr/local/bin", "/bin"],
  }
}
