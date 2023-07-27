import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MYButton({super.key,
    required this.title,
    this.color = Colors.grey,
     required this.onPress,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 50,
            decoration:

            BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black
              )
            ),

            child: Center(
                child: Text(
              title,
              style: TextStyle(fontSize: 25),
            )

            )

            ,
          ),

        ),
      ),
    );
  }
}
