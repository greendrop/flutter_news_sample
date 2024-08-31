import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';

enum NewsHeadlineCategory {
  general(value: 'general'),
  business(value: 'business'),
  entertainment(value: 'entertainment'),
  health(value: 'health'),
  science(value: 'science'),
  sports(value: 'sports'),
  technology(value: 'technology'),
  ;

  const NewsHeadlineCategory({required this.value});

  factory NewsHeadlineCategory.fromValue(String value) {
    switch (value) {
      case 'general':
        return NewsHeadlineCategory.general;
      case 'business':
        return NewsHeadlineCategory.business;
      case 'entertainment':
        return NewsHeadlineCategory.entertainment;
      case 'health':
        return NewsHeadlineCategory.health;
      case 'science':
        return NewsHeadlineCategory.science;
      case 'sports':
        return NewsHeadlineCategory.sports;
      case 'technology':
        return NewsHeadlineCategory.technology;
      default:
        throw Exception('Unknown value: $value');
    }
  }

  final String value;

  String nameByTranslations(Translations translations) {
    switch (this) {
      case NewsHeadlineCategory.general:
        return translations.newsHeadlineCategory.general;
      case NewsHeadlineCategory.business:
        return translations.newsHeadlineCategory.business;
      case NewsHeadlineCategory.entertainment:
        return translations.newsHeadlineCategory.entertainment;
      case NewsHeadlineCategory.health:
        return translations.newsHeadlineCategory.health;
      case NewsHeadlineCategory.science:
        return translations.newsHeadlineCategory.science;
      case NewsHeadlineCategory.sports:
        return translations.newsHeadlineCategory.sports;
      case NewsHeadlineCategory.technology:
        return translations.newsHeadlineCategory.technology;
    }
  }
}
