import 'package:drawer/pages/images_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const HomeScreen());
  }
}

void _show(BuildContext context) {
  showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
            height: 200,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.credit_card_outlined),
                  title: Text('Сумма'),
                  trailing: Text('200 руб'),
                ),
                ElevatedButton(
                    onPressed: null,
                    child: Text('Дать ему 200 рублей',
                        style: TextStyle(color: Colors.black)))
              ],
            ),
          ));
}

class TabItems {
  String title;
  Icon icon;

  TabItems(this.icon, this.title);
}

List<TabItems> _list = [
  TabItems(const Icon(Icons.home), "Photo"),
  TabItems(const Icon(Icons.chat), "Chat"),
  TabItems(const Icon(Icons.album), "Albums")
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabBarViewController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabBarViewController = TabController(length: _list.length, vsync: this);
    tabBarViewController.addListener(() {
      setState(() {
        currentIndex = tabBarViewController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Домашнее задание'),
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/Islam.jpg'),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      trailing: Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text('Images'),
                      trailing: const Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ImagesPage();
                          }),
                        );
                      },
                    ),
                    const ListTile(
                      leading: Icon(Icons.file_copy),
                      title: Text('Files'),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Выход',
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Регистрация',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ],
            )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Islam.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Исламбек')
          ],
        ),
      ),
      body: TabBarView(
        controller: tabBarViewController,
        children: const [
          Center(
            child: Text('Page 1'),
          ),
          Center(
            child: Text('Page 2'),
          ),
          Center(
            child: Text('Page 3'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _show(context)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            tabBarViewController.index = index;
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          for (final item in _list)
            BottomNavigationBarItem(icon: item.icon, label: item.title)
        ],
      ),
    );
  }
}
