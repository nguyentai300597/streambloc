import 'package:flutter/cupertino.dart';
import 'package:flutter_app_new/model/model_detail.dart';
import 'package:flutter_app_new/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {

  final _repository = Repository();
  final _movieId = PublishSubject<int>();
  final _movieDetail = BehaviorSubject<Future<MovieDetailModel>>();

  Function(int) get fetchMovieDetailById => _movieId.sink.add;
  Stream <Future<MovieDetailModel>> get movieDetail => _movieDetail.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_movieDetail);

  }

  dispose() async {
    _movieId.close();
    await _movieDetail.drain();
    _movieDetail.close();
  }

  _itemTransformer(){
    return ScanStreamTransformer(
            (Future<MovieDetailModel> movieDetail, int id, int index){
          movieDetail = _repository.fetchMovieDetail(id);
          return movieDetail;
        }
    );
  }
}

class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key key, Widget child})
      : bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MovieDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieDetailBlocProvider)
    as MovieDetailBlocProvider)
        .bloc;
  }
}

