import 'package:flutter/material.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular on netflix",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          SizedBox(
            height: 161,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
                itemBuilder:(context, index){
                  return Image.network("assets/images/populartest.png");
                }
            ),
          )

        ],
      ),
    );
  }
}
