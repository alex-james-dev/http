// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:java_http/java_http.dart';
import 'package:test/test.dart';

void main() {
  // group('Google.com test', () {
  //   final awesome = Awesome();

  //   setUp(() {
  //     // Additional setup goes here.
  //   });

  //   test('First test', () async {
  //     final response =
  //         await JavaClient().get(Uri.parse('https://www.google.com'));
  //     print(response.statusCode);
  //     print(response.body);
  //   });
  // });

  test('Cat Fact Test', () async {
    final client = JavaClient();
    final response = await client.get(Uri.parse('https://catfact.ninja/fact'));

    print('Response status: ${response.statusCode} ${response.reasonPhrase}\n');
    print('Response headers: ${response.headers}\n');
    print('Response body: ${response.body}');

    expect(response.statusCode, 200);
  });

  group('java_http client conformance tests', () {
    testResponseBody(JavaClient(), canStreamResponseBody: false);
    // testResponseHeaders(JavaClient());
    // testRequestHeaders(JavaClient());
    // testMultipleClients(JavaClient.new);
  });
}
