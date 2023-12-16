import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seccion6/features/home/widgets/datepicker_addtask.dart';
import 'package:seccion6/features/home/widgets/home_header.dart';

class emptyView extends StatefulWidget {
  const emptyView({super.key});

  @override
  State<emptyView> createState() => _emptyViewState();
}

class _emptyViewState extends State<emptyView> {
  String name = '';
  String? image;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const homeHeader(),
              const Gap(15),
              secondPart(),
              const Gap(15),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/empty.png'),
                          fit: BoxFit.contain)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
