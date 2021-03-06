import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImageBox extends StatelessWidget {
  const CustomFileImageBox({
    required this.onTap,
    this.title = 'Upload Image',
    this.imageURL = '',
    this.size = 80,
    this.file,
    Key? key,
  }) : super(key: key);
  final XFile? file;
  final String? imageURL;
  final String title;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: size,
              width: size,
              color: Theme.of(context).primaryColor,
              child: (imageURL != null && imageURL != '' && file == null)
                  ? Image.network(imageURL ?? '')
                  : file == null
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              'No\nImage',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.file(
                            File(file!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(title, style: const TextStyle(height: 1)),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
