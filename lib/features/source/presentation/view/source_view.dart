import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/assets_images.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class SourceView extends StatefulWidget {
  const SourceView({super.key});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: 149,
                width: 127,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColoes.colorList,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/sources_image.png',
                      width: 127,
                      height: 101.59,
                      fit: BoxFit.cover,
                    ),
                    const Gap(11),
                    Text(
                      'BBC',
                      style: getBodyStyle(
                          fontSize: 12, context, color: AppColoes.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
