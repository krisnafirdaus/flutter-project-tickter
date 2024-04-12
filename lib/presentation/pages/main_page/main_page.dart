import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/presentation/extensions/build_context_extension.dart';
import 'package:flutter_application_1/presentation/providers/router/router_provider.dart';
import 'package:flutter_application_1/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
 @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if(previous != null && next is AsyncData && next.value == null){
          ref.read(routerProvider).goNamed('login');
        } else if(next is AsyncError){
          context.showSnackBar(next.error.toString());
        }
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail');
          },
          child: Column(
            children: [
              Text(ref.watch(userDataProvider).when(data: (data) => data.toString(), error: (error, stackTrace) => '', loading: () => 'Loading')),
              ElevatedButton(onPressed: () {
                ref.read(userDataProvider.notifier).logout();
              }, child: const Text('Logout'))
            ],
          )
        ),
      ),
    );
  }

}