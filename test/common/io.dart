import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';

final String testDirectory = join(
  Directory.current.path,
  Directory.current.path.endsWith('test') ? '' : 'test',
);

Uint8List getTestFile(String name) =>
    File('$testDirectory/data/$name').readAsBytesSync();
