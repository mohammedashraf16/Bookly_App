import 'package:bookely_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDS {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
