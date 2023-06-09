import 'package:fluter_biliard_uas/model/user.dart';

class Biliard {
  String? id;
  String? title;
  String? image;
  String? location;
  String? description;
  double? rating;
  int? price;
  String? type;
  int? users;
  List<String>? facilities;
  User? owner;

  Biliard({
    this.description,
    this.facilities,
    this.id,
    this.image,
    this.location,
    this.owner,
    this.price,
    this.rating,
    this.title,
    this.type,
    this.users,
  });
}

final listBiliardTop = [
  Biliard(
    description:
        "Markas biliard adalah tempat bermain biliard yang cukup terkenal di samarinda. Berlokasi di jalan Ir.H Juanda yang merupakan daerah strategis. ",
    facilities: ['16 Meja biliard', '2 Toilet', '1 Cafe', 'Parkiran Motor & Mobil'],
    id: 'biliard1',
    image: 'asset/biliard1.jfif',
    location: 'Jl. Ir H Juanda, Air Hitam, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur',
    owner: listUser[0],
    price: 55000,
    rating: 4.0,
    title: 'Markas Biliard',
    type: 'Sedang Naik daun',
    users: 13,
  ),
  Biliard(
    description:
        "Robin biliard merupakan salah satu tempat bermain biliard terbaik di samarinda. Memiliki tempat yang nyaman dan bersih membuat tempat bermain ini sangatlah ramai meski harga yang ditawarkan cukup mahal.",
    facilities: ['20 Meja Biliard', '4 Toilet', '1 Cafe', '1 Bar', 'Parkiran Motor & Mobil'],
    id: 'biliard2',
    image: 'asset/biliard2.jfif',
    location: 'Jl. Siradj Salman No.01, Air Hitam, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur 75124',
    owner: listUser[1],
    price: 75000,
    rating: 4.8,
    title: 'Robin Biliard',
    type: 'Tempat Terbaik',
    users: 91,
  ),
];
final listBiliardNear = [
  Biliard(
    description:
        "Akasha biliard merupakan tempat biliard yang sudah cukup lama berada di samarinda. Walaupun letaknya yang cukup terpencil tetapi tempat biliard ini hampir tidak pernah sepi pengunjung dan meskipun tempat nya yang cukup kecil, pelayanan nya lah yang membuat tempat ini tidak pernah sepi. ",
    facilities: ['10 Meja Biliard', '1 Toilet', '1 Kantin', '1 Rooftop' 'Parkiran Motor & Mobil'],
    id: 'biliard3',
    image: 'asset/biliard3.jfif',
    location: 'Jl. Juanda 2, Air Hitam, Kec. Samarinda Ulu, Kota Samarinda, Kalimantan Timur 75243',
    owner: listUser[2],
    price: 50000,
    rating: 4.5,
    title: 'Akasha Biliard',
    type: 'Legend',
    users: 29,
  ),
  Biliard(
    description:
        "Sanjaya biliard merupakan tempat biliar favorit bagi warga samarinda seberang. Pelayanan yang baik dan kebersihan yang dijaga membuat pengunjung betah berlama lama disini. ",
    facilities: ['14 Meja Biliard', '2 Toilet', '1 Cafe', 'Parkiran Motor'],
    id: 'biliard4',
    image: 'asset/biliard4.jfif',
    location: 'Jl. Cipto Mangun Kusumo No.88, Sungai Keledang, Kec. Samarinda Seberang, Kota Samarinda, Kalimantan Timur 75242',
    owner: listUser[1],
    price: 60000,
    rating: 4.5,
    title: 'Sanjaya Biliard',
    type: 'Menarik',
    users: 21,
  ),
];
