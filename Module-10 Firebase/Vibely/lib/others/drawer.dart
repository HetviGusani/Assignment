import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Profile/profile_screen.dart';
import 'colors.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          // 🔥 Header
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
            ),
            accountName: Text(user?.email?.split("@")[0] ?? "User"),
            accountEmail: Text(user?.email ?? ""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user?.email?[0].toUpperCase() ?? "U",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 💬 Chats
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("Chats"),
            onTap: () => Navigator.pop(context),
          ),

          // 👤 Profile
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),

          ListTile(
            leading: Icon(Icons.people_outline),
            title: Text("Contacts"),
          ),

          ListTile(
            leading: Icon(Icons.star_border),
            title: Text("Favorites"),
          ),

          ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text("Notifications"),
          ),

          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text("Privacy"),
          ),

          ListTile(
            leading: Icon(Icons.photo_library_outlined),
            title: Text("Media & Files"),
          ),

          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text("Dark Mode"),
          ),

          const Divider(),

          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Help & Support"),
          ),

          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
          ),

          const Divider(),

          // 🚪 Logout
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
