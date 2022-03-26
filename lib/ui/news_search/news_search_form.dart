// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_news_sample/providers/news_search_state_notifier_provider.dart';

class NewsSearchForm extends HookConsumerWidget {
  const NewsSearchForm({Key? key, required this.onSubmit}) : super(key: key);

  final void Function(String) onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final l10n = L10n.of(context)!;
    final keyword = useState('');
    final newsSearchState = ref.watch(newsSearchStateNotifierProvider);
    final loading = newsSearchState.articles is AsyncLoading<void>;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: l10n.search,
                  ),
                  onChanged: (value) {
                    keyword.value = value;
                  },
                  onSaved: (value) {
                    keyword.value = value.toString();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: keyword.value.isEmpty || loading
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          onSubmit(keyword.value);
                        }
                      },
                child: Text(l10n.search),
              ),
            ],
          )
        ],
      ),
    );
  }
}
