import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';
import 'package:getx/stateScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('GetX State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Obx(
                () => Text(
                  controller.names.value,
                  style: TextStyle(fontSize: controller.sizefont.value),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.names.value =
                          controller.names.value.toLowerCase();
                    },
                    child: const Text("LOWER CASE"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StateScreen()),
                      );
                    },
                    child: const Text('State screen '),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.names.value =
                          controller.names.value.toUpperCase();
                    },
                    child: const Text("UPPER CASE"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  controller.sizefont.value = controller.sizefont.value -= 1;
                },
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  controller.sizefont.value = controller.sizefont.value += 1;
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
