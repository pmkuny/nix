{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      mini = {
        hostname = "192.168.1.251";
        user = "root";
      };
    };
  };
}
