import 'package:insights_news/features/home/model/news_model/news_model.dart';
import 'package:insights_news/features/source/model/source_news/source_news.dart';

class NewsState {}

class NewsInitialState extends NewsState {}

class NewsByCategoryLoadingState extends NewsState {}

class NewsByCategorySuccessState extends NewsState {
  final NewsModel model;
  NewsByCategorySuccessState(this.model);
}

class NewsByCategoryErrorState extends NewsState {
  final String error;
  NewsByCategoryErrorState(this.error);
}

class NewsBySearchLoadingState extends NewsState {}

class NewsBySearchSuccessState extends NewsState {
  final NewsModel model;
  NewsBySearchSuccessState(this.model);
}

class NewsBySearchErrorState extends NewsState {
  final String error;
  NewsBySearchErrorState(this.error);
}

class NewsBySourceLoadingState extends NewsState {}

class NewsBySourceSuccessState extends NewsState {
  final SourceNews model;
  NewsBySourceSuccessState(this.model);
}

class NewsBySourceErrorState extends NewsState {
  final String error;
  NewsBySourceErrorState(this.error);
}




//////////////
class NewsSourceLoadingState extends NewsState {}

class NewsSourceSuccessState extends NewsState {
  final NewsModel model;
  NewsSourceSuccessState(this.model);
}

class NewsSourceErrorState extends NewsState {
  final String error;
  NewsSourceErrorState(this.error);
}