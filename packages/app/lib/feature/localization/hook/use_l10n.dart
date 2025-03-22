import 'package:app/config/l10n/l10n.g.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

export 'package:app/config/l10n/l10n.g.dart';

L10n useL10n() {
  return L10n.of(useContext())!;
}
