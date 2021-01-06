import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/theme/colors.dart';
import 'app_category_viewmodel.dart';

class AppCategoryView extends StatelessWidget {
  final String title;

  final String subtitle;

  final Color backgroundColor;

  AppCategoryView({
    @required this.title,
    this.subtitle,
    @required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppCategoryViewModel>.nonReactive(
      viewModelBuilder: () => AppCategoryViewModel(),
      builder: (
        BuildContext context,
        AppCategoryViewModel model,
        Widget child,
      ) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: categoryCardBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text('======================='),
                Container(
                  width: 200,
                  // child: LinearProgressIndicator(
                  //   backgroundColor: Colors.cyan,
                  //   value: 0,
                  //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  //   minHeight: 3,
                  // ),
                  child: LinearPercentIndicator(
                    backgroundColor: backgroundColor,
                    padding: const EdgeInsets.all(0),
                    curve: Curves.ease,
                  ),
                ),
                // LinearProgressIndicator(
                //   minHeight: 50,
                //   value: 10,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration categoryCardBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.blueGrey[50],
          blurRadius: 10.0,
          spreadRadius: 2.25,
          offset: Offset(5, 3.25),
        ),
      ],
    );
  }
}
