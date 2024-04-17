import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/function/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/bbc_news/presentation/view/bbc_news.dart';
import 'package:insights_news/features/home/presentation/view-model/news_cubit.dart';
import 'package:insights_news/features/home/presentation/view-model/news_state.dart';

class NewsSourceBuilder extends StatefulWidget {
  const NewsSourceBuilder({super.key});

  @override
  State<NewsSourceBuilder> createState() => _NewsSourceBuilderState();
}

class _NewsSourceBuilderState extends State<NewsSourceBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<NewsCubit>().gatNewsBySource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsBySourceSuccessState) {
          var news = state.model.sources;
          return GridView.builder(
            itemCount: news!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigatorTo(context, BbcNewsView(sourceId: news[index].id!, sourceName: news[index].name!));
                },
                child: Center(
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
                          news[index].name ?? '',
                          style: getBodyStyle(
                              fontSize: 12, context, color: AppColoes.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is NewsBySourceErrorState) {
          return const Center(child: Text('Error'));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
