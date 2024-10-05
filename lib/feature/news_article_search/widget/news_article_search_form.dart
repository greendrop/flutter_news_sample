import 'package:flutter/material.dart';
import 'package:flutter_news_sample/feature/translation/hook/use_translations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NewsArticleSearchForm extends StatefulHookConsumerWidget {
  const NewsArticleSearchForm({
    super.key,
    required this.initialKeyword,
    this.initiallidationEnabled = false,
    this.onSubmit,
  });

  static const keywordMaxLength = 255;

  final String initialKeyword;
  final void Function({required String keyword})? onSubmit;
  final bool initiallidationEnabled;

  @override
  NewsArticleSearchFormState createState() => NewsArticleSearchFormState();
}

class NewsArticleSearchFormState extends ConsumerState<NewsArticleSearchForm> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();

    _formGroup = _buildFromGroup(context);
    if (widget.initiallidationEnabled) {
      _formGroup.markAllAsTouched();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _formGroup,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildKeywordTextField(context)),
              _buildSubmitButton(context),
            ],
          ),
        ],
      ),
    );
  }

  void submit() {
    _formGroup.markAllAsTouched();

    if (_formGroup.invalid) {
      return;
    }
    _formGroup.unfocus();

    final keyword = _formGroup.control('keyword').value as String;
    widget.onSubmit?.call(keyword: keyword);
  }

  FormGroup _buildFromGroup(BuildContext context) {
    return FormGroup(
      {
        'keyword': FormControl<String>(
          value: widget.initialKeyword,
          validators: [
            Validators.required,
            Validators.maxLength(NewsArticleSearchForm.keywordMaxLength),
          ],
        ),
      },
    );
  }

  Widget _buildKeywordTextField(BuildContext context) {
    final translations = useTranslations();

    return ReactiveTextField<String>(
      key: const ValueKey('NewsArticleSearchFormKeywordTextField'),
      formControlName: 'keyword',
      validationMessages: {
        ValidationMessage.required: (error) =>
            translations.newsArticleSearchForm.keywordValidateBlank,
        ValidationMessage.maxLength: (error) =>
            translations.newsArticleSearchForm.keywordValidateTooLong(
              count: NewsArticleSearchForm.keywordMaxLength,
            ),
      },
      onSubmitted: (_) => submit(),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final translations = useTranslations();

    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final onPressed =
            (widget.onSubmit != null && _formGroup.valid) ? submit : null;

        return FilledButton(
          key: const ValueKey('NewsArticleSearchFormSubmitButton'),
          onPressed: onPressed,
          child: Text(translations.general.search),
        );
      },
    );
  }
}
