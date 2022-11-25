import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/marriage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/controller/shared_pref_controlledr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefController().inittalShared();

  runApp(
    Phoenix(
      child: ProviderScope(
        child: Marriage(),
      ),
    ),
  );
}
