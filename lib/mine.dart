
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MineState();
}

class _MineState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return _buildMyListView();
  }

  final mineItemTitles = [
    "卡片收集",
    "漫画商城",
    "活动中心",
    "兑换码",
    "消息中心",
    "个性装扮",
    "我的活动",
    "我的团队",
    "设置",
    '关于我们'
  ];
  final mineItemLeftIcons = [
    Icons.card_giftcard,
    Icons.cases_sharp,
    Icons.local_activity,
    Icons.fact_check,
    Icons.message,
    Icons.celebration,
    Icons.speaker_group_sharp,
    Icons.nature_people,
    Icons.display_settings,
    Icons.rocket_launch_sharp
  ];

  Widget _buildMyListView() {
    final listView = ListView.builder(
      itemCount: mineItemLeftIcons.length,
      itemBuilder: (context, index) => _buildMyListItems(index,mineItemTitles[index],mineItemLeftIcons[index]),
    );
    return listView;
  }

  Widget _buildMyListItems(int index, String title, IconData iconData) {
    if(0 == index) {
      return _buildMyHeaderWidget();
    }
    final listItemContent = Container(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.grey,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            title,
          )),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
    return listItemContent;
  }

  Widget _buildMyHeaderWidget() {
    return Container(
      color: Colors.grey,
      height: 200.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                // image: const DecorationImage(image: NetworkImage(""), fit: BoxFit.cover),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            const Text(
              "GDG 淘气小猫 GDG",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
