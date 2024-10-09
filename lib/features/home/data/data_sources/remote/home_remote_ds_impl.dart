import 'package:bookely_app/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';

class HomeRemoteDsImpl implements HomeRemoteDS{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}