import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

   @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {late final WebViewController controller;
@override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        /// Previous code
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://instagram.com/eunwo.o_c?igshid=OGQ5ZDc2ODk2ZA=='),
      );
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
);
}
}


