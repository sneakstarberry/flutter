class MarketItem {
  String img;
  String price;
  String itemTitle;
  String itemSubTitle;
  String market;
  String place;
  bool isBanner;

  MarketItem({
    this.itemTitle,
    this.itemSubTitle,
    this.market,
    this.place,
    this.img,
    this.price,
    this.isBanner,
  });
}

List<MarketItem> marketItems = [
  MarketItem(
      img: "",
      price: "14.99",
      isBanner: true,
      itemTitle: "Corona",
      itemSubTitle: "Light",
      market: "GRAPE HILL LIQUORS",
      place: "23 Bond Street, Brooklyn, NY"),
  MarketItem(
      img: "",
      price: "23.24",
      isBanner: false,
      itemTitle: "SenaCena",
      itemSubTitle: "Black",
      market: "STILL WATER LIQUORS",
      place: "15 Bond Street, lBrooklyn, NY"),
];
