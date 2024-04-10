import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;
  final String filePath; // Add a field to store the file path

  const JobCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.logoImagePath,
    required this.hourlyRate,
    required this.filePath,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  void navigateToFile() {
    // Implement your navigation logic here
    // You can use Navigator.push or a similar method
    // to navigate to a new screen with the file path
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(filePath: widget.filePath, companyName: '', companyDescription: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToFile,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 250,
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 60,
                      child: Image.asset(widget.logoImagePath),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Part Time',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.jobTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  '\$${widget.hourlyRate}/hr',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// You'll need to create a separate DetailScreen class to handle displaying the file content
// DetailScreen.dart

class DetailScreen extends StatelessWidget {
  final String companyName;
  final String companyDescription;

  const DetailScreen({super.key, required this.companyName, required this.companyDescription, required String filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Company Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Join our team and make a difference. Learn more and apply here!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to application form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ApplicationFormScreen()),
                );
              },
              child: const Text(
                'Apply Now!',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ApplicationFormScreen.dart

class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Fill out the form to apply for the position',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            // Add more fields as needed (e.g., resume upload)
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission logic (e.g., send data)
              },
              child: const Text('Submit Application'),
            ),
          ],
        ),
      ),
    );
  }
}




