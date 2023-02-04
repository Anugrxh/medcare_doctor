import 'package:flutter/material.dart';
import 'package:medcare_doctor/ui/screen/patient_screen.dart';
import 'package:medcare_doctor/ui/screen/schuedule_screen.dart';
import 'package:medcare_doctor/ui/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: currentIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text( currentIndex == 0 ? "Schedule" : 'Patients'),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            SchueduleScreen(),
            PatientScreen(),
          ],
        ),
      ),
      drawer: CustomDrawer(
        onChanged: (int index) {
          currentIndex = index;
          _tabController!.animateTo(currentIndex);
          setState(() {
            
          });
        },
      ),
    );
  }
}
