import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  final String image;
  final String label;
  final Color color;
  final VoidCallback onTap;

  BottomButton(this.image, this.label, this.color, this.onTap);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: InkWell(
        onTap: () async {
          print("tap");
          _changeColor(Color.fromRGBO(41, 102, 249, 1.0));
          widget.onTap();
          _changeColor(widget.color);
          print("end tap");
        },
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ImageIcon(
              new AssetImage(widget.image),
              size: 32.0,
              color: _color,
            ),
            Text(
              widget.label,
              style: TextStyle(color: _color, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  _changeColor(Color color) {
    setState(() {
      _color = color;
    });
  }
}
