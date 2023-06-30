// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:java_http/java_http.dart';
import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';

void main() {
  group('java_http client conformance tests', () {
    testResponseBody(JavaClient(), canStreamResponseBody: false);
  });
}