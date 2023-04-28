import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:user_app/extensions/context_extensions.dart';

import '../../model/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel data;
  const DetailScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('User Details'),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      child: Image.network(
                        'https://api.dicebear.com/6.x/adventurer/png?seed=${data.name}',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.email,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.phone,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${data.address.suite}, ${data.address.city}, ${data.address.street}',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Zip code: ${data.address.zipcode}',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: PrettyQr(
                    data: data.id.toString(),
                    size: 256,
                    roundEdges: true,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
