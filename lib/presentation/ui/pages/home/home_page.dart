import 'package:flutter/material.dart';
import 'package:pocs_scaffold/presentation/presenters/home/home_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePresenter _presenter;

  @override
  void initState() {
    _presenter = HomePresenter();
    _presenter.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Página Principal", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder(
                  future: _presenter.loadUser("1"),
                  builder: (_, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        return Text("Usuário: ${_presenter.userEntity?.id} - ${_presenter.userEntity?.name}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold));

                      default:
                        return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
