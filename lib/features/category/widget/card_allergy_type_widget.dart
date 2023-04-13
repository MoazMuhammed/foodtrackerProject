import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';

class CardAllergyTypeWidget extends StatefulWidget {
  const CardAllergyTypeWidget({Key? key}) : super(key: key);

  @override
  State<CardAllergyTypeWidget> createState() => _CardAllergyTypeWidgetState();
}

class _CardAllergyTypeWidgetState extends State<CardAllergyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 19,
                mainAxisExtent: 240),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                child: Stack(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(assetName: "eggAllergy"),
                      Expanded(
                        child: const Text(
                          'Eggs Allergy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ]),
              );
            }))
    ;
  }
}
