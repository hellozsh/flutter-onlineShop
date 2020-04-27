
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User{

  User(this.name, this.email);

  final String name;
  final String email;
}

