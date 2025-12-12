{ ... }:
{
  services.cliphist.enable = true;
  services.cliphist.extraOptions = [
    "-max-dedupe-search"
    "10"
    "-max-items"
    "500"
  ];
}
