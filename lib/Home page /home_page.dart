import 'package:flutter/material.dart';

import 'coffee_components.dart';
import 'coffee_types.dart';
import 'details_page.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List coffee = [
    ['Cappucino',false],
    ['Latte',false],
    ['Black Coffee',false],
    ['Tea',false],
    ['Coffee With Milk',false],
  ];
  void selectedCoffee(int index){
    for(int i=0;i<coffee.length ; i++){
      coffee[i][1] =false;
    }
    setState(() {
      coffee[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return (
       SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          drawer: const Drawer(),
          appBar: AppBar(
            actions:const [
               Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.person),
              )
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: Colors.orange,),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: ""),
            ],
          ),
          body:Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("Find The Best Coffee For You",style:TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Find your coffee..",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade600
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade500
                        )
                    )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffee.length,
                    itemBuilder: (context,index){
                      return CoffeeType(
                        op: false,
                        onTap: (){
                          selectedCoffee(index);
                        },
                        isSelected: coffee[index][1],
                        name: coffee[index][0],
                      );
                    }),
              )
              ,Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoffeeComponents(
                      additional: "With Almond milk",
                      coffeeName: "Latte",
                      imagePath: "images/coffee1.jpg",
                      price: "4.32",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(imageUrl:"images/coffee1.jpg",price:"4.32",)));
                      },
                    ),
                    CoffeeComponents(
                      additional: "With Sugar",
                      coffeeName: "Black Coffee",
                      imagePath: "images/coffee2.jpg",
                      price: "5.32",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(imageUrl:"images/coffee2.jpg",price:"5.32",)));
                      },
                    ),
                    CoffeeComponents(
                      additional: "Wit Caramel",
                      coffeeName: "Cappucino",
                      imagePath: "images/coffee3.jpg",
                      price: "7.32",
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(imageUrl:"images/coffee3.jpg",price:"7.32",)));
                      },
                    ),
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