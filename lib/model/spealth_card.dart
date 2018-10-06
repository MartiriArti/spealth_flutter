class SpealthCard {
  final int id;
  final String category;
  final String avatarImage;
  final bool isCheck;

  const SpealthCard({this.id, this.category, this.avatarImage, this.isCheck});
}

List<SpealthCard> itemsOfList = [
  const SpealthCard(
    id: 0,
    category: "health",
    avatarImage:  "assets/icons/settings.png",
    isCheck: false,
  ),
  const SpealthCard(
    id: 1,
    category: "sport",
    avatarImage:  "assets/icons/settings.png",
    isCheck: false,
  ),
  const SpealthCard(
    id: 2,
    category: "friends",
    avatarImage:  "assets/icons/settings.png",
    isCheck: false,
  ),
  const SpealthCard(
    id: 3,
    category: "news",
    avatarImage:  "assets/icons/settings.png",
    isCheck: false,
  ),
  const SpealthCard(
    id: 4,
    category: "settings",
    avatarImage:  "assets/icons/settings.png",
    isCheck: false,
  )
];
