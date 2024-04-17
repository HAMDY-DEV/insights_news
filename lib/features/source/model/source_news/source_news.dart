import 'source.dart';

class SourceNews {
  String? status;
  List<Source>? sources;

  SourceNews({this.status, this.sources});

  factory SourceNews.fromJson(
      Map<String, dynamic> json) {
    return SourceNews(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source
              .fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'status': status,
      'sources': sources
          ?.map((e) => e
              .toJson())
          .toList(),
    };
  }
}
