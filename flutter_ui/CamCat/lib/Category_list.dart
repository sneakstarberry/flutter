class Category {
  final String title;
  final String subTitle;
  final String subDesc;
  final String imgPath;

  Category({this.title, this.subTitle, this.subDesc, this.imgPath});
}

List<Category> categoryItems = [
  Category(
      title: "셀럽들의 일상",
      subTitle: "최고 인기 냥이들만 모았다!",
      subDesc: "최고 인기 냥이는 나야나 나야나",
      imgPath:
          "https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662__340.jpg"),
  Category(
      title: "냥이 대백과",
      subTitle: "고양이가 먹으면 안되는 음식",
      subDesc: "귀엽다고 아무거나 주면 안돼요!",
      imgPath:
          "https://cdn.pixabay.com/photo/2016/01/19/17/41/friends-1149841__340.jpg"),
  Category(
      title: "냥이 대백과",
      subTitle: "고양이의 꼬리 언어",
      subDesc: "꼬리로 알아보는 고양이의 언어들",
      imgPath:
          "https://cdn.pixabay.com/photo/2017/11/09/21/41/cat-2934720__340.jpg"),
];
