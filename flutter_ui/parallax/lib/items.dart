class IntroItem{
  final String title;
  final String category;
  final String imageUrl;

  IntroItem({this.title, this.category, this.imageUrl});
}

final sampleItems = <IntroItem>[
  new IntroItem(title: "Blueberry", category: "FRUITS", imageUrl: "https://image.shutterstock.com/image-illustration/3d-image-castle-on-mountain-260nw-1191650527.jpg"),
  new IntroItem(title: "Ice-cream", category: "DESSERT", imageUrl: "https://cdn.pixabay.com/photo/2020/02/04/11/33/ice-4817931__340.jpg"),
  new IntroItem(title: "Pasta", category: "FOOD", imageUrl: "https://cdn.pixabay.com/photo/2018/02/23/11/41/castle-3175321__340.jpg"),
];