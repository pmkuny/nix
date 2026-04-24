{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      myHost = {
        hostname = "192.168.1.251";
        user = "root";
      };
    };
  };
}
