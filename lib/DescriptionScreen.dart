import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/reusable_widget/colors.dart';
import 'package:testing/reusable_widget/text_widget.dart';

class DescriptionScreen extends StatefulWidget {

  // String image;
  // String name;
  // String price;
  // String quantity;
  // String description;
  // String growth;
  // String category;
  //
  //
  // DescriptionScreen(
  //     {this.image,
  //     this.name,
  //     this.price,
  //     this.quantity,
  //     this.description,
  //     this.growth,
  //     this.category});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  var fav_product=false;
  int count = 0;
  var price=40;
  var plant_name="'Do Cacti & Succulents'";
  var plant_img="images/plant1.jpg";
  var plant_category="In Door Plant";
  var plant_growth=" it takes most roses 3-4 years to reach their mature size and maximum bloom production";
  var plant_description="A plant is a living thing that grows in the earth and has a stem, leaves, and roots. Water each plant as often as required. ... exotic plants. Synonyms: flower, bush, vegetable, herb More Synonyms of plant.";
  void increment() {
    count++;
    setState(() {});
  }

  void decrement() {
    count--;
    setState(() {});
  }

  var _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: MyColors.background_color.withOpacity(0.4),
                        image: DecorationImage(
                            image: AssetImage('${plant_img}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left:5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(onTap: (){
                        setState(() {
                          fav_product=!fav_product;
                        });
                        print(fav_product);
                      },
                        child: Icon(
                         fav_product?  FontAwesomeIcons.gratipay:FontAwesomeIcons.heart,
                          size: 20,
                          color: Colors.red,
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_custome(
                            text: '${plant_name}',
                            size: 24.0,
                            fontWeight: FontWeight.w600),
                        text_custome(

                            text: '${plant_category}',
                            size: 16.0,
                            fontWeight: FontWeight.w400),
                        SizedBox(
                          height: 20,
                        ),
                        text_custome(text: 'Description', size: 16.0, fontWeight: FontWeight.w600),
                        SizedBox(height: 5,),
                        text_custome(
                            text:'${plant_description}',
                                size: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400)
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    text_custome(text: 'Price : \$${price}', size: 18, fontWeight: FontWeight.w600),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        text_custome(
                            text: "Quantity :", size: 14, fontWeight: FontWeight.w600),
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (count <= 0) {
                                    } else {
                                      decrement();
                                    }
                                  },
                                  icon: Icon(Icons.remove)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 2, bottom: 2),
                                child: Text('${count}'),
                              ),
                              IconButton(
                                  onPressed: () {
                                    increment();
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    text_custome(text: 'Plant Growth: ', size: 16, fontWeight: FontWeight.w600),
                    text_custome(text:'${plant_growth}' , size: 14, fontWeight: FontWeight.w400),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.button_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              )
                            ),
                              onPressed: (){

                              if(count>0)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added")));
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select an item")));
                                }
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                                child: text_custome(text:'Add to Cart',size: 14,fontWeight: FontWeight.w400),
                              ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade200,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                text_custome(text: 'Total Price:', size: 14, fontWeight: FontWeight.w600),
                                text_custome(
                                  text: '\$${price*count}',
                                  fontWeight: FontWeight.w600,
                                  size: 20,

                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
