import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/feauture/setting_provider.dart';

class layout_view extends StatefulWidget {
  static const String routName = "layout_view";

  const layout_view({super.key});

  @override
  State<layout_view> createState() => _layout_viewState();
}

class _layout_viewState extends State<layout_view> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<setting_provider>(context);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      body: vm.screens[vm.currentIndex],
      // depending on index
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: vm.currentIndex,
          onTap: vm.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "add"),
          ],
        ),
      ),
    );
  }
}
