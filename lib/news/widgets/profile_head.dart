import 'package:flutter/material.dart';

class ProfileHeadWidget extends StatelessWidget {
  final String imageSrc;
  final Map<String, dynamic> userData;
  const ProfileHeadWidget({
    super.key,
    required this.imageSrc,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 200,
        maxHeight: 300,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageSrc),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
          ),
          Text(
            userData['name'],
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
