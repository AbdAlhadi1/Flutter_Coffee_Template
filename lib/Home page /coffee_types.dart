import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget{
  final String name;
  final bool isSelected;
  var onTap;
  bool op ;
  CoffeeType({
   required this.name,
   required this.onTap,
   required this.isSelected,
   required this.op ,
   super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: InkWell(
        onTap: onTap,
        child: Text(name,style: TextStyle(
          fontSize:(op == true)?(isSelected) ? 32 : 28 : (isSelected) ? 20 : 16,
          color: (isSelected)? Colors.orange : Colors.white60,
        ),),
      ),
    );
  }

}