import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        centerTitle: true,
        title: Text(
          'Find Your News',
          style: getTextStyle(color: AppColoes.white, context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintStyle: getBodyStyle(context, color: AppColoes.grey),
                  hintText: 'Search for news',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 35,
                    color: AppColoes.white,
                  )),
            ),
            const Gap(30),
            Text(
              'Total Results : 10',
              style: getSmallStyle(context, color: AppColoes.white),
            ),
            const Gap(7),
            
          ],
        ),
      ),
    );
  }
}
