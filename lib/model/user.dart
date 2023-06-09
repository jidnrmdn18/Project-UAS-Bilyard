class User {
  String? id;
  String? name;
  String? image;
  double? rating;
  int? offer;

  User({this.id, this.image, this.name, this.offer, this.rating});
}

final listUser = [
  User(
    id: 'user1',
    image: 'asset/user1.png',
    name: 'Farid',
    offer: 212,
    rating: 5,
  ),
  User(
    id: 'user2',
    image: 'asset/user2.png',
    name: 'Daib',
    offer: 135,
    rating: 4.7,
  ),
  User(
    id: 'user3',
    image: 'asset/user3.png',
    name: 'Saiwan',
    offer: 82,
    rating: 4.3,
  ),
];
