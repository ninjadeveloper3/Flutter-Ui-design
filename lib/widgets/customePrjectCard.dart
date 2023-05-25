import 'package:flutter/material.dart';
import 'package:flutter_uidesign/helper/fontSize/appfontSize.dart';
import 'package:flutter_uidesign/resource/colors.dart';
import 'package:flutter_uidesign/widgets/circularProgressIndicator.dart';

class CustomProjectCard extends StatelessWidget {
  final String title;
  final int index;
  const CustomProjectCard(
      {super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Col.ksidePadding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            projectCards(context, title),
            circlarProgressWidget(index),
          ],
        ),
      ),
    );
  }

  Column projectCards(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Col.standardSpace,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Col.black,
            fontSize: AppDynamic.dynamicSize(context, 11),
          ),
        ),
        Text(
          "Digital Product Design",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Col.grey,
            fontSize: AppDynamic.dynamicSize(context, 9),
          ),
        ),
        const SizedBox(
          height: Col.standardSpace,
        ),
        Text(
          "Team",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Col.black,
            fontSize: AppDynamic.dynamicSize(context, 11),
          ),
        ),
        const SizedBox(
          height: Col.standardSpace,
        ),
        Stack(
          children: List.generate(
            5,
            (index) {
              final offset = index * 25.0;

              return Transform.translate(
                offset: Offset(offset, 0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                    color: index == 4 ? Colors.grey : Colors.grey.shade300,
                  ),
                  child: index == 4
                      ? const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: Col.standardSpace,
        ),
        Row(
          children: [
            Icon(
              Icons.date_range_outlined,
              color: Col.grey,
              size: AppDynamic.dynamicSize(context, 15),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "Apr 26, 2022",
              style:
                  TextStyle(color: Colors.grey, fontSize: 10, wordSpacing: 1),
            ),
            const SizedBox(
              width: Col.standardSpace,
            ),
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Col.inprogress; // Color when checkbox is checked
                    }
                    return Colors.grey
                        .shade300; // Default color when checkbox is unchecked
                  }),
                ),
              ),
              child: Checkbox(
                value: true,
                onChanged: (value) {
                  // Checkbox onChanged callback
                },
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "22 Tasks",
              style:
                  TextStyle(color: Colors.grey, fontSize: 10, wordSpacing: 1),
            ),
          ],
        ),
      ],
    );
  }

  Positioned circlarProgressWidget(int index) {
    return Positioned(
      right: 0,
      child: AnimatedCircularProgressIndicator(
        color: Col.primaryColor,
        value: index == 0 ? .8 : index * 12 / 100,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
