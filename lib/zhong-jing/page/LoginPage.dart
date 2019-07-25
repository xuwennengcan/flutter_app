import 'package:flutter/material.dart';
import 'package:flutter_app/zhong-jing/utils/strings.dart';

void main() => runApp(LoginPage());

//登录页面
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState()
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Strings.login),
        ),
        body: _widget(),
      ),
    );
  }

}

//用户名监听
final userNameController = TextEditingController();
//密码监听
final passwordController = TextEditingController();

Widget _widget() {
  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [Colors.blue, Colors.green])),
    padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
    //SingleChildScrollView : 是为了防止软键盘覆盖输入框
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //logo
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Image.asset(
              "images/zhong-jing/ic_login_bg.png",
            ),
          ),
          //用户名输入框
          SizedBox(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink[50],
              ),
              child: TextField(
                controller: userNameController,
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: Strings.inputUserNameHint,
                    hintText: Strings.inputUserNameHint,
                    border: InputBorder.none),
              ),
            ),
          ),
          //密码输入框
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink[50]),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                controller: passwordController,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: Strings.inputUserPasswordHint,
                    labelText: Strings.inputUserPasswordHint,
                    border: InputBorder.none),
              ),
            ),
          ),
          //登录按钮
          SizedBox(
            child: InkWell(
              //添加点击事件
              onTap: () {
                _onLoginClick(userNameController.text, passwordController.text);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  Strings.login,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

_onLoginClick(String userName, String password) {
  print("userName = $userName , password = $password");
}
