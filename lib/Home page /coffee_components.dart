import 'package:flutter/material.dart';

class CoffeeComponents extends StatelessWidget{
  final String imagePath;
  final String price;
  final String additional;
  final String coffeeName;
  var onTap;
    CoffeeComponents({
    required this.price,
    required this.coffeeName,
    required this.imagePath,
    required this.additional,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return(
        Padding(
          padding: const EdgeInsets.only(left:8),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:Image(image: AssetImage(imagePath),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coffeeName,style: const TextStyle(
                        fontSize: 20,
                      ),),
                      const SizedBox(height: 6,),
                      Text(additional,style: TextStyle(
                        color: Colors.grey.shade600
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ $price'),
                       Container(
                         padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange
                          ),
                          child: InkWell(
                            onTap: onTap,
                            child:const Icon(Icons.add,size: 25,),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}