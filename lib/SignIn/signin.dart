import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zalo/Service/auth_service.dart';
import 'country_code.dart';
import 'country_model.dart';
class SignInPage extends StatefulWidget{
  SignInPage({Key? key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage>{

  // firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  String countryName = "VN";
  String countriesCode = "+84";
  bool obscure = true;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  // AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vui lòng nhập số điện thoại và mật khẩu để đăng nhập",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              countryCode(),
              passWord(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: Text(
                  "Lấy lại mật khẩu",
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              if(authService.errorMessage !=null)
                Text(
                  authService.errorMessage,
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: ElevatedButton(

                    onPressed: () {
                      authService.signInWithEmailAndPassword(
                          _phoneController.text, _pwdController.text);
                    },
                    child: Text(
                      "Đăng nhập"
                    ),
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countryCode() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builer) => CountryCode()));
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.1,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 1.8,
                ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                  child: Text(
                    'VN',
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Số điện thoại',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passWord() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builer) => passWord()));
      },
      child: Stack(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.1,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 1.8,
                    ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _pwdController,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mật khẩu',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: obscurePassword,
                  child: Text(
                    "Hiện",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  void obscurePassword(){
    setState(() {
      obscure = !obscure;
    });
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countriesCode = countryModel.code;
    });
  }
}