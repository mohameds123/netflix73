import 'package:flutter/material.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/nowplayingtest.png"),
        Padding(
          padding: const EdgeInsets.only(top: 300,left: 90),
          child: Row(
            children: [
              Container(
                width: 15,height: 15,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)
                ),
              ),
              SizedBox(width: 8,),
              Text("NOW PLAYING",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
