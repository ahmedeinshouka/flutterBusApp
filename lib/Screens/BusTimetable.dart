import 'package:flutter/material.dart';
import 'package:untitled5/consts/Colors.dart';
import 'package:untitled5/ReusedWidets/BusScheduleWidget.dart';
import 'package:untitled5/UsedData/BusLine.dart';

class BusTimetable extends StatefulWidget {
  const BusTimetable({super.key});

  @override
  _BusTimetableState createState() => _BusTimetableState();
}

class _BusTimetableState extends State<BusTimetable> {
  final List<String> busStops = [
    'W1_01',
    'W1_02',
    'W1_03',
    'W1_04',
    'W1_05',
    'W1_06'
  ];

  String selectedBusStop = 'W1_01';
  String selectedLocation = 'Sheraton';
  bool isHighlighted = false;
  bool isRefreshing = false;
  final ScrollController _scrollController = ScrollController();

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.pixels - details.delta.dx,
      );
    }
  }

  // Function to refresh the bus schedule
  void _refreshBusSchedule() {
    setState(() {
      isRefreshing = true;
    });

    // Simulate a delay for the refresh operation
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isRefreshing = false;
        isHighlighted = true;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() => isHighlighted = false); // Reset highlight
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColorBase,
        body: Stack(
          children: [
            Positioned(
                top: 5,
                left: 5,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))),
            Positioned(
              top: 61,
              left: 24,
              right: 24,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bus Timetable",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                        color: bottomColorRedWhite,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Showing bus time schedule",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Starting Locations",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedLocation = 'Sheraton';
                              updateBusSchedule(selectedLocation);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              selectedLocation == 'Sheraton'
                                  ? bottomColorRedWhite
                                  : bottomColorRedWhite40,
                            ),
                          ),
                          child: const Text(
                            "Sheraton",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedLocation = 'Al-Manarah';
                              updateBusSchedule(selectedLocation);
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              selectedLocation == 'Al-Manarah'
                                  ? bottomColorRedWhite
                                  : bottomColorRedWhite40,
                            ),
                          ),
                          child: Text(
                            "Al-Manarah",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Bus Timeline",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              onPressed: _refreshBusSchedule,
                              icon: Icon(
                                Icons.refresh,
                                color: isHighlighted
                                    ? bottomColorRedWhite
                                    : Colors.grey,
                              ),
                            ),
                            if (isRefreshing)
                              const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.blueAccent,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onHorizontalDragUpdate: _onHorizontalDragUpdate,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(busStops.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedBusStop = busStops[index];
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedBusStop == busStops[index]
                                            ? bottomColorRedWhite
                                            : bottomColorRedWhite40,
                                  ),
                                  child: Text(
                                    busStops[index],
                                    style: TextStyle(
                                      color: selectedBusStop == busStops[index]
                                          ? Colors.white
                                          : bottomColorRedWhite,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 400,
                      child:
                          BusScheduleWidget(selectedBusStop: selectedBusStop),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -20,
              right: 0,
              left: 0,
              child: Image.asset(
                "assets/HomeMaterial/img2.jpg",
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
