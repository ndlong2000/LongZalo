import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zalo/Service/auth_service.dart';

class HomeScr extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String content = 'pass';
    final authService = Provider.of<AuthService>(context);
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          Text(content),
          ElevatedButton(
              onPressed: () async {
                await authService.signOut();
              },
              child: Text('Log Out')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text('Tro ve Trang Sign In')
          ),
        ],
      )
    );
  }
}