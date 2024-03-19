import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/auth/auth_gate.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // Get current user using FirebaseAuth instance
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _buildeUserList(),
    );
  }

  // Build user list
  Widget _buildeUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshots) {
        // Handle errors and loading states
        if (snapshots.hasError) {
          return const Text("Error");
        }
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        // Check for null data before accessing
        if (snapshots.data == null) {
          return const Text("No users found.");
        }

        return ListView(
          children: snapshots.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  // Build individual user list items
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // Only display users excluding the current user
    if (userData["email"] != getCurrentUser()?.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox(); // Hide the current user tile
    }
  }
}
