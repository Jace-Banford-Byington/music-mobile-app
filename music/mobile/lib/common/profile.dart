import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget{
  bool? isChecked;


  Profile({super.key, required this.isChecked});

  @override
  _ProfileState createState() => _ProfileState();
}

void goGet() async {
var url = Uri.https('api.kanye.rest');
var response = await http.get(url);
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('example.com', 'foobar.txt')));}


class _ProfileState extends State<Profile>{
  bool? _isChecked = false;

@override
  Widget build(BuildContext context){
    _isChecked = widget.isChecked;
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(
            onPressed: () => {Navigator.pop(context)},
          )
        ],
      ),
      body: Checkbox(
        value: _isChecked,
        onChanged: (bool? newCheckValue){
          setState(() {
            _isChecked = newCheckValue;
          });
        },
        ),
    );
  }
}
