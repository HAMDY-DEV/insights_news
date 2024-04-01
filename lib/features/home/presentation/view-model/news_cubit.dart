import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/home/presentation/view-model/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  gatNewsByCategory({required String category}) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.gatNewsByCategory(category: category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      NewsByCategoryErrorState(e.toString());
    }
  }
}
