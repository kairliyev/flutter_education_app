import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';


class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final String _title;
  final _key = UniqueKey();
  Widget view;
  bool isInternet = false;

  _WebViewContainerState(this._url, this._title);

  num _stackToView = 1;

  Future checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isInternet = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isInternet = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isInternet);
    return isInternet
        ? Scaffold(
            appBar: AppBar(title: Text(_title),),
            body: IndexedStack(
              index: _stackToView,
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                        child: WebView(
                      key: _key,
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: _url,
                      onPageFinished: _handleLoad,
                    )),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ))
        : Scaffold(
            appBar: AppBar(title: Text(_title),),
            body: Container(
              child: Center(
                child: Text("Нет интернета"),
              ),
            ),
          );
  }
}

class WebViewContainer extends StatefulWidget {
  final url;
  final String title;

  WebViewContainer(this.title,this.url);

  @override
  createState() => _WebViewContainerState(this.url, this.title);
}
