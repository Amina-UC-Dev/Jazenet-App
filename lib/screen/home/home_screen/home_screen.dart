import 'package:flutter/material.dart';
import 'package:jazenet_app/const/colors.dart';
import 'package:jazenet_app/const/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dubai"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/search.png",
              color: Colours().white,
              height: 20,
            ),
            padding: EdgeInsets.zero,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 65,
            color: Colours().g2,
            child: ListView.builder(
                itemCount: 26,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 3
                              ? Colours().black
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          "a",
                          style: Styles().normalS(
                              fontW: index == 3
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                              fontS: 16,
                              color:
                                  index == 3 ? Colours().white : Colours().g5),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 25),
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colours().g3,
                    ),
                  );
                },
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "a",
                                  style: Styles().normalS(
                                      fontW: FontWeight.w500,
                                      fontS: 16,
                                      color: Colours().black),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(),
                              ),
                        Row(
                          children: [
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colours().g3, width: .5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Image.network(
                                    "https://s3.ap-south-1.amazonaws.com/image.directory.beonchat/beonchat/company/1502/logo/logo_1502_1658481299180.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Carrefour",
                                  style: Styles().normalS(
                                      fontW: FontWeight.w700,
                                      fontS: 16,
                                      color: Colours().black),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text("Supermarket",
                                    style: Styles().normalS(
                                        fontW: FontWeight.w500,
                                        fontS: 12,
                                        color: Colours().g4)),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text("Jumeirah Lake Towers, Cluster C",
                                    style: Styles().normalS(
                                        fontW: FontWeight.w300,
                                        fontS: 12,
                                        color: Colours().g4)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
