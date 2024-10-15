import 'package:bookely_app/core/utils/styles.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookely_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'featured_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Best Seller",
                  style: AppStyles.titleMedium,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}


