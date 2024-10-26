import 'package:flutter/material.dart';
import 'package:untitled5/consts/Colors.dart';
import 'package:untitled5/UsedData/BusLine.dart';

class BusScheduleWidget extends StatelessWidget {
  final String selectedBusStop;

  BusScheduleWidget({required this.selectedBusStop});

  

  @override
  Widget build(BuildContext context) {

    // Filter the bus schedule based on the selected bus stop
    final filteredSchedule = busSchedule.where((schedule) => schedule['busNumber'] == selectedBusStop).toList();

    return SizedBox(
      height: 200, // Adjust height to fit within available space
      child: ListView.builder(
        itemCount: filteredSchedule.length,
        itemBuilder: (context, index) {
          final schedule = filteredSchedule[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: bottomColorRedWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        schedule['time']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bus Number',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              schedule['busNumber']!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bus Type',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              schedule['busType']!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Available Seats',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              schedule['availableSeats']!,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
