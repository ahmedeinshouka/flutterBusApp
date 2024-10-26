import 'package:flutter/material.dart'; 
import 'package:untitled5/UsedData/BusLineInfo.dart'; // Contains bus data and filtering logic
import 'package:untitled5/ReusedWidets/ListbusLine.dart'; // Contains the BusLinesList widget
import 'package:untitled5/consts/Colors.dart'; // Contains color constants
import 'package:untitled5/ReusedWidets/BottomImage.dart'; // Contains the ImageFooter widget
import 'package:untitled5/ReusedWidets/CustomDashLine.dart';
import 'package:untitled5/ReusedWidets/DragDown.dart'; // Contains DragDownList widget

class ShowMap extends StatefulWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  List<Map<String, String>> filteredBuses = buses; // Initialize with all buses

  void updateFilteredBuses(String address) {
    setState(() {
      filteredBuses = address == 'Select an address'
          ? buses
          : buses.where((bus) => bus['address'] == address).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Container(color: mapColor),
            ),
            Positioned(
              left: 20,
              top: 42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back, color: appColorBase)),
                      const SizedBox(width: 8),
                      Text("Bus Timeline", style: TextStyle(color: appColorBase)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("Welcome Aboard!",
                      style: TextStyle(fontSize: 24, color: appColorBase, fontWeight: FontWeight.w600)),
                  const Text("Here’s Your Bus Timeline.",
                      style: TextStyle(fontSize: 16, color: appColorBase, fontWeight: FontWeight.w300)),
                  const SizedBox(height: 20),
                  DragDownList(onFilterChanged: updateFilteredBuses), // Pass filter function
                ],
              ),
            ),
            Positioned(
              top: 280,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Text(
                          "Bus Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Departure",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const SizedBox(height: 50),
                                DashedLine(),
                                Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: appColorBase,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: const Text(
                                      "Time",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Exhibition",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: const Divider(color: Colors.grey, thickness: .45),
                  ),
                  BusLinesList(filteredBuses: filteredBuses), // Use updated buses list
                ],
              ),
            ),
            const ImageFotter(),
          ],
        ),
        backgroundColor: appColorBase,
      ),
    );
  }
}
