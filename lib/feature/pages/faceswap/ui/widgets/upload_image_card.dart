import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/constants/app_styles.dart';

class UploadImageCard extends StatelessWidget {
  const UploadImageCard({super.key, this.icon, this.text});
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: (){
        print('Upload image');
      },
      child: DottedBorder(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: size.width * 0.7,
            child: Column(
              children: [
                Icon(icon ?? Icons.upload_file),
                const SizedBox(height: 8,),
                Text(text ?? 'Upload Image',style: AppStyles.biggersubitileStyle,)
              ],
            )
          ),
        ),
      ),
    );
  }
}