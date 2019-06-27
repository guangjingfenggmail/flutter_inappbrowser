import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:flutter_inappbrowser_example/agree/sign_params_model.dart';


class InappBrowserWebapp extends StatelessWidget {
  SignUpModel signUpModel;
  ValueChanged<String> callback;

  InappBrowserWebapp(SignUpModel model, ValueChanged<String> _callback) {
    this.signUpModel = model;
    this.callback = _callback;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _InappBrowserWebappPage(context, signUpModel, callback),
    );
  }
}

class _InappBrowserWebappPage extends StatefulWidget {
  BuildContext mContext;
  SignUpModel signUpModel;
  ValueChanged<String> callback;

  _InappBrowserWebappPage(BuildContext context, SignUpModel model, ValueChanged<String> _callback) {
    this.mContext = context;
    this.signUpModel = model;
    this.callback = _callback;
  }

  @override
  State<StatefulWidget> createState() {
    return _InappBrowserWebappPageState(mContext, signUpModel);
  }
}

class _InappBrowserWebappPageState extends State<_InappBrowserWebappPage> {
  BuildContext mContext;
  SignUpModel signUpModel;
  static const String TAG = "_InappBrowserWebappPageState";

  _InappBrowserWebappPageState(BuildContext context, SignUpModel model) {
    this.mContext = context;
    this.signUpModel = model;

    index = 0;
    if (signUpModel != null && signUpModel.list != null) {
      urlString = signUpModel.list[index].url;
      webTitle = signUpModel.list[index].title;
    }
  }

  InAppWebViewController webView;
  String urlString = "";
  String webTitle;
  int index;
  double progress = 0;

  launchUrl() {
    if (webView != null) {
      webView.loadUrl(urlString);
    }
    widget.callback(webTitle);
  }

  void goNextIndex() {
    setState(() {
      if (signUpModel != null && signUpModel.list != null) {
        if (index == 0) {
          index++;
        } else if (index == signUpModel.list.length - 1) {
          //todo submit next page
          return;
        }
        urlString = signUpModel.list[index].url;
        webTitle = signUpModel.list[index].title;
        print("urlString=="+urlString+";webTitle=="+webTitle+";index=="+index.toString());
        launchUrl();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void goBack(int i) {
    setState(() {
      if (signUpModel != null && signUpModel.list != null) {
        index = i;
        urlString = signUpModel.list[i].url;
        webTitle = signUpModel.list[i].title;
        print("urlString=="+urlString+";webTitle=="+webTitle+";index=="+index.toString());
        launchUrl();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: progress < 1.0 ? LinearProgressIndicator(value: progress) : null
              ),
              Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: InAppWebView(
                      initialUrl: urlString,
                      initialHeaders: {
                      },
                      initialOptions: {
                      },
                      onWebViewCreated: (InAppWebViewController controller) {
                        webView = controller;

                        webView.addJavaScriptHandler('scroll', (args) {
                          print("=========" + args.toString());
                          return "11";
                        });
                      },
                      onLoadStart: (InAppWebViewController controller, String url) {
                      },
                      onLoadStop: (InAppWebViewController controller, String url) async {},
                      onProgressChanged:
                          (InAppWebViewController controller, int progress) {
                        setState(() {
                          this.progress = progress / 100;
                        });
                      },

                      shouldOverrideUrlLoading: (InAppWebViewController controller, String url) {
                        controller.loadUrl(url);
                      },
                      onLoadResource: (InAppWebViewController controller, WebResourceResponse response, WebResourceRequest request) {

                      },
                      onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {

                      },
                    ),

                  )
              ),
              Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                    MaterialButton(
                      color: Colors.blueAccent,
                      minWidth: 400,
                      height: 48,
                      child: new Text("Accept", style: TextStyle(color: Colors.black54, fontSize: 16)),
                      onPressed: () {
                        goNextIndex();
                      },
                    ),
                  ])),
            ]
        )
    );
  }
}
