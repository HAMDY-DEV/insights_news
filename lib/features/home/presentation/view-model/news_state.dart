import 'package:insights_news/features/home/model/news_model/news_model.dart';

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
