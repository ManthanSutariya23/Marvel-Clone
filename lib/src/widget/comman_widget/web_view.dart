

import 'dart:async';

import 'package:marvel/src/config/api_endpoints.dart';
import 'package:webview_flutter/webview_flutter.dart';

webView(file) {
  final Completer<WebViewController> r1 = Completer<WebViewController>();
  return WebView(
    initialUrl: file,
    javascriptMode: JavascriptMode.unrestricted,
    onWebViewCreated: (WebViewController webViewController) {
      r1.complete(webViewController);
    },
  );
}