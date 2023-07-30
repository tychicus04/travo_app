import 'package:flutter/material.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  static const String routeName = '/hotels_screen.dart';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppBarContainerWidget(
      titleString: 'Hotels',
      implementLeading: true,
      implementBar: true,
      child: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}