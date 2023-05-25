import 'package:flutter/material.dart';
import 'package:flutter_uidesign/helper/fontSize/appfontSize.dart';
import 'package:flutter_uidesign/resource/colors.dart';
import 'package:flutter_uidesign/widgets/tabbarView.dart';

import '../../widgets/customePrjectCard.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.bodyBackground,
      appBar: AppBar(
        actions: [popMenuItem()],
        title: Text(
          "Projects",
          style: TextStyle(
            fontSize: AppDynamic.dynamicSize(context, Col.appbarHeaderTextSize),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppDynamic.dynamicSize(context, Col.standardSpace),
          ),
          const MyTabBarView(),
          SizedBox(
            height: AppDynamic.dynamicSize(context, Col.standardSpace),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Col.ksidePadding),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CustomProjectCard(
                    index: index,
                    title: index == 0
                        ? "App Project"
                        : index == 1
                            ? "Dashboard Ui"
                            : index == 2
                                ? "App UX Planning"
                                : "Mobile App Design",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<int> popMenuItem() {
    return PopupMenuButton<int>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<int>>[
          const PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: [],
            ),
          ),
        ];
      },
      onSelected: (int value) {
        if (value == 1) {
        } else if (value == 2) {}
      },
    );
  }
}
