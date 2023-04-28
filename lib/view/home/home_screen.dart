import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/controller/user_controller.dart';
import 'package:user_app/extensions/context_extensions.dart';
import 'package:user_app/model/user_model.dart';
import 'package:user_app/view/detail/detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0a0f00),
        centerTitle: true,
        title: const Text('User Data'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(userProvider);
        },
        child: data.when(
          data: (data) => buildBody(data, context),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  ListView buildBody(List<UserModel> data, BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
      itemBuilder: (_, index) => InkWell(
        onTap: () {
          context.navigate(DetailScreen(data: data[index]));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(width: 1),
          ),
          // color: const Color(0xFF0a0f00),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(16),
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  'https://api.dicebear.com/6.x/adventurer/png?seed=${data[index].name}&backgroundColor=212121',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index].name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data[index].email,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      data[index].phone,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}
