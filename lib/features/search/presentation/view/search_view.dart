import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/view-model/news_cubit.dart';
import 'package:insights_news/features/source/presentation/widget/news_search_builder.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  var searchController = TextEditingController();
  String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        centerTitle: true,
        title: Text(
          'Find Your News',
          style: getTextStyle(color: AppColoes.primary, context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                search = value;
              },
              style: getBodyStyle(context, color: AppColoes.primary),
              controller: searchController,
              decoration: InputDecoration(
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(5),
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      backgroundColor: AppColoes.primary,
                      onPressed: () {
                        context
                            .read<NewsCubit>()
                            .gatNewsBySearch(search: search!);
                      },
                      child: const Text('Go'),
                    ),
                  ),
                  hintStyle: getBodyStyle(context, color: AppColoes.grey),
                  hintText: 'Search for news',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 35,
                    color: AppColoes.primary,
                  )),
            ),
            const Gap(30),
            // Text(
            //   'Total Results : 10',
            //   style: getSmallStyle(context, color: AppColoes.white),
            // ),
            // const Gap(7),
            Expanded(
                child: NewsSearchBuilder(
              query: search ?? 'Sports',
            ))
          ],
        ),
      ),
    );
  }
}
