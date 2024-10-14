import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books,String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}