import 'package:flutter/material.dart';
import 'package:interactive_gallery/pages/image_gallery_item_page.dart';
import 'package:interactive_gallery/utils/images.dart';
import 'package:interactive_gallery/utils/routes.dart';
import 'package:interactive_gallery/widgets/image_gallery_item.dart';
import 'package:interactive_gallery/widgets/distorted_interactive_grid.dart';

class ImageGalleryPage extends StatelessWidget {
  const ImageGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: DistortedInteractiveGrid(
        children: List.generate(
          gifs.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                createFadeInRoute(
                  routePageBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    _,
                  ) {
                    return ImageGalleryItemPage(
                      images: gifs,
                      initialIndex: index,
                    );
                  },
                ),
              );
            },
            child: ImageGalleryItem(
              heroTag: '__hero_${index}__',
              imagePath: gifs[index],
            ),
          ),
        ),
      ),
    );
  }
}
