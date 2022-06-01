import 'package:flutter/material.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final List<String> nav = ['Список 1', 'Список 2'];


  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Images Page'),
            bottom: TabBar(
                tabs: data.keys.map((e) => Tab(text: e.toString())).toList())),
        body: TabBarView(
          children: data.keys.map((name) {
            return ListView.builder(
              key: PageStorageKey(name),
              scrollDirection: Axis.vertical,
              itemCount: data[name].length,
              itemBuilder: (BuildContext _, int index) {
                return Container(
                  height: 200,
                  child: Image.network(
                    data[name][index]
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}