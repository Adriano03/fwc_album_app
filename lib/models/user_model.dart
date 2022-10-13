import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  //Total de figurnhas do album
  final int totalAlbum;

  //Total de figurinhas que tenho no album
  final int totalStickers;

  //Total de figurinhas repetidas
  final int totalDuplicates;

  //Total de figurinhas que faltam para completar o seu album
  final int totalComplete;

  final int totalCompletePercent;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.totalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'totalStickers': totalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      totalAlbum: map['total_album'] as int,
      totalStickers: map['total_stickers'] as int,
      totalDuplicates: map['total_duplicates'] as int,
      totalComplete: map['total_complete'] as int,
      totalCompletePercent: map['total_complete_percent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
