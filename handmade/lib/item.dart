class Item {
  final String img;
  final String title;
  final int price;
  final bool freeDelivery;

  Item({this.img, this.title, this.price, this.freeDelivery});
}

List<Item> bestSellers = [
  Item(img:"https://cdn.pixabay.com/photo/2015/10/12/14/59/girl-984060__340.jpg", title: "Leaves Tiara", price: 49, freeDelivery: false),
  Item(img:"https://cdn.pixabay.com/photo/2014/05/03/00/56/summerfield-336672__340.jpg", title: "Cat Ears Headband", price: 34, freeDelivery: true),
  Item(img:"https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156__340.jpg", title: "Colibri Headpeace", price: 44, freeDelivery: false),
  Item(img:"https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533__340.jpg", title: "Bird Brooch", price: 999, freeDelivery: false),
  Item(img:"https://cdn.pixabay.com/photo/2017/08/01/08/29/people-2563491__340.jpg", title: "Leaves Tiara", price: 49, freeDelivery: true),
  Item(img:"https://cdn.pixabay.com/photo/2016/03/23/04/01/beautiful-1274056__340.jpg", title: "Cat Ears Headband", price: 34, freeDelivery: true),
  Item(img:"https://cdn.pixabay.com/photo/2018/03/12/12/32/woman-3219507__340.jpg", title: "Colibri Headpeace", price: 44, freeDelivery: false),
  Item(img:"https://cdn.pixabay.com/photo/2016/03/15/17/17/girl-1258739__340.jpg", title: "Bird Brooch", price: 999, freeDelivery: false),
];
