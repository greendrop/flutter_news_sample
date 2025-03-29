import 'package:app/feature/localization/hook/use_l10n.dart';

enum NewsHeadlineCategory {
  general(value: 'general'),
  business(value: 'business'),
  entertainment(value: 'entertainment'),
  health(value: 'health'),
  science(value: 'science'),
  sports(value: 'sports'),
  technology(value: 'technology');

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

  String nameByL10n(L10n l10n) {
    switch (this) {
      case NewsHeadlineCategory.general:
        return l10n.newsHeadlineCategoryGeneral;
      case NewsHeadlineCategory.business:
        return l10n.newsHeadlineCategoryBusiness;
      case NewsHeadlineCategory.entertainment:
        return l10n.newsHeadlineCategoryEntertainment;
      case NewsHeadlineCategory.health:
        return l10n.newsHeadlineCategoryHealth;
      case NewsHeadlineCategory.science:
        return l10n.newsHeadlineCategoryScience;
      case NewsHeadlineCategory.sports:
        return l10n.newsHeadlineCategorySports;
      case NewsHeadlineCategory.technology:
        return l10n.newsHeadlineCategoryTechnology;
    }
  }
}
