import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Color color = Colors.grey[800]!;
  double width = 250;
  double height = 300;
  double opacity=0;

  bool isVip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.green[900],title: const Text("Animated Profile Card",style: TextStyle(color:Colors.white),)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, Colors.black87],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: width,
              height: height,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: isVip
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/Me.jpg'),
                        radius: 50,
                      ),
                      secondChild: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            SizedBox(width: 5),
                            Text(
                              "VIP",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Sara Fares",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          const Text(
                            "Flutter Dev | UI/UX Designer",
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.favorite, color: Colors.pink),
                              SizedBox(width: 15),
                              Icon(Icons.share, color: Colors.grey),
                              SizedBox(width: 15),
                              Icon(Icons.message, color: Colors.grey),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = color == Colors.grey[800]! ? Colors.green[900]! : Colors.grey[800]!;
                      width = width == 250 ? 350 : 250;
                      height = height == 300 ? 400 : 300;
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.square_outlined),
                      SizedBox(width: 5),
                      Text("Resize & Color"),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVip = !isVip;
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.perm_media),
                      SizedBox(width: 5),
                      Text("Toggle Avatar"),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      opacity = opacity == 0 ? 1 : 0;
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text("Show/Hide Details"),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
