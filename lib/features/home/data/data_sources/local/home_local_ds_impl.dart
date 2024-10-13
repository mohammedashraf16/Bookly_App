import 'package:bookely_app/features/home/data/data_sources/local/home_local_ds.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';

class HomeLocalDsImpl implements HomeLocalDs{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}