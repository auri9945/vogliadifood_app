// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **

class UserAccountAdapter extends TypeAdapter<UserAccount> {
  @override
  final int typeId = 0;

  @override
  UserAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccount();
  }

  @override
  void write(BinaryWriter writer, UserAccount obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserAccountAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}