import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LatestArrivalProductsWidget extends StatefulWidget {
  const LatestArrivalProductsWidget({Key? key});

  @override
  State<LatestArrivalProductsWidget> createState() => _LatestArrivalProductsWidgetState();
}

class _LatestArrivalProductsWidgetState extends State<LatestArrivalProductsWidget> {
  @override
  Widget build(BuildContext context) {
    final image = "assets/images/login.jpg";
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * 0.55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: size.width * 0.3, // Adjusted width for the image
                height: size.width * 0.3, // Adjusted height for the image
                child: FancyShimmerImage(
                  imageUrl: "", // Add your image URL here
                  errorWidget: Image.asset("assets/images/flower.jpeg"),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded( // Replace Flexible with Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 18,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.cabin,
                        //     size: 18,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      "188",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}