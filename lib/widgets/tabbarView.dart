import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:flutter_uidesign/helper/fontSize/appfontSize.dart';
import 'package:flutter_uidesign/resource/colors.dart';

enum Segment {
  all,
  starred,
}

extension SegmentsExtension on Segment {
  String get label {
    switch (this) {
      case Segment.all:
        return 'All Files';
      case Segment.starred:
        return 'Starred Files';
      default:
        return 'Unrecognized';
    }
  }

  bool get isAll => this == Segment.all;

  bool get isStarred => this == Segment.starred;
}

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({super.key});

  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  final _selectedSegment_00 = ValueNotifier('all');

  @override
  void initState() {
    super.initState();
    _selectedSegment_00.value = 'All'; // Select the "All" tab by default
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: AppDynamic.dynamicSize(context, Col.ksidePadding),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdvancedSegment(
                  itemPadding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  activeStyle: TextStyle(
                      color: Col.primaryColor,
                      fontSize: AppDynamic.dynamicSize(context, 10)),
                  inactiveStyle:
                      TextStyle(fontSize: AppDynamic.dynamicSize(context, 10)),
                  backgroundColor: Colors.grey.withOpacity(.14),
                  segments: const {
                    'Ongoing': 'Ongoing',
                    'All': 'All',
                    'Completed': 'Completed',
                  },
                  controller: _selectedSegment_00,
                ),
              ],
            )),
      ],
    );
  }
}
