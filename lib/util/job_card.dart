import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;

  const JobCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.logoImagePath,
    required this.hourlyRate,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12),
          color: Colors.white, // Use a clear background color
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
                  Container( // Adjust padding as needed
                    padding: const EdgeInsets.all(8), // Or remove padding
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
    );
  }
}
