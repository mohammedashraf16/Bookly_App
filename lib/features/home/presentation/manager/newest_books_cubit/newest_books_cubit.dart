import 'package:bloc/bloc.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
