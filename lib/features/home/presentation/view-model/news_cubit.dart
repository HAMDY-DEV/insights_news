import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/home/presentation/view-model/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  void gatNewsByCategory({required String category}) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.gatNewsByCategory(category: category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      NewsByCategoryErrorState(e.toString());
    }
  }

  void gatNewsBySearch({required String search}) {
    emit(NewsBySearchLoadingState());
    try {
      ApiServices.gatNewsBySearch(query: search).then((value) {
        emit(NewsBySearchSuccessState(value!));
      });
    } catch (e) {
      NewsBySearchErrorState(e.toString());
    }
  }

  void gatNewsBySource() {
    emit(NewsBySourceLoadingState());
    try {
      ApiServices.gatNewsBySource().then((value) {
        emit(NewsBySourceSuccessState(value!));
      });
    } catch (e) {
      NewsBySourceErrorState(e.toString());
    }
  }

  void getSourceNews({required String sourceId}) {
    emit(NewsSourceLoadingState());
    try {
      ApiServices.gatSourceNews(sourceId: sourceId)
          .then((value) => {emit(NewsSourceSuccessState(value!))});
    } catch (e) {
      emit(NewsSourceErrorState(e.toString()));
    }
  }
}
