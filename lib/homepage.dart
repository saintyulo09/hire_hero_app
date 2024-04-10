import 'package:flutter/material.dart';
import 'util/job_card.dart';
import 'util/recent_job_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() =>  HomePageState();
}

class  HomePageState extends State<HomePage> {
  get child => null;

  

  final List jobsForYou = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ['Uber', 'Developer', 'lib/icons/uber.png', 100],
    ['Google', 'Secretary', 'lib/icons/google.png', 150],
    ['Apple', 'Manager', 'lib/icons/apple.png', 200],
    ['Nike', 'Sales', 'lib/icons/nike.png', 30],

  ];

  final List recentJobs = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ['Google', 'Developer', 'lib/icons/google.png', 300],
    ['Uber', 'Developer', 'lib/icons/uber.png', 100],
    ['Nike', 'Manager', 'lib/icons/nike.png', 200],

  ];
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 202, 202),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const SizedBox(height: 10),
           
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: 20,
                            child: Image.asset(
                              'lib/icons/search.png',
                              color: const Color.fromARGB(255, 65, 65, 65),
                              ),
                          ),
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for job..',
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //Container(
                 // height: 50,
                 // padding: const EdgeInsets.all(12),
                 // decoration: BoxDecoration(
                  //  color: Colors.grey[800],
                  //  borderRadius: BorderRadius.circular(12),
             //     ),
              //  child: Image.asset('lib/icons/menu_from_left.png',
             //   color: Colors.white,
             //   ),
            //    ),
              ],
            )
          ),
          const SizedBox(height: 10),

          // for you -> job cards
            const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'For You',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              ),
          ),

          const SizedBox(height: 5),

          // ignore: sized_box_for_whitespace
          Container(
            height: 140,
            child: ListView.builder( 
              itemCount: jobsForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobsForYou[index][0],
                  jobTitle: jobsForYou[index][1],
                  logoImagePath: jobsForYou[index][2],
                  hourlyRate: jobsForYou[index][3], filePath: '',
                );
              },
              ),
          ),

          const SizedBox(height: 10),

          // recently add ->  job titles
            const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              ),
            ),

          const SizedBox(height: 5),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0], 
                    jobTitle: recentJobs[index][1], 
                    logoImagePath: recentJobs[index][2], 
                    hourlyRate: recentJobs[index][3],
                    );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
