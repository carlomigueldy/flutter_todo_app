import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/smart_widgets/app_todo/app_todo.dart';

import 'home_viewmodel.dart' show HomeViewModel;
import '../../smart_widgets/app_category/app_category.dart'
    show AppCategoryView;

class HomeView extends StatelessWidget {
  final int categoriesCount = 3;

  final List<Map<String, dynamic>> categories = [
    {'title': 'Business', 'tasks': '40 tasks', 'color': Colors.purple},
    {'title': 'Personal', 'tasks': '18 tasks', 'color': Colors.blue[900]},
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              // backgroundColor: Colors.indigoAccent,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => print('aw'),
            ),
            backgroundColor: Colors.grey[100],
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.menu,
                            size: 34,
                            color: Colors.grey[700],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox.shrink(),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.search,
                            size: 34,
                            color: Colors.grey[700],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.notifications_none,
                            size: 34,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  ...categorySection(),
                  SizedBox(
                    height: 25,
                  ),
                  sectionHeader("Today's Tasks"),
                  Container(
                    height: 425,
                    child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) => SizedBox.shrink(),
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 80,
                        child: AppTodoView(
                          title: 'Cool',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> categorySection() {
    return [
      sectionHeader('Categories'),
      Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 0,
          ),
          itemBuilder: (context, index) {
            bool isFirst = index == 0;
            bool isLast = index == (categoriesCount - 1);
            return Container(
              margin: isFirst || isLast
                  ? (isFirst
                      ? const EdgeInsets.only(left: 15)
                      : const EdgeInsets.only(right: 15))
                  : const EdgeInsets.symmetric(horizontal: 15),
              child: AppCategoryView(
                title: categories[index]['title'],
                subtitle: categories[index]['tasks'],
                backgroundColor: categories[index]['color'],
              ),
            );
          },
        ),
      )
    ];
  }

  Container sectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 15),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
          letterSpacing: 1.75,
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        "What's up, Carlo!",
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
