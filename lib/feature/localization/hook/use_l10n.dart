import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

export 'package:flutter_gen/gen_l10n/l10n.dart';

L10n useL10n() {
  return L10n.of(useContext())!;
}
