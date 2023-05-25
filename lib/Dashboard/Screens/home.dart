import 'package:flutter/material.dart';
import 'package:flutter_uidesign/helper/fontSize/appfontSize.dart';
import 'package:flutter_uidesign/resource/colors.dart';
import 'package:flutter_uidesign/widgets/customHomeCard.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.bodyBackground,
      appBar: AppBar(
        actions: [
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(Icons.menu),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          "Home",
          style: TextStyle(
              fontSize:
                  AppDynamic.dynamicSize(context, Col.appbarHeaderTextSize),
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Col.ksidePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Col.standardSpace,
              ),
              Text(
                "Today",
                style: TextStyle(
                    fontSize: AppDynamic.dynamicSize(context, Col.heading),
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Col.primaryColor,
                    size: AppDynamic.dynamicSize(context, 15),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "Apr 26, 2022",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 10, wordSpacing: 1),
                  )
                ],
              ),
              const SizedBox(
                height: Col.standardSpace,
              ),
              statusCards(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Task",
                    style: TextStyle(
                        fontSize: AppDynamic.dynamicSize(
                          context,
                          Col.appbarHeaderTextSize,
                        ),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "All Tasks",
                    style: TextStyle(
                      fontSize: AppDynamic.dynamicSize(
                        context,
                        10,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Col.standardSpace,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: Col.standardsmallSpace),
                itemBuilder: (BuildContext context, int index) {
                  return CustomHomeCard(
                    index: index,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox statusCards(BuildContext context) {
    return SizedBox(
      height: AppDynamic.dynamicSize(context, 170),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in each row
          childAspectRatio: 1.7, // Width to height ratio of each item
        ),
        itemCount: 4, // Total number of items
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.all(8.0), // Margin around each container
              decoration: BoxDecoration(
                color: index == 0
                    ? Col.ongoing
                    : index == 1
                        ? Col.inprogress
                        : index == 2
                            ? Col.completed
                            : Col.cancel, // Container background color
                borderRadius:
                    BorderRadius.circular(8.0), // Rounded corner radius
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      height: AppDynamic.dynamicSize(context, 20),
                      image: AssetImage(
                        index == 0
                            ? "assets/images/ongoing.png"
                            : index == 1
                                ? "assets/images/inprogress.png"
                                : index == 2
                                    ? "assets/images/completed.png"
                                    : "assets/images/cancel.png",
                      )),
                  const SizedBox(
                    height: Col.standardSpace,
                  ),
                  Text(
                    index == 0
                        ? "Ongoing"
                        : index == 1
                            ? "In Progress"
                            : index == 2
                                ? "Completed"
                                : "Cancel",
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ));
        },
      ),
    );
  }
}
