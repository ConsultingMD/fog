def test
  connection = Fog::Compute.new({ :provider => "Google" })

  server = connection.servers.bootstrap
  server.wait_for { sshable? }

  raise "Could not bootstrap sshable server." unless server.ssh("whoami")
  raise "Cloud note delete server." unless server.destroy
end
