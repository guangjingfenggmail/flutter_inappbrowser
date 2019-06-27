import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:flutter_inappbrowser_example/agree/agreement_list_model.dart';
import 'package:flutter_inappbrowser_example/inappbrowser_webapp.dart';
import 'package:flutter_inappbrowser_example/inline_example.screen.dart';
import 'package:flutter_inappbrowser_example/agree/sign_params_model.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  // await localhostServer.start();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SignUpModel signUpModel;

  @override
  void initState() {
    super.initState();
    List<AgreementModel> list = new List<AgreementModel>();

//            AgreementModel model = new AgreementModel("term-of-service","3fd2668ffa61462cb78f8e4c5a63c480","Terms of Service","https://api.cashalo.com/contract/present?presentId=3fd2668ffa61462cb78f8e4c5a63c480");
//            list.add(model);
//
//            model = new AgreementModel("privacy-policy","76093812e67f4c5f8839c131eedebd61","Privacy Policy","https://api.cashalo.com/contract/present?presentId=76093812e67f4c5f8839c131eedebd61");
//            list.add(model);
    AgreementModel model = new AgreementModel(
        "term-of-service", "3fd2668ffa61462cb78f8e4c5a63c480", "Terms of Service", "https://now.qq.com/pcweb/topic.html?topic=%E6%96%B0%E4%BA%BA&_wv=16778245&from=98002&ADTAG=gdh-kz");
    list.add(model);

    model = new AgreementModel("privacy-policy", "76093812e67f4c5f8839c131eedebd61", "Privacy Policy", "https://github.com/");
    list.add(model);
    signUpModel = new SignUpModel("", "", "", "", list, "");

    webTitle = list[0].title;
  }

  @override
  void dispose() {
    super.dispose();
  }

  String webTitle = "";

  void loadUrlCallback(String _title) {
    print("_title==" + _title);
    setState(() {
      webTitle = _title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        body: InappBrowserWebapp(signUpModel, loadUrlCallback),
      body: InlineExampleScreen(),
      ),
    );
  }
}
