import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatheroi/services/location_provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bgClear.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Location
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 100,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8)),
                  child: Consumer<LocationProvider>(
                      builder: (context, locationProvider, child) {
                    var locationCity = "Unknown Location";
                    var sublocality = "Unknown Location";
                    if (locationProvider.currentLocationName != null ||
                        locationProvider.currentLocationName != null) {
                      locationCity =
                          locationProvider.currentLocationName!.locality ??
                              "Unknown Location";
                      sublocality =
                          locationProvider.currentLocationName!.subLocality ??
                              "Unknown";
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.location_on,
                          size: 40,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locationCity,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              sublocality,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              size: 40,
                              color: Colors.white,
                            ))
                      ],
                    );
                  })),
            ),
            const SizedBox(height: 8),
            //Current Indication Img
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/cloudy.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            //Current Indication Info
            Center(
              child: Container(
                height: 100,
                width: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("21 C",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Weather",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    Text("time")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            //More Info
            Container(
              height: 240,
              width: size.width - 10,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Temp
                    Row(
                      children: [
                        //TempMAX
                        Row(
                          children: [
                            Container(
                              height: 100,
                              width: size.width / 2,
                              child: Row(
                                //TempMax IMG
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/tempMAX.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("Temp Max"), Text("21 C")],
                                  )
                                ],
                              ),
                            ),
                            //TempMIN
                            Container(
                              height: 100,
                              width: size.width / 2 - 30,
                              child: Row(
                                //TempMin IMG
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/tempMIN.jpg'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("Temp Min"), Text("21 C")],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: size.width / 2,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/sunrise.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Sunrise"),
                                          Text("21 C")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: size.width / 2 - 30,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/sunset.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Sunset"),
                                          Text("21 C")
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
