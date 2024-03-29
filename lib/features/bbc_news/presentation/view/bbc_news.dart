import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/widget/news_list_builder.dart';

class BbcNewsView extends StatefulWidget {
  const BbcNewsView({super.key});

  @override
  State<BbcNewsView> createState() => _BbcNewsViewState();
}

class _BbcNewsViewState extends State<BbcNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        centerTitle: true,
        title: Text(
          'BBC NEWS',
          style: getTextStyle(color: AppColoes.white, context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Results : 10',
              style: getSmallStyle(context, color: AppColoes.white),
            ),
            const Gap(7),
            const Expanded(child: NewsListBuilder()),
          ],
        ),
      ),
    );
  }
}
