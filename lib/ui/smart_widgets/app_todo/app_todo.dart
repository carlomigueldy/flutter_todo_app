import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'app_todo_viewmodel.dart';

class AppTodoView extends StatelessWidget {
  final String title;

  AppTodoView({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppTodoViewModel>.nonReactive(
      viewModelBuilder: () => AppTodoViewModel(),
      builder: (
        BuildContext context,
        AppTodoViewModel model,
        Widget child,
      ) {
        return GestureDetector(
          onTap: () => print("${title} on tap"),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: categoryCardBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) => print(value),
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
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
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.blueGrey[50],
      //     blurRadius: 5.0,
      //     spreadRadius: 0.25,
      //     offset: Offset(0, 2.25),
      //   ),
      //   BoxShadow(
      //     color: Colors.blueGrey[50],
      //     blurRadius: 3.0,
      //     spreadRadius: 0.25,
      //     offset: Offset(2, 2.25),
      //   ),
      // ],
    );
  }
}
