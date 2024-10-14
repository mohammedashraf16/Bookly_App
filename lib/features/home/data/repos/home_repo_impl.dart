import 'package:bookely_app/core/errors/failure.dart';
import 'package:bookely_app/features/home/data/data_sources/local/home_local_ds.dart';
import 'package:bookely_app/features/home/data/data_sources/remote/home_remote_ds.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:bookely_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeRemoteDS homeRemoteDS;
  final HomeLocalDs homeLocalDs;

  HomeRepoImpl({required this.homeRemoteDS,required this.homeLocalDs});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async{
  try{
    var booksList =homeLocalDs.fetchFeaturedBooks();
    if(booksList.isNotEmpty){
      return right(booksList);
    }
    var books =await  homeRemoteDS.fetchFeaturedBooks();
    return right(books);
  }
  catch(e){
    return left(Failure());
  }

  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async{
    try{
      var booksList =homeLocalDs.fetchNewestBooks();
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      var newestBooks =await  homeRemoteDS.fetchNewestBooks();
      return right(newestBooks);
    }
    catch(e){
      return left(Failure());
    }
  }
}