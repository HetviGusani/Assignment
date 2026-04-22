import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibely/Profile/profile_screen.dart';
import 'package:vibely/others/colors.dart';

import '../auth/login.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<PopupMenuEntry<String>>? menuItems;

  const CommonAppBar({super.key, required this.title, this.menuItems});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 2,
      iconTheme: IconThemeData(color: AppColors.textWhite),
      title: Text(title,style: TextStyle(color: AppColors.textWhite),),
      actions: menuItems != null
          ? [
        PopupMenuButton<String>(
          onSelected: (value) {
            if(value=='profile'){
              //Navigator.o(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
            }else if (value == 'logout') {
              _logOut(context);
            }
          },
          itemBuilder: (context) => menuItems!,
        ),
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const Login()),
          (Route<dynamic> route) => false,
    );
  }
}