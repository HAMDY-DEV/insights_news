import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widgets/custom_button.dart';
import 'package:insights_news/features/home/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key, required this.model});
  final Article model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(model.urlToImage!),
              Positioned(
                  left: 10,
                  right: 10,
                  bottom: 5,
                  child: Text(
                    model.title!,
                    style: getTextStyle(context, color: AppColoes.white),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  model.description!,
                  style: getBodyStyle(context,
                      color: AppColoes.white, fontSize: 18),
                ),
                const Gap(20),
                Text(
                  model.content!,
                  style: getBodyStyle(context,
                      color: AppColoes.white, fontSize: 15),
                ),
                const Gap(30),
                CustomButton(
                  text: 'Go',
                  onPressed: () async {
                    var url = model.url!;
                    if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
