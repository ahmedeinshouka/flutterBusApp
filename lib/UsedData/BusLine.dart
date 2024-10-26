String selectedLocation = 'Sheraton';
List<Map<String, String>> busSchedule = [];

final List<Map<String, String>> sheratonBusSchedule = [
  {'time': '6:10 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '8:45 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '10:00 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '11:15 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '12:30 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '14:15 pm', 'busNumber': 'W1_02', 'busType': 'Express', 'availableSeats': '30'},
  {'time': '10:00 am', 'busNumber': 'W1_03', 'busType': 'Standard', 'availableSeats': '25'},
];

final List<Map<String, String>> almanaraBusSchedule = [
  {'time': '11:30 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '8:45 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '10:00 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '11:15 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '12:30 am', 'busNumber': 'W1_01', 'busType': 'N/A', 'availableSeats': 'N/A'},
  {'time': '14:15 pm', 'busNumber': 'W1_02', 'busType': 'Express', 'availableSeats': '30'},
  {'time': '10:00 am', 'busNumber': 'W1_03', 'busType': 'Standard', 'availableSeats': '25'},
];

// Function to update the bus schedule based on the selected location
void updateBusSchedule(selectedLocation) {
  if (selectedLocation == 'Sheraton') {
    busSchedule = sheratonBusSchedule;
  } else if (selectedLocation == 'Al-Manarah') {
    busSchedule = almanaraBusSchedule;
  }
}




// Example button press to change location and update the schedule
