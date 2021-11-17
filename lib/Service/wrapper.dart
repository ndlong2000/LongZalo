import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zalo/Service/auth_service.dart';
import 'package:zalo/SignIn/home.dart';
import 'package:zalo/SignIn/signin.dart';
import 'package:zalo/SignIn/user_model.dart';
import 'package:flutter/foundation.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if(snapshot.hasError) debugPrint('movieTitle');
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? SignInPage() : HomeScr();
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
      });
  }
}