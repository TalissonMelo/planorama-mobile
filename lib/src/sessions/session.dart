import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/schedule/schedule.dart';

class Session extends StatelessWidget {
  const Session({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(),
              Positioned(
                  top: 10,
                  left: 10,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) {
                            return const Schedule();
                          }),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
