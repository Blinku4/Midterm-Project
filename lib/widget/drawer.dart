import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool showSidebar = true;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top+3;

    return Stack(
      children: [

          Positioned(
            top: topPadding + kToolbarHeight, // 👈 start under the AppBar
            right: 0,
            bottom: 0,
            width: 200,
            child: Material(
              elevation: 5,
              color: Colors.black54,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text("Hello User", style: TextStyle(fontSize: 20)),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Profile"),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(Icons.close),
                      title: const Text("Close"),
                      onTap: Scaffold.of(context).closeEndDrawer,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );


  }
}
