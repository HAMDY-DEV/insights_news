import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class NewsListBuilder extends StatelessWidget {
  const NewsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: AppColoes.colorList,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                 'assets/images/rodri.png',
                  width: 150,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Man City stay perfect despite Rodri red against Forest',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: getSmallStyle(context,
                          fontSize: 12, color: AppColoes.white),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: AppColoes.white,
                          size: 14,
                        ),
                        const Gap(5),
                        Text(
                          'Read',
                          style: getSmallStyle(context,
                              fontSize: 12, color: AppColoes.white),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
