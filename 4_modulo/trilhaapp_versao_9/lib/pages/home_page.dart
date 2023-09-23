import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/brasil_fields/brasil_fields_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Meu App',
          style: GoogleFonts.roboto(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          const BrasilFieldsPage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
        items: const [
          TabItem(
            title: 'Home',
            icon: Icons.home,
          ),
          TabItem(
            title: 'Discovery',
            icon: Icons.map,
          ),
          TabItem(
            title: 'Add',
            icon: Icons.add,
          ),
          TabItem(
            title: 'Message',
            icon: Icons.message,
          ),
          TabItem(
            title: 'Brasil',
            icon: Icons.people,
          ),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
