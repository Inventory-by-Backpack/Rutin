import 'package:get/get.dart';

import 'lang/en.dart';
import 'lang/tr.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'tr_TR': tr,
      };
}
