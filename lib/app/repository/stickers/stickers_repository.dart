import 'package:fwc_album_app/app/models/groups_stickers.dart';

//Buscas de dados
abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
}
