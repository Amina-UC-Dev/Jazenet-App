import 'package:flutter/material.dart';
import 'package:jazenet_app/const/colors.dart';
import 'package:jazenet_app/const/styles.dart';
import 'package:jazenet_app/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return provider.contactList != null
              ? Column(
                  children: [
                    Container(
                      height: 65,
                      color: Colours().g2,
                      child: ListView.builder(
                          itemCount: provider.alphabets.length,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  provider.setOrder(
                                      provider.alphabets[index].toLowerCase());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: provider.selAlphabet ==
                                              provider.alphabets[index]
                                                  .toLowerCase()
                                          ? Colours().black
                                          : Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      provider.alphabets[index].toLowerCase(),
                                      style: Styles().normalS(
                                          fontW: provider.selAlphabet ==
                                                  provider.alphabets[index]
                                                      .toLowerCase()
                                              ? FontWeight.w500
                                              : FontWeight.normal,
                                          fontS: 16,
                                          color: provider.selAlphabet ==
                                                  provider.alphabets[index]
                                                      .toLowerCase()
                                              ? Colours().white
                                              : Colours().g5),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    provider.contactList != null &&
                            provider.contactList!.result.jazenetContactList !=
                                null &&
                            provider.contactList!.result.jazenetContactList
                                .compResults.isNotEmpty
                        ? Expanded(
                            child: ScrollablePositionedList.separated(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 15),
                                    child: Divider(
                                      color: Colours().g4,
                                    ),
                                  );
                                },
                                itemScrollController:
                                    provider.itemScrollController,
                                itemPositionsListener:
                                    provider.itemPositionsListener,
                                shrinkWrap: true,
                                itemCount: provider.contactList!.result
                                    .jazenetContactList.compResults.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 30,
                                            child: index == 0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(
                                                      "a",
                                                      style: Styles().normalS(
                                                          fontW:
                                                              FontWeight.w500,
                                                          fontS: 16,
                                                          color:
                                                              Colours().black),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Container(),
                                                  ),
                                          ),
                                          Row(
                                            children: [
                                              Card(
                                                elevation: 1,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colours().g3,
                                                      width: .5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                    child: Image.network(
                                                      provider
                                                          .contactList!
                                                          .result
                                                          .jazenetContactList
                                                          .compResults[index]
                                                          .logo,
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                width: w - 125,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      provider
                                                          .contactList!
                                                          .result
                                                          .jazenetContactList
                                                          .compResults[index]
                                                          .name,
                                                      style: Styles().normalS(
                                                          fontW:
                                                              FontWeight.w700,
                                                          fontS: 16,
                                                          color:
                                                              Colours().black),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                        provider
                                                            .contactList!
                                                            .result
                                                            .jazenetContactList
                                                            .compResults[index]
                                                            .category,
                                                        style: Styles().normalS(
                                                            fontW:
                                                                FontWeight.w500,
                                                            fontS: 12,
                                                            color:
                                                                Colours().g4)),
                                                    const SizedBox(
                                                      height: 1,
                                                    ),
                                                    Text(
                                                        provider
                                                            .contactList!
                                                            .result
                                                            .jazenetContactList
                                                            .compResults[index]
                                                            .location,
                                                        style: Styles().normalS(
                                                            fontW:
                                                                FontWeight.w300,
                                                            fontS: 12,
                                                            color:
                                                                Colours().g4)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                          )
                        : const Center(child: Text("No DATA"))
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
