import 'package:bookely_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDs {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}
