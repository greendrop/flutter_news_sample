import 'package:app/feature/localization/hook/use_l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NewsArticleSearchForm extends StatefulHookConsumerWidget {
  const NewsArticleSearchForm({
    required this.initialKeyword,
    this.initiallidationEnabled = false,
    this.onSubmit,
    super.key,
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
    return FormGroup({
      'keyword': FormControl<String>(
        value: widget.initialKeyword,
        validators: [
          Validators.required,
          Validators.maxLength(NewsArticleSearchForm.keywordMaxLength),
        ],
      ),
    });
  }

  Widget _buildKeywordTextField(BuildContext context) {
    final l10n = useL10n();

    return ReactiveTextField<String>(
      key: const ValueKey('NewsArticleSearchFormKeywordTextField'),
      formControlName: 'keyword',
      validationMessages: {
        ValidationMessage.required:
            (error) => l10n.newsArticleSearchFormKeywordValidateBlank,
        ValidationMessage.maxLength:
            (error) => l10n.newsArticleSearchFormKeywordValidateTooLong(
              NewsArticleSearchForm.keywordMaxLength,
            ),
      },
      onSubmitted: (_) => submit(),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    final l10n = useL10n();

    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final onPressed =
            (widget.onSubmit != null && _formGroup.valid) ? submit : null;

        return FilledButton(
          key: const ValueKey('NewsArticleSearchFormSubmitButton'),
          onPressed: onPressed,
          child: Text(l10n.generalSearch),
        );
      },
    );
  }
}
