import 'package:flutter/material.dart';
import 'package:pixel_dat_test_app/home/daily_metrics.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  const HomeScreen({
    super.key,
    // required this.h,
    // required this.w,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DailyMetrics _metrics =
      DailyMetrics(steps: 0, waterIntake: 0, calorieConsumption: 0);
  final _formKey = GlobalKey<FormState>();
  int _steps = 0;
  double _waterIntake = 0;
  double _calorieConsumption = 0;

  // final double h;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.green,
          title: Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good morning,",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.black,
                        )),
                Text("Joshua",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                        )),
              ],
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/accountinfo');
            },
            child: const Icon(
              Icons.account_circle_rounded,
              size: 60,
            ),
          ),
          leadingWidth: 100,
          actions: [
            Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 30,
                    child: Image.asset(
                      'assets/logo5.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ]),
      body: SizedBox(
          height: h,
          width: w,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    Text("HEALTH TRACKER",
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.black,
                            )),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Steps: ${_metrics.steps}'),
                    Text('Water Intake: ${_metrics.waterIntake} ml'),
                    Text(
                        'Calorie Consumption: ${_metrics.calorieConsumption} kcal'),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => InputMetricsPage()),
                    //     );
                    //   },
                    //   child: Text('Input Metrics'),
                    // ),
                    const SizedBox(
                      height: 25,),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Steps'),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              setState(() {
                                _steps = int.parse(value!);
                              });
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Water Intake (ml)'),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              setState(() {
                                _waterIntake = double.parse(value!);
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Calorie Consumption (kcal)'),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              setState(() {
                                _calorieConsumption = double.parse(value!);
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Here you can handle the input data, e.g., save it to a database or update the UI
                                Navigator.pop(
                                    context,
                                    DailyMetrics(
                                        steps: _steps,
                                        waterIntake: _waterIntake,
                                        calorieConsumption:
                                            _calorieConsumption));
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ])))),
    );
  }
}
