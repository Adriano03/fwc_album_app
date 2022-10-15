import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import '../../models/register_sticker_model.dart';

//Buscas de dados
abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
  //Busca detalhes figurinhas
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber);
  //Se nulo metodo para criar figurinha
  Future<StickerModel> create(RegisterStickerModel registerStickModel);

  Future<void> registerUserSticker(int stickerId, int amount);
  Future<void> updateUserSticker(int stickerId, int amount);

}
