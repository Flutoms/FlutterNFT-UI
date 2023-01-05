import 'dart:async';

import 'package:flutter/material.dart';

import '../detail_nft_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({Key? key, required this.startIndex, this.duration = 30})
      : super(key: key);

  final int startIndex;
  final int duration;

  @override
  ImageListViewState createState() => ImageListViewState();
}

class ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // Detect if scroll is at end of list
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _autoScroll());
  }

  _autoScroll() {
    final currentScrollPosition = _scrollController.offset;

    final scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
        currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ImageTile(
              image: 'assets/nfts/${widget.startIndex + index}.png');
        },
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({Key? key, required this.image, this.isClickable = false})
      : super(key: key);

  final String image;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NFTScreen(image: image)),
          );
        }
      },
      child: Hero(
        tag: image,
        child: Image.asset(image, width: 130),
      ),
    );
  }
}
