import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insights_news/core/utils/assets_images.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/Profile/presentation/view/profile_view.dart';
import 'package:insights_news/features/home/presentation/view/home-view.dart';
import 'package:insights_news/features/search/presentation/view/search_view.dart';
import 'package:insights_news/features/source/presentation/view/source_view.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;

  List<Widget> view = [
    const HomeView(),
    SearchView(),
    const SourceView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AssetImages.homeIcon,
                colorFilter:
                    ColorFilter.mode(AppColoes.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AssetImages.homeIcon),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AssetImages.searchIcon,
                colorFilter:
                    ColorFilter.mode(AppColoes.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AssetImages.searchIcon),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AssetImages.folderIcon,
                colorFilter:
                    ColorFilter.mode(AppColoes.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AssetImages.folderIcon),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AssetImages.profileIcon,
                colorFilter:
                    ColorFilter.mode(AppColoes.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset(AssetImages.profileIcon),
              label: ''),
        ],
      ),
    );
  }
}

/*=
 Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Gap(40),
            ValueListenableBuilder(
              valueListenable: Hive.box('user').listenable(),
              builder: (BuildContext context, value, Widget? child) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hello,${AppLocalStorage.gatCachData(key: 'name').toString().split(' ').first}',
                          style: getTextStyle(context, color: AppColoes.white),
                        ),
                        Text('Have A Nice Day.',
                            style: getBodyStyle(context,
                                fontSize: 12, color: AppColoes.grey)),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        //  navigatorTo(context, const ProfileView());
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(
                            File(AppLocalStorage.gatCachData(key: 'image'))),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      
*/
