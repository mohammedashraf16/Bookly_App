import 'package:bloc/bloc.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:bookely_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
    var result=await fetchFeaturedBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    },);
  }
}
