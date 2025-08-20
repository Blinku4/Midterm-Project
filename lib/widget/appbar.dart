import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading:
    Container(
      margin: const EdgeInsets.all(12),
        child: Image.asset('assets/net.png', fit: BoxFit.cover,)
    ),

      actions: [

        Icon(Icons.search_rounded),
        SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: GestureDetector(
            child: RotatingAvatar(

              image: AssetImage('assets/netflix_avatar.png')
                ,onTap: () => Scaffold.of(context).openEndDrawer()
            ),

          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class RotatingAvatar extends StatefulWidget {
  final ImageProvider image;
  final VoidCallback? onTap;

  const RotatingAvatar({super.key, required this.image, this.onTap});

  @override
  State<RotatingAvatar> createState() => _RotatingAvatarState();
}

class _RotatingAvatarState extends State<RotatingAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward(from: 0); // spin 360°
    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: widget.image,
        ),
      ),
    );
  }
}
