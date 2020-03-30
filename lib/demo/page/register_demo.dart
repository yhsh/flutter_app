import 'package:flutter/material.dart';

//注册的demo页面
class RegisterDemo extends StatefulWidget {
  @override
  RegisterDemoState createState() => RegisterDemoState();
}

class RegisterDemoState extends State<RegisterDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "注册案例",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  var registerFormKey = GlobalKey<FormState>();
  String userName, password;

  //默认不自动验证错误信息
  bool isAutoValidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      //点击注册按钮保存数据
      registerFormKey.currentState.save();
      debugPrint("用户名$userName:密码：$password");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("正在注册……")));
    } else {
      setState(() {
        //重新设置自动验证错误信息
        isAutoValidate = true;
      });
    }
  }

  //用户名的错误提示信息
  String validatorName(String value) {
    if (value.isEmpty) {
      return "用户名不能为空";
    }
    return null;
  }

  //密码的错误提示信息
  String validatorPassword(String value) {
    if (value.isEmpty) {
      return "密码不能为空";
    }
    //有数据就不提示错误信息
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
                icon: Icon(Icons.phone_iphone),
                labelText: "手机号",
                //设置四周边框
                border: OutlineInputBorder(),
                hintText: "请输入手机号"),
            onSaved: (user) {
              userName = user;
            },
            validator: validatorName,
            //自动验证输入框的值
            autovalidate: isAutoValidate,
          ),
          //设置上下间隔
          SizedBox(height: 5),
          TextFormField(
            //以密码状态显示
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.power_settings_new),
                //设置无边框
                border: InputBorder.none,
                labelText: "密码",
                hintText: "请输入密码"),
            onSaved: (pwd) {
              password = pwd;
            },
            validator: validatorPassword,
            //自动验证输入框的值
            autovalidate: isAutoValidate,
          ),
          //设置边距
          SizedBox(height: 20),
          //注册按钮
          Container(
            width: double.infinity,
            height: 45,
            child: RaisedButton(
                //设置圆角和边框
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 0.5, color: Colors.black26)),
                elevation: 15,
                color: Colors.cyan,
                child: Text(
                  "注册",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: submitRegisterForm),
//                onPressed: () => debugPrint("点击了注册按钮")),
          )
        ],
      ),
    );
  }
}
