
import 'package:flutter_inappbrowser_example/agreement_list_model.dart';

class SignUpModel {
  String mobile;
  String invite_code;
  String username;
  String password;
  List<AgreementModel> list;
  String stepCode;

  SignUpModel(this.mobile,this.invite_code,this.username,this.password,this.list,this.stepCode);

}