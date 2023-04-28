import 'package:flutter/material.dart';
import 'package:user_app/model/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel data;
  const DetailScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0a0f00),
        title: const Text('User Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(16),
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      'https://api.dicebear.com/6.x/adventurer/png?seed=${data.name}&backgroundColor=ffd5dc',
                    ),
                  ),
                  Text(
                    'Name : ${data.name}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email : ${data.email}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    'Phone : ${data.phone}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Address : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    '${data.address.city},',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${data.address.street},',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${data.address.suite},',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.address.zipcode,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  // Text(
                  //   data.address.geo.lat,
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   data.address.geo.lng,
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
