
import 'package:flutter_app_new/model/item_model.dart';
import 'package:flutter_app_new/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  // Tạo sink, cần import: rx dart
  final _moviesFetcher = PublishSubject<ItemModel>();
  // Tạo Stream
  Stream <ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }

}
