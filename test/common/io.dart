import 'dart:io';

import 'package:path/path.dart';

final String testDirectory = join(
  Directory.current.path,
  Directory.current.path.endsWith('test') ? '' : 'test',
);

String getJson(String name) =>
    File('$testDirectory/data/$name').readAsStringSync();
