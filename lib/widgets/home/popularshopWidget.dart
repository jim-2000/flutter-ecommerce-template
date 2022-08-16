import 'package:app/provider/dark_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class PopularShopWidget extends StatelessWidget {
  const PopularShopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkTheemProvider>(context);

    List<Widget> rates(int length) {
      return List.generate(length, (i) => Icon(Icons.star));
    }

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: themeState.getDark ? Colors.black : Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 85,
                  height: 80,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/cat/fruits.png"),
                    fit: BoxFit.fill,
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vegitable ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Fresh vegitable",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: const [
                        // we can genaret hare icon list

                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 10,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "(1)",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.deepOrange,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
