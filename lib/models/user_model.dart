import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String city;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.city = '',
  });

  @override
  List<Object?> get props => [id, email, name, city];
}
