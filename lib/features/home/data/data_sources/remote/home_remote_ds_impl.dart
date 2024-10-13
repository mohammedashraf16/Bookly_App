import 'package:bookely_app/core/utils/api_service.dart';
import 'package:bookely_app/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:bookely_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';

class HomeRemoteDsImpl implements HomeRemoteDS {
  final ApiService apiService;

  HomeRemoteDsImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?q=programming&Filtering=free-ebooks");
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
