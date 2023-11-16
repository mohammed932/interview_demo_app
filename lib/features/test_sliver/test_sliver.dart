import 'package:flutter/material.dart';

import 'widgets/circular_button.dart';
import 'widgets/section_widget.dart';

class TestSliver extends StatefulWidget {
  const TestSliver({super.key});

  @override
  State<TestSliver> createState() => _TestSliverState();
}

class _TestSliverState extends State<TestSliver> {
  bool isMinimize = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            double currentOffset = scrollNotification.metrics.pixels;
            setState(() {
              isMinimize = currentOffset >= 140.0;
            });
          }
          return false;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              collapsedHeight: 150.0,
              title: const Text("Value"),
              pinned: true,
              floating: true,
              centerTitle: true,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: Visibility(
                    visible: isMinimize,
                    replacement: Container(),
                    child: AnimatedOpacity(
                      opacity: !isMinimize ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total Flip balance",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text("EGP 20,000",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircularButton(
                                  title: "Add money",
                                  heroTag: "1",
                                ),
                                CircularButton(
                                  title: "Send Flip",
                                  heroTag: "2",
                                ),
                                CircularButton(
                                  title: "Cash Out",
                                  heroTag: "3",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: Visibility(
                  visible: !isMinimize,
                  replacement: Container(),
                  child: AnimatedOpacity(
                    opacity: isMinimize ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.only(top: 100.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Total Flip balance",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                          Text("EGP 20,000",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularButton(
                                title: "Add money",
                                heroTag: "1",
                              ),
                              CircularButton(
                                title: "Send Flip",
                                heroTag: "2",
                              ),
                              CircularButton(
                                title: "Cash Out",
                                heroTag: "3",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const SectionWidget(); // Replace with your section widget
                },
                childCount: 5, // Replace with the number of sections you need
              ),
            ),
          ],
        ),
      ),
    );
  }
}
