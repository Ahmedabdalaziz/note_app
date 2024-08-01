import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_search_icon.dart';

class CustomAppbar extends StatefulWidget {
  final String title;
  final IconData? icon;

  const CustomAppbar({super.key, this.title = 'title', this.icon});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const Spacer(),
        CustomSearchIcon(
          icon: widget.icon,
        )
      ],
    );
  }
}
