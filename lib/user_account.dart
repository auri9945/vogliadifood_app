import 'package:hive_flutter/hive_flutter.dart';

part 'user_account.g.dart';

@HiveType(typeId: 1)
class UserAccount {
  UserAccount({required this.nome, required this.cognome, required this.email, required this.indirizzo, required this.password });

  @HiveField(0)
  String nome;

  @HiveField(1)
  String cognome;

  @HiveField(2)
  String email;

  @HiveField(3)
  String indirizzo;

  @HiveField(4)
  String password;

}
