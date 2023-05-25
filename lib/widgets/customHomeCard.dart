import 'package:flutter/material.dart';
import 'package:flutter_uidesign/helper/fontSize/appfontSize.dart';
import 'package:flutter_uidesign/resource/colors.dart';
import 'package:flutter_uidesign/widgets/linearprogressIndicator.dart';

class CustomHomeCard extends StatelessWidget {
  final index;
  const CustomHomeCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 10), //
        leading: Theme(
          data: ThemeData(
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Col.inprogress; // Color when checkbox is checked
                }
                return Colors
                    .grey.shade300; // Default color when checkbox is unchecked
              }),
            ),
          ),
          child: Checkbox(
            value: index == 2 ? false : true,
            onChanged: (value) {
              // Checkbox onChanged callback
            },
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: Col.standardSpace,
            ),
            Text(
              index == 1
                  ? "Mobile App Design"
                  : index == 2
                      ? "Wireframe Design"
                      : "Dashboard Design",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: index == 2 ? Col.grey : Col.black,
                decoration: index == 2
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: AppDynamic.dynamicSize(context, 11),
              ),
            ),
            Stack(
              children: [
                Stack(
                  children: List.generate(
                    4,
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
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade300,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        subtitle: Column(
          children: [
            const SizedBox(
              height: Col.standardSpace,
            ),
            AnimatedLinearProgressIndicator(
              color: index == 0
                  ? Col.ongoing
                  : index == 1
                      ? Col.inprogress
                      : index == 2
                          ? Col.completed
                          : Col.cancel,
              value: 0.8, // Specify the progress value between 0 and 1
              duration: const Duration(seconds: 2),
            ),
            const SizedBox(
              height: Col.standardSpace,
            ),
          ],
        ),
        onTap: () {
          // ListTile onTap callback
        },
      ),
    );
  }
}
