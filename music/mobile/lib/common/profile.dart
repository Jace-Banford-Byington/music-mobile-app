import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final bool isChecked;

  const Profile({Key? key, required this.isChecked}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue!;
        });
      },
    );
  }
}
