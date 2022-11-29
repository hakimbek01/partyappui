import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogged=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img.png'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.2),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _slideAnimation(300, 100.0, 0,
                const Text(
                'Find the best parties near you',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              ),
              const SizedBox(height: 25,),
              _slideAnimation(200, 300.0, 0.0,
                const Text(
                  'Let us find you a party for your intereset',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey
                  ),
                ),
              ),
              const SizedBox(height: 200,),
              Column(
                children: [
                  (isLogged)?
                  Container(
                   height: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.yellow.shade900,
                   ),
                   child: const Center(
                       child: Text('Start',style: TextStyle(fontSize: 20, color: Colors.white),)
                   ),
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Text("Google",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Text("Facebook",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final SpringController _springController=SpringController(initialAnim: Motion.play);

  Widget _slideAnimation(int delay,double y1, double y2,Widget child){
    return Spring.slide(
      springController: _springController,
      slideType: SlideType.slide_in_top,
      withFade: true,
      cutomTweenOffset: Tween(
        begin: Offset(0,y1),
        end: Offset(0, y2),
      ),
      delay: Duration(milliseconds: delay),
      child: child
    );
  }

}
