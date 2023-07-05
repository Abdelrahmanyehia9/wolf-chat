import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/features/chat/presentation/widget/chat_view_body.dart';

import '../../../../core/utils/helper.dart';
class ChatView extends StatelessWidget {
   ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.shade100,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: mainColor),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text("Brossly"),
        actions: [
          const Icon(Icons.camera_alt),
          const SizedBox(
            width: 14,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            onSelected: (value) {
              // your logic
            },
            itemBuilder: (BuildContext bc) {

              return  [
                PopupMenuItem(
                  onTap: (){
                    deleteChat() ;
                  },
                  child: const Text("remove chat"),
                ),
                const PopupMenuItem(
                  child: Text("search"),
                ),
                const PopupMenuItem(
                  child: Text("Add Friend"),
                ),
                const PopupMenuItem(
                  child: Text("Block"),
                ) ,
                 PopupMenuItem(
                   onTap:()async{
                     await FirebaseAuth.instance.signOut();
                     SharedPreferences pref = await SharedPreferences.getInstance();
                     pref.setBool(isLogin, false) ;
                     Restart.restartApp();

                   },
                  child: Text("Log out"),
                )
              ];
            },
          )
        ],
      ),
      body:  ChatViewBody(),
    );
  }
}

