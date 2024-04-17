import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/function/routing.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/presentation/view-model/news_cubit.dart';
import 'package:insights_news/features/home/presentation/view-model/news_state.dart';
import 'package:insights_news/features/news_detail/presentation/view/news_detail.dart';

class BbcNewsView extends StatefulWidget {
  const BbcNewsView(
      {super.key, required this.sourceId, required this.sourceName});
  final String sourceId;
  final String sourceName;

  @override
  State<BbcNewsView> createState() => _BbcNewsViewState();
}

class _BbcNewsViewState extends State<BbcNewsView> {
  @override
  void initState() {
    context.read<NewsCubit>().getSourceNews(sourceId: widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColoes.white,
          backgroundColor: AppColoes.darkBackground,
          centerTitle: true,
          title: Text(
            widget.sourceName,
            style: getTextStyle(color: AppColoes.white, context),
          ),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsSourceSuccessState) {
              var news = state.model.articles;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: news?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigatorTo(context, NewsDetail(model: news[index],));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColoes.colorList,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                news![index].urlToImage ?? '',
                                width: 150,
                                height: 90,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      width: 150,
                                      height: 90,
                                      fit: BoxFit.cover,
                                      'assets/images/logo_app.png');
                                },
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    news[index].title ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: getSmallStyle(context,
                                        fontSize: 12, color: AppColoes.white),
                                  ),
                                  const Gap(5),
                                  Text(
                                    news[index].author ?? '',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: getSmallStyle(context,
                                        fontSize: 12, color: AppColoes.grey),
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
                                            fontSize: 12,
                                            color: AppColoes.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is NewsSourceErrorState) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
