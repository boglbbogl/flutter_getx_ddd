import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollSecondPage extends StatelessWidget {
  const ScrollSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            print('dsafs');
          },
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Container();
        }))
      ],
    );
  }
}
