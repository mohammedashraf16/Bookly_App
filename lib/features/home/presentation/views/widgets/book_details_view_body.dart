import 'package:bookely_app/core/utils/styles.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 43),
          const Text(
            "The Jungle Book",
            style: AppStyles.textStyle30,
          ),
          const SizedBox(height: 6),
          Text(
            "Rudyard Kipling",
            style: AppStyles.titleMedium.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 18),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(height: 37),
          const BooksAction(),
          const SizedBox(height: 43),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SimilarBooksListView(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
