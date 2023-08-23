import 'package:coffe_templet/Home%20page%20/coffee_types.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String imageUrl;

  String price;

  DetailsPage({
    required this.price,
    required this.imageUrl,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DetailsPageState();
  bool isFavorite = true;
}

class _DetailsPageState extends State<DetailsPage> {
  List size = [
    ["S",false],
    ["M",false],
    ["L",false],
  ];
  void selectedItem (int index){
    for(int i=0;i<size.length;i++){
      setState(() {
        size[i][1] = false;
      });
    }
    setState(() {
      size[index][1] = true;
    });
  }
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[890],
        body: Column(
          children: [
            Container(
              width: width,
              height: height / 2.5,
              margin: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Capuucino",
                                  style: TextStyle(fontSize: 35),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                const Text(
                                  "With Almond Milk",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white54),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star_outlined,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "4.3",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 35, top: 15),
                              child: Column(
                                children: [
                                  (widget.isFavorite)
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.isFavorite =
                                                  !widget.isFavorite;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 45,
                                          ))
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.isFavorite =
                                                  !widget.isFavorite;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.favorite_border,
                                            size: 45,
                                          )),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const Text(
                                    "Add To Favorite",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white54,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "A prefect Cappucino From High Quality coffee Beans And Fresh Almond Milk",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: double.infinity,
                    //color: Colors.white,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Size : ",style: TextStyle(fontSize: 20),),
                        ListView.builder(
                          itemCount: size.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,i){
                            return Padding(
                              padding: const EdgeInsets.only(left: 25,right: 25),
                              child: CoffeeType(
                                op: true,
                                  name: size[i][0],
                                  onTap: (){
                                    selectedItem(i);
                                  },
                                  isSelected: size[i][1]),
                            );
                          },
                        ),
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:const  EdgeInsets.only(bottom: 6),
                          child: Text('\$ ${widget.price}',style: const TextStyle(
                            fontSize: 20,
                          ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 80,
                              decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.white),
                                    top: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white),
                                    bottom: BorderSide(color: Colors.white),
                                  )),
                              child: Center(
                                child: Text(
                                  '$count',
                                  style: const TextStyle(
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 35,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (count != 0) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("TOTAL : ${(double.parse(widget.price)*count).toStringAsFixed(2)} \$",style: const TextStyle(
                              fontSize: 25,
                            ),),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.all(9)
                              ),
                              onPressed: (){

                            }, child: const Text("Check Out",style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70
                            ),))
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
