import 'package:flutter/material.dart';

void main()  =>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context){
  const String appTitle = "Music App";
  return MaterialApp(
    title: appTitle,
    home: 
      Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                  ButtonSection(),
              ],
            ),
          ),
      ),
  );
}



}


class HistoryTitle extends StatelessWidget {
  const HistoryTitle({
    super.key,
    required this.label,
    required this.image
    });

  final String label;
  final Image image;


@override
  Widget build(BuildContext context){
    return 
  }
}


class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context){
    final Color color = Theme.of(context).primaryColorDark;
        return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.home,
            label: 'Home',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.search,
            label: 'Search',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.library_music,
            label: 'Library',
          ),
        ],
      ),
    );



  }
}

class ButtonWithText extends StatelessWidget{
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

