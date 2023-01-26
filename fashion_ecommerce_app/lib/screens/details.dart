import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../model/base_model.dart';
import '../utils/constants.dart';
import '../widget/add_to_cart.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseable_button.dart';

class Details extends StatefulWidget {
  const Details({
    required this.data,
    super.key,
    required this.isCameFromMostPopularPart,
  });

  final BaseModel data;
  final bool isCameFromMostPopularPart;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    BaseModel current = widget.data;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Top Image
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: widget.isCameFromMostPopularPart
                        ? current.imageUrl
                        : current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(current.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradient),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// info
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style: textTheme.headline3?.copyWith(fontSize: 22),
                          ),
                          ReuseableText(
                            price: current.price,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(current.star.toString(),
                              style: textTheme.headline5),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("(${current.review.toString()}K+ review)",
                              style: textTheme.headline5
                                  ?.copyWith(color: Colors.grey)),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// Select size
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Select Size",
                  style: textTheme.headline3,
                ),
              ),
            ),

            ///Sizes
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: SizedBox(
                // color: Colors.red,
                width: size.width * 0.9,
                height: size.height * 0.08,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (ctx, index) {
                      var current = sizes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AnimatedContainer(
                            width: size.width * 0.12,
                            decoration: BoxDecoration(
                              color: selectedSize == index
                                  ? primaryColor
                                  : Colors.transparent,
                              border: Border.all(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            duration: const Duration(milliseconds: 200),
                            child: Center(
                              child: Text(
                                current,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: selectedSize == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            /// Select Color
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Select Color",
                  style: textTheme.headline3,
                ),
              ),
            ),

            ///Colors
            FadeInUp(
              delay: const Duration(milliseconds: 700),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (ctx, index) {
                      var current = colors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AnimatedContainer(
                            width: size.width * 0.12,
                            decoration: BoxDecoration(
                              color: current,
                              border: Border.all(
                                  color: selectedColor == index
                                      ? primaryColor
                                      : Colors.transparent,
                                  width: selectedColor == index ? 2 : 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            duration: const Duration(milliseconds: 200),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            /// Add To Cart Button
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: ReuseableButton(
                  text: "Add to cart",
                  onTap: () {
                    AddToCart.addToCart(current, context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
