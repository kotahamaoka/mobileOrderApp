class Store {
  String name = '';
  String imageName = 'no-image.jpeg';
  bool isOpen = true;
  double distance = 0;
  String address = '';

  Store(
      {required this.name,
      required this.imageName,
      required this.isOpen,
      required this.distance,
      required this.address});
}
