// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library;

import 'dart:convert';

import 'package:http/http.dart';

class JavaClient extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    const result = 'Hello World!';
    final stream = Stream.value(latin1.encode(result));

    return StreamedResponse(stream, 200,
        contentLength: 12,
        request: request,
        headers: {'content-type': 'text/plain'},
        reasonPhrase: 'OK');
  }
}
