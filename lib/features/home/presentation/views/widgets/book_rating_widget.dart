import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:mainAxisAlignment,
      children: [
        const Icon(
          size: 17,
          FontAwesomeIcons.solidStar,
          color: kYellowColor,
        ),
        const SizedBox(width: 6.3),
        Text(
          "4.8",
          style: AppStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          "(2390)",
          style: AppStyles.textStyle14,
        ),
      ],
    );
  }
}
