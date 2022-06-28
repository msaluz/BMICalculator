import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}
double bmi = 0.0;
Color textColor = Colors.white;
String text = "";
String weightStatus = "";

class _BmiScreenState extends State<BmiScreen>
    with SingleTickerProviderStateMixin {

  //variables
  late AnimationController controller;
  double height = 50;
  double weight = 0;


  @override
  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: -1,
      upperBound: 0,
    );
    controller.animateTo(0,curve: Curves.easeOut, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
        backgroundColor: const Color(0xff140034),
        elevation: 5,
        actions: [
          IconButton(onPressed: (){
            setState((){
              height = 50;
              weight = 0;
            });
          }, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context,Widget? child){
                          return Transform.translate(
                            offset: Offset(controller.value*200,0),
                            child: child,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder:(BuildContext context,Widget? child){
                          return Transform.translate(
                            offset: Offset(controller.value*-200,0),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
                flex: 10,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context ,Widget? child){
                    return Transform.translate(
                      offset: Offset(controller.value*-200,0),
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0x2f6009cb),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT",style: TextStyle(color: Color(0xffB2B9D5), fontSize: 18, fontWeight: FontWeight.w500),),
                        RichText(
                          text: TextSpan(
                            children:  <TextSpan>[
                              TextSpan(text: height.toInt().toString(), style: const TextStyle(color: Colors.white, fontSize: 60,fontWeight: FontWeight.w500)),
                              const TextSpan(text: 'CM', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        Slider(
                            inactiveColor: const Color(0xffB2B9D5),
                            activeColor: const Color(0xff00951a),
                            thumbColor: const Color(0xff26ff00),
                            min: 50,
                            max:  250,
                            value: height,
                            onChanged: (val){
                              setState((){
                                height = val;
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 20,),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: ( context, Widget? child){
                          return Transform.translate(
                            offset: Offset(controller.value*200,0),
                            child: child,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0x2f6009cb),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("WEIGHT",style: TextStyle(color: Color(0xffB2B9D5), fontSize: 18, fontWeight: FontWeight.w500),),
                              RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: weight.toInt().toString(), style: const TextStyle(color: Colors.white, fontSize: 60,fontWeight: FontWeight.w500)),
                                      const TextSpan(text: 'KG', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                                    ]
                                  )
                              ),
                              Slider(
                                  inactiveColor: const Color(0xffB2B9D5),
                                  activeColor: const Color(0xff00951a),
                                  thumbColor: const Color(0xff26ff00),
                                  min: 0,
                                  max:  300,
                                  value: weight,
                                  onChanged: (val){
                                    setState((){
                                      weight = val;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 4,
              child:  AnimatedBuilder(
                animation: controller,
                builder: (context, Widget? child){
                  return Transform.translate(
                    offset: Offset(0,controller.value*-100),
                    child: child,
                  );
                },
                child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      if(weight != 0){
                        double heightM = height/100;
                        bmi = weight/(heightM*heightM);
                        if(bmi<18.5){
                          weightStatus = "Underweight";
                          textColor= Colors.yellowAccent;
                          text = "Your Weight is too low eat some health food.";
                        }else if(bmi>18.5 && bmi<24.9){
                          weightStatus = "	Healthy Weight";
                          text = "You have a healthy body weight good job.";
                          textColor= Colors.green;
                        } else if(bmi>25.0 && bmi<29.9){
                          weightStatus = "	Overweight";
                          textColor= Colors.orangeAccent;
                          text = "Your body id overweight keep doing workout.";
                        }else{
                          weightStatus = "Obesity";
                          textColor= Colors.redAccent;
                          text = "Your weight is too heavy go to GYM.";
                        }

                        Navigator.pushNamedAndRemoveUntil(context, 'result', (route) => false);
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Please fill all inputs",
                            gravity: ToastGravity.CENTER,
                            backgroundColor: const Color(0xff26ff00),
                            textColor: const Color(0xff140034),
                            fontSize: 16.0
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
                    primary: const Color(0xff26ff00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text("Check Your BMI",style: TextStyle(color: Color(0xff140034),fontSize: 22,fontWeight: FontWeight.w500),),
                ),
              ),
            )

          ],
        ),
      ),
      backgroundColor: const Color(0xff140034),
    );
  }
}