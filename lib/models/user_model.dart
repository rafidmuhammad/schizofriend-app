import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? username;
  final String? age;
  final String? gender;
  final String? imageUrl;
  final String? riwayatPenyakit;

  const UserModel(
      {required this.id,
      required this.username,
      required this.age,
      required this.gender,
      required this.imageUrl,
      required this.riwayatPenyakit});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, username, age, gender, imageUrl, riwayatPenyakit];
}
