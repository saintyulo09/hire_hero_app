import 'package:flutter/material.dart';

class RecentJobCard extends StatefulWidget {
  final String companyName;
  final String jobTitle;
  final String logoImagePath;
  final int hourlyRate;

  const RecentJobCard({super.key, 
    required this.companyName,
    required this.jobTitle,
    required this.logoImagePath,
    required this.hourlyRate,
  });

  @override
  State<StatefulWidget> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends State<RecentJobCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(12),
                color: Colors.grey[300],
                child: Image.asset(widget.logoImagePath),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jobTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.companyName,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Text(
              '\$${widget.hourlyRate.toStringAsFixed(2)}/hr', // Add dollar sign and format to 2 decimal places
                 style: const TextStyle(
                fontWeight: FontWeight.bold,
               fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
