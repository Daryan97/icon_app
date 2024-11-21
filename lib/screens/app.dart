import 'package:flutter/material.dart';
import 'package:icon_app/model/app_icon_data.dart';

class App extends StatefulWidget {
  final AppIconData _iconData;
  const App(this._iconData, {super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            children: [
              const Text(
                'My Icon',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  _circleButton("-"),
                  const SizedBox(width: 8),
                  _circleButton("S"),
                  const SizedBox(width: 8),
                  _circleButton("M"),
                  const SizedBox(width: 8),
                  _circleButton("L"),
                  const SizedBox(width: 8),
                  _circleButton("+")
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
            child: Column(
          children: [
            CheckboxListTile(
              value: widget._iconData.sizChanable,
              title: const Text('Allow Resize?'),
              onChanged: (value) => setState(() {
                widget._iconData.sizChanable = value!;
              }),
            ),
            CheckboxListTile(
              value: widget._iconData.colorChanable,
              title: const Text('Allow change primer colors?'),
              onChanged: (value) => setState(() {
                widget._iconData.colorChanable = value!;
              }),
            ),
          ],
        )),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Icon(
                  Icons.alarm,
                  size: widget._iconData.size.toDouble(),
                  color: Color.fromRGBO(widget._iconData.red,
                      widget._iconData.green, widget._iconData.blue, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _colorSlider(
                      widget._iconData.red,
                      Colors.red,
                      (value) => setState(() {
                            widget._iconData.red = value;
                          })),
                  _colorSlider(
                      widget._iconData.green,
                      Colors.green,
                      (value) => setState(() {
                            widget._iconData.green = value;
                          })),
                  _colorSlider(
                      widget._iconData.blue,
                      Colors.blue,
                      (value) => setState(() {
                            widget._iconData.blue = value;
                          })),
                ],
              ),
            )
          ],
        ));
  }

  Widget _circleButton(String text) {
    if (widget._iconData.sizChanable == false) {
      return const SizedBox();
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (text == "+") {
            if (widget._iconData.size < 500) {
              widget._iconData.size += 50;
            }
          } else if (text == "-") {
            if (widget._iconData.size > 50) {
              widget._iconData.size -= 50;
            }
          } else if (text == "S") {
            widget._iconData.size = 100;
          } else if (text == "M") {
            widget._iconData.size = 300;
          } else if (text == "L") {
            widget._iconData.size = 500;
          }
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _colorSlider(
      int colorValue, Color color, ValueChanged<int> onChanged) {
    if (widget._iconData.colorChanable == false) {
      return const SizedBox();
    }

    return Row(
      children: [
        Expanded(
          child: Slider(
            value: colorValue.toDouble(),
            min: 0,
            max: 255,
            onChanged: (value) => onChanged(value.toInt()),
          ),
        ),
        CircleAvatar(
          backgroundColor: color,
          child: Text(
            colorValue.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
