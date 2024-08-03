import 'package:bookely_app/core/utils/styles.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/custom_book_item.dart';
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
        ],
      ),
    );
  }
}
