// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gastrack/provider/TransaksiProvider.dart';
import 'package:shimmer/shimmer.dart';

class LacakPage extends StatefulWidget {
  const LacakPage({super.key, required this.id});

  final int id;

  @override
  State<LacakPage> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<LacakPage> {
  List<Map<String, dynamic>> DataLokasi = [];
  late var id = widget.id.toInt();

  @override
  void initState() {
    TransaksiProvider().getDatalokasi(id).then((value) {
      if (value.statusCode == 200) {
        print(value.body);
        // var data = value.body['data'];
        // setState(() {
        //   DataLokasi.add(data);
        // });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(249, 1, 131, 1.0),
                Color.fromRGBO(128, 38, 198, 1.0)
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id.toString()),
          ],
        ),
      ),
    );
  }
}

class LoadingContentDetail extends StatelessWidget {
  const LoadingContentDetail(
      {super.key, required this.width, required this.height});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: MediaQuery.of(context).size.height * height,
                width: MediaQuery.of(context).size.width * width,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingHeaderdetail extends StatelessWidget {
  const LoadingHeaderdetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 50),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ],
                    ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
