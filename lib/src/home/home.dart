import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/home/view/available_times.dart';
import 'package:liberbox_mobile/src/home/view/registered_appointments.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Column(
          children: [
            Text(
              'liberbox',
              style: TextStyle(color: Colors.white),
            ),
            /*
            Uncomment the following lines to add an image below the text.
            Image.asset(
              'assets/your_image.png', // Replace with your image path
              height: 50.0, // Adjust the size as needed
            ),
            */
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.event, color: Colors.white), // Ícone branco
              child: Text('Liberbox', style: TextStyle(color: Colors.white)),
            ),
            Tab(
              icon: Icon(Icons.schedule, color: Colors.white), // Ícone branco
              child: Text('Liberbox', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RegisteredAppointments(),
          AvailableTimes(),
        ],
      ),
    );
  }
}
