import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

class SwipeButton extends StatefulWidget {
  final String text;
  final Function() onTap;

  const SwipeButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  bool result = true;

  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.45,
      buttonWidth: MediaQuery.of(context).size.width * 0.18,
      color: Colors.white,
      buttonColor: Theme.of(context).primaryColor,
      dismissible: false,
      label: Center(
        child: Image.asset(
          'assets/images/others/Group 15.png',
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: result,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff020632),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
      onChanged: (position) {
        widget.onTap;
        setState(() {
          if (position == SlidableButtonPosition.end) {
            result = false;
            widget.onTap();
          } else {
            result = true;
          }
        });
      },
    );
  }
}
