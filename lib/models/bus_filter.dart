class BusFilterOptions {
  bool acOnly;
  bool nonAcOnly;
  bool sleeperOnly;
  bool seaterOnly;
  double minPrice;
  double maxPrice;
  double minRating;

  BusFilterOptions({
    this.acOnly = false,
    this.nonAcOnly = false,
    this.sleeperOnly = false,
    this.seaterOnly = false,
    this.minPrice = 0,
    this.maxPrice = 3000,
    this.minRating = 0.0,
  });

  void reset() {
    acOnly = false;
    nonAcOnly = false;
    sleeperOnly = false;
    seaterOnly = false;
    minPrice = 0;
    maxPrice = 3000;
    minRating = 0.0;
  }
}
