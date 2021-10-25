import 'package:flutter/material.dart';
import 'package:liveemf/pages/visuals.dart';
import 'package:liveemf/utils/colors.dart';
import 'package:liveemf/widgets/mainReading.dart';
import 'package:liveemf/widgets/meterReading.dart';
import 'package:liveemf/widgets/xyzReading.dart';
import 'package:provider/provider.dart';

import 'models/magnitudeProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool check = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainReading(),
              XYZReading(),
              MeterReading(),
              Container(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Visuals()));
                    },
                    child: const Text('Visualize')),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<MagnitudeProvider>(
                builder: (context, model, child) => Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor: check? MaterialStateProperty.all(
                              AppColors.btn):MaterialStateProperty.all(
                      AppColors.primaryColor)),
                      onPressed: () {
                        if(check){
                          setState(() {
                            check = false;
                          });
                          model.stopValues();
                        }
                        else{
                          setState(() {
                            check = true;
                          });
                          model.changeValues();
                        }
                      },
                      child: check?const Text('Stop'):Text('Start')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
