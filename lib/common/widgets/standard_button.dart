
import 'package:flutter/material.dart';

class StanderButton extends StatelessWidget {
  final String text;
  final bool autofocus;
  final Function()? functionOnPress;
  const StanderButton({
    super.key, required this.text, this.functionOnPress,  this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: false,
      onPressed: functionOnPress,
      onLongPress: () {
     
      },
      style: ButtonStyle(
        side: WidgetStateProperty.all(
            const BorderSide(color: Colors.transparent, width: 2)),
            backgroundColor:   WidgetStatePropertyAll<Color>(Colors.blue.withOpacity(.1)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 40,
            child: Center(
                child: 
                  Text(text, overflow: TextOverflow.fade,maxLines: 2,style: const TextStyle(color: Colors.blue),
                
    
            ))),
      ),
    );
  }
}