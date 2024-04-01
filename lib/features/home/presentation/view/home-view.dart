import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/view-model/news_cubit.dart';
import 'package:insights_news/features/home/presentation/view-model/news_state.dart';
import 'package:insights_news/features/home/presentation/widget/home_header.dart';
import 'package:insights_news/features/home/presentation/widget/news_list_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  int currentSlide = 0;

  @override
  void initState() {
    context.read<NewsCubit>().gatNewsByCategory(category: 'general');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const HomeHeader(),
                const Gap(10),
                BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsByCategorySuccessState) {
                      var listImage = state.model;
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 170,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentSlide = index;
                            });
                          },
                        ),
                        itemCount: 4,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Image.network(
                            listImage.articles![index].urlToImage ?? '',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  width: 150,
                                  height: 90,
                                  fit: BoxFit.cover,
                                  'assets/images/logo_app.png');
                            },
                          );
                        },
                      );
                    } else if (state is NewsByCategoryErrorState) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentSlide),
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey,
                      activeDotColor: AppColoes.primary),
                ),
                const Gap(15),
                ButtonsTabBar(
                    backgroundColor: AppColoes.primary,
                    unselectedBackgroundColor: AppColoes.colorList,
                    labelStyle: getBodyStyle(context, color: AppColoes.black),
                    unselectedLabelStyle:
                        getBodyStyle(context, color: AppColoes.white),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    tabs: const [
                      Tab(
                        text: 'Science',
                      ),
                      Tab(
                        text: 'Entertainment',
                      ),
                      Tab(
                        text: 'Sports',
                      ),
                      Tab(
                        text: 'Business',
                      ),
                    ]),
                const Gap(10),
                const Expanded(
                    child: TabBarView(
                  children: [
                    NewsListBuilder(
                      category: 'Science',
                    ),
                    NewsListBuilder(
                      category: 'Entertainment',
                    ),
                    NewsListBuilder(
                      category: 'Sports',
                    ),
                    NewsListBuilder(
                      category: 'Business',
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
