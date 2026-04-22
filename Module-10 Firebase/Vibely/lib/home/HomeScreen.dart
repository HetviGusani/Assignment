import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibely/home/chats.dart';
import 'package:vibely/home/user_tile.dart';
import 'package:vibely/others/drawer.dart';

import '../models/user_provider.dart';
import '../others/appbar.dart';
import '../others/colors.dart';
import 'chat_page.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String email;

  const HomeScreen({super.key, required this.name, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChatService _chatService = ChatService();
  final user = FirebaseAuth.instance.currentUser;
  late final username = user?.email?.split("@")[0] ?? "User";
  late final firstLetter = username[0].toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Share your vibes ✨",
        menuItems: [
          //const PopupMenuItem(value: 'new_chat', child: Text('New Chat')),
          PopupMenuItem(
            value: 'profile',
            child: Row(
              children: [
                const Icon(Icons.person,color: AppColors.primaryDark,),
                Text('Profile', style: TextStyle(color: AppColors.primaryDark)),
              ],
            ),
          ),const PopupMenuDivider(),const PopupMenuItem(
            value: 'logout',
            child: Row(
              children: [
                Icon(Icons.logout,color: Colors.red,),
                Text('Logout', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
      body: _buildUserList(),
      drawer: AppDrawer(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final users = snapshot.data!;

        /// 🔥 FILTER CURRENT USER HERE
        final filteredUsers = users.where((user) {
          return user["email"] != widget.email;
        }).toList();

        return ListView(
          children: filteredUsers
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData,
      BuildContext context,
      ) {
    final String receiverID = userData["uid"] ?? "";
    final String receiverEmail = userData["email"] ?? "";

    // 🔥 safety: skip if uid is missing
    if (receiverID.isEmpty) return const SizedBox.shrink();

    return UserTile(
      text: receiverEmail,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: receiverEmail,
              receiverID: receiverID,  // ✅ real UID
            ),
          ),
        );
      },
    );
  }
}
