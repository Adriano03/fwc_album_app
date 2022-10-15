// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  //Usado para guardar informações do backend para utilizar nos filtos
  var album = <GroupsStickers>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    //_view recebe uma copia da lista
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      // Atualizar a tela com todos os grupos
      _view.updateAlbum(album);
    } else {
      // Atualizar a minha lista filtrando os grupos selecionados!
      // O album filtra os countryCode, onde o element são os paises(ex: BRA, USA, POR),
      //Se no filtro veio [BRA], ele verifica se o countries tem [BRA]!
      // ...album.where((BRA) => countries.contains(BRA.countryCode)) - Adiciona o BRA,
      // se vier outro paises diferente do album ex[ENG] ele não adiciona!
      final albumFilter = [
        ...album.where((element) => countries.contains(element.countryCode))
      ];
      _view.updateAlbum(albumFilter);
    }
  }

  @override
  Future<void> refresh() async {
    _view.showLoader();
    await getMyAlbum();
    countryFilter(countries);
    statusFilter(statusSelected);
  }
}
