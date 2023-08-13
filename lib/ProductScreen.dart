import 'package:flutter/material.dart';
import 'package:testing/DescriptionScreen.dart';
import 'package:testing/reusable_widget/colors.dart';
import 'package:testing/reusable_widget/text_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String,dynamic>> mainImages=[
    {
      "title":"Marigold",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant1.png"
    },

    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant2.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant3.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant4.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant5.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant6.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant7.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant8.png"

    },
    {
      "title":"Cactus",
      "subtitle":"Angisperms",
      "price":"\$80",
      "images":"images/plant9.png"

    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 16,)),
                    SizedBox(width: 10,
                      height: 20,),
                    text_custome(text: 'Products',color: MyColors.card_light_color1, size: 24, fontWeight: FontWeight.w600)
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 0.8,
                          color: MyColors.card_light_color1
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: MyColors.card_light_color1,
                        )
                    ),
                    hintText: "Search Products",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon:Icon(Icons.clear),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: text_custome(text: 'Catalog', size: 16, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisExtent: 210,
                    ),
                    itemCount: mainImages.length,
                    itemBuilder: (_,index){
                      return Container(
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(),));
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(

                                      image: AssetImage(
                                          '${mainImages.elementAt(index)['images']}'
                                      ),
                                    ),
                                    // color: Colors.black
                                  ),
                                  width: 140,
                                  height: 110,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: text_custome(text: '${mainImages.elementAt(index)['title']}', size: 14, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: text_custome(text: '${mainImages.elementAt(index)['subtitle']}', size: 14, fontWeight: FontWeight.w400),
                            ),

                            Row(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: text_custome(text: '${mainImages.elementAt(index)['price']}', size: 14, fontWeight: FontWeight.w600),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken,color: Colors.red,size:18))
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
