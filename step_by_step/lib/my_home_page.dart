import 'package:flutter/material.dart';
import 'package:step_by_step/steps/basic_overlay/basic_overlay_page.dart';
import 'package:step_by_step/steps/complete_overlay/complete_overlay_page.dart';
import 'package:step_by_step/steps/issue/issue_page.dart';
import 'package:step_by_step/steps/overlay_only/overlay_only_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: TabBar(
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade300,
              labelColor: Colors.white,
              controller: tabController,
              onTap: (value) => tabController.animateTo(value),
              tabs: const [
                Tab(
                  text: 'Issue',
                ),
                Tab(
                  text: 'Overlay',
                ),
                Tab(
                  text: 'Basic',
                ),
                Tab(
                  text: 'Complete',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                const IssuePage(),
                OverlayOnlyPage(),
                BasicOverlayPage(),
                CompleteOverlayPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
