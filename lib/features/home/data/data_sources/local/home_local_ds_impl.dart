import 'package:bookely_app/constants.dart';
import 'package:bookely_app/features/home/data/data_sources/local/home_local_ds.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDsImpl implements HomeLocalDs{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box  = Hive.box<BookEntity>(kFeaturedBox);
   return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box  = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}