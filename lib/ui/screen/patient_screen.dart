import 'package:flutter/material.dart';
import 'package:medcare_doctor/ui/screen/home_screen.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Patient History",
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) => PatientCard(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
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

class PatientCard extends StatelessWidget {
  const PatientCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.black12,
            ),
            verticalInside: BorderSide(
              color: Colors.black12,
            ),
          ),
          columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(3)},
          children: [
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("User ID"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("12123123"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("Name"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("Some Name"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("Last Visited"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("10/10/2022"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("Disease"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("asdasds"),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("Medicine"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text("asdasd"),
                ),
              ],
            ),
            TableRow(
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        label: "History",
                        buttonColor: Colors.blue,
                        labelColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
