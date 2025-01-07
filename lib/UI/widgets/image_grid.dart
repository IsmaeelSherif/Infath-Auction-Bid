
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infath_admin/provider/admin_provider.dart';

class ImageGridView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final l = AdminProvider.listen(context, (p) => p.imageNotifier);

    final appProvider = AdminProvider.get(context);
    final imageUrls = appProvider.imageUrls;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust the number of columns as needed
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return Stack(
          key: ValueKey(imageUrls[index]),
          fit: StackFit.expand,
          children: [
            Image.file(
              File(imageUrls[index]),
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: (){
                  appProvider.removeImage(index);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}