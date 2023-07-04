import 'package:flutter/material.dart';
import 'package:untitled/core/utils/dimention.dart';
import 'package:untitled/features/home/presentation/widgets/my_containers.dart';

import 'chat_items.dart';
import 'custom_app_bar.dart';
import 'custom_search_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const CustomAppBar(),
          const SizedBox(
            height: 16,
          ),
          const CustomSearchField(),
          const SizedBox(
            height: 12,
          ),
          const RecentChatContainer(),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: dimHeight(context) * 0.16,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const ImgContainers(
                      mName: "isabel",
                    )),
          ),
          const RecentChatContainer(),
          const SizedBox(height: 4),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const ChatItem()))
        ],
      ),
    );
  }
}
