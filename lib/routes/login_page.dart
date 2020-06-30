import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shixin_flutter_app/common/funs.dart';
import 'package:shixin_flutter_app/i10n/localization_intl.dart';
import 'package:shixin_flutter_app/models/user.dart';
import 'package:shixin_flutter_app/models/userinfo.dart';
import 'package:shixin_flutter_app/net/git_api.dart';
import 'package:shixin_flutter_app/net/global.dart';
import 'package:shixin_flutter_app/net/result_data.dart';
import 'dart:convert' as convert;

import 'package:shixin_flutter_app/states/profile_change_notifier.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    print("------");
    if (null != Global.profile && Global.profile.user != null) {
      print("Global.profile not null");
      // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
      _unameController.text = Global.profile.user.login;
      if (_unameController.text != null) {
        _nameAutoFocus = false;
      }
    } else {
      print("Global.profile is null");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(gm.login),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: gm.userName,
                    hintText: gm.userName,
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : gm.userNameRequired;
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: gm.password,
                    hintText: gm.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : gm.passwordRequired;
                },
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text(gm.login),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // Navigator.pushNamed(context, "home");

    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
      User user;
      String response;
      try {
        /*user = await Git(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;*/
        var map = HashMap<String, String>();

        map['mobile'] = _unameController.text;
        map['pwd'] = _pwdController.text;

        response = await Git(context).login(queryParameters: map);

        Map<String, dynamic> user = json.decode(response);
        bool flag = user['success'];
        if (flag == true) {
          Userinfo userinfo = Userinfo.fromJson(user['data']);
          userinfo.login = _unameController.text;
          // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
          Provider.of<UserModel>(context, listen: false).user = userinfo;
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed("home");

          print("---" + flag.toString());
        } else {
          Navigator.of(context).pop();
        }
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
          showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
        } else {
          showToast(e.toString());
          print(e.toString());
        }
      } finally {
        // 隐藏loading框
        // Navigator.of(context).pop();
      }
      if (user != null) {
        // 返回
        // Navigator.of(context).pop();
      }
    }
  }
}
