import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
      ),
      body: Center(
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                top: 200,
                left: 10,
                child: GradientBall(
                  colors: [
                    Colors.deepOrange,
                    Colors.amber,
                  ],
                ),
              ),
              const Positioned(
                top: 400,
                right: 10,
                child: GradientBall(
                  size: Size.square(200),
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              BlurryContainer(
                color: Colors.white.withOpacity(0.15),
                blur: 8,
                elevation: 6,
                padding: const EdgeInsets.all(32),
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'assets/8k_moon.jpg',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Version: 0.0.1+1',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        //textAlign: TextAlign.,
                      ),
                      // const Text(
                      //   'BETA Release',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 11,
                      //   ),
                      //   //textAlign: TextAlign.,
                      // ),

                      // Container(
                      //   decoration: const BoxDecoration(
                      //     //borderRadius: BorderRadius.circular(10.0),
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         Color.fromARGB(255, 57, 14, 177),
                      //         Color.fromARGB(255, 214, 9, 9),
                      //       ],
                      //     ),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Color.fromARGB(255, 0, 0, 0),
                      //       )
                      //     ],
                      //   ),
                      //   child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: SizedBox(
                      //         height: 100,
                      //         width: 100,
                      //         child: Image.asset(
                      //           'assets/logo/dot.-150x150.png',
                      //         ),
                      //       )),
                      // ),
                      SizedBox(height: 10),
                      Text(
                        'Major Project 1',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Shivam Shahi',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Aditya Pandey',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Shivansh Pandey',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        'Univesity Institue of Technology',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Rajiv Gandhi Proudyogiki Vishwavidyalaya',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Shivpuri, Madhya Pradesh, India',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBall extends StatelessWidget {
  final List<Color> colors;
  final Size size;
  const GradientBall({
    Key? key,
    required this.colors,
    this.size = const Size.square(150),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
  }
}
