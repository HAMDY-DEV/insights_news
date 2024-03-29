import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'dart:io';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,${AppLocalStorage.gatCachData(key: 'name').toString().split(' ').first}',
                  style: getTextStyle(context,
                      color: AppColoes.white, fontSize: 17.31),
                ),
                Text('Have a nice day',
                    style: getBodyStyle(context,
                        fontSize: 11.54, color: AppColoes.grey)),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: AppColoes.white,
              radius: 22,
              child: CircleAvatar(
                radius: 21,
                backgroundImage:
                    FileImage(File(AppLocalStorage.gatCachData(key: 'image'))),
              ),
            ),
          ],
        );
      },
    );
  }
}
