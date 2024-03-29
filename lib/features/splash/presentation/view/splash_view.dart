import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/function/routing.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/assets_images.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widgets/nav_bar_widget.dart';
import 'package:insights_news/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isUpload = AppLocalStorage.gatCachData(key: 'isUpload') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      navigatorToReplacement(
          context, isUpload ? const NavBarWidget() : const UploadView());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColoes.darkBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AssetImages.appIcon),
          ),
          const Gap(57),
          Text(
            'Insights News',
            style: getTextStyle(fontSize: 25, context, color: AppColoes.white),
          ),
          const Gap(24),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getSmallStyle(
                fontSize: 17, context, color: const Color(0xffB4AAAA)),
          )
        ],
      ),
    );
  }
}
