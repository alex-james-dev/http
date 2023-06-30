// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library;

import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:jni/jni.dart';
import 'package:path/path.dart';

import 'third_party/java/net/URL.dart';

class JavaClient extends BaseClient {
  void _initJVM() {
    if (!Platform.isAndroid) {
      Jni.spawnIfNotExists(dylibDir: join('build', 'jni_libs'));
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    _initJVM();

    final javaUrl = URL.ctor3(request.url.toString().toJString());
    final dartUrl = Uri.parse(javaUrl.toString1().toDartString());

    const result = 'Hello World!';
    final stream = Stream.value(latin1.encode(result));

    return StreamedResponse(stream, 200,
        contentLength: 12,
        request: Request(request.method, dartUrl),
        headers: {'content-type': 'text/plain'},
        reasonPhrase: 'OK');
  }
}
