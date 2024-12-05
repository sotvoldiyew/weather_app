import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/common/model/model.dart';
import 'package:weather_app/src/common/sevirce/data_servire.dart';
import 'package:weather_app/src/common/style/app_images.dart';
import 'package:weather_app/src/common/widget/decaretedbox.dart';
import 'package:weather_app/src/common/widget/my_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssistModel? model;

  Future<void> getModel() async {
    await ApiData.getModel();
    model = ApiData.model.first;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getModel();
    });
  }

  void main() {
    DateTime now = DateTime.now();
    String monthName = DateFormat.MMMM('uz_UZ').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.toshkent),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            backgroundColor: Colors.black,
            child: Column(
              children: [
                MaterialButton(
                color: Colors.white,
                  elevation: 0,
                  onPressed: () {  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tashkent",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 25,
                                ),
                      ),
                      const SizedBox(
                          width: 20,
                          child: Image(image: AssetImage(AppIcons.arrow),),),
                    ],
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              "Altyaryk",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
            leadingWidth: 110,
            toolbarHeight: 110,
            backgroundColor: Colors.transparent,
            leading: Row(
              children: [
                Builder(builder: (context) {
                  return IconButton(
                    iconSize: 30,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                }),
                const Image(
                  width: 50,
                  image: AssetImage(AppIcons.location),
                ),
              ],
            ),
            actions: const [
              SizedBox(),
            ],
          ),
          body: ListView(
            children: [
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "${DateFormat("MMMM").format(DateTime.now())} ${DateTime.now().day}",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),
              ),
              Center(
                child: Text(
                  "Updated ${DateFormat(" H:mm").format(DateTime.now())}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 100,
                  child: Image(
                    image:
                        AssetImage("assets/images/${model?.currentCode}.png"),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Clear",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${model?.currentTemp.toInt()}",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Text(
                      "℃",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 30,
                          child: Image(
                            image: AssetImage(
                              AppIcons.rain,
                            ),
                          ),
                        ),
                        Text(
                          "HUMIDITY",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          "90%",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: 35,
                          child: Image(
                            image: AssetImage(
                              AppIcons.wind,
                            ),
                          ),
                        ),
                        Text(
                          "WIND",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          "${model?.currentWindspeed.toInt()} km/h",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          width: 35,
                          child: Image(
                            image: AssetImage(
                              AppIcons.temp,
                            ),
                          ),
                        ),
                        Text(
                          "FEELS LIKE",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          "${model?.currentTemp.toInt()}°",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 170,
                  child: MyDecaretedbox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 24,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: MyWidget(
                            time:
                                "${model?.hourlyTime[index].toString().substring(model!.hourlyTime[index].toString().length - 5)}",
                            temp: "${(model?.hourlyTemp[index].toInt())}",
                            image:
                                "assets/images/${model?.hourlyCode[index]}.png",
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
