import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/search/presentation/widget/news_search_builder.dart';
import 'package:insights_news/features/source/presentation/widget/news_source_builder.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  @override
  void initState() {
    ApiServices.gatNewsBySource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        centerTitle: true,
        title: Text(
          'Sources',
          style: getTextStyle(context, color: AppColoes.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: NewsSourceBuilder(),
      ),
    );
  }
}
