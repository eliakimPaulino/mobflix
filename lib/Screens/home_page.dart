import 'package:flutter/material.dart';
import 'package:mobflix/Screens/video_registration.dart';
import 'package:mobflix/components/card_presentation.dart';
import 'package:mobflix/data/card_data.dart';

import '../components/horizontal_categorys.dart';
import '../components/video_banner.dart';
import '../data/video_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool recharge = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => VideoReagistration(
                registrationContext: context,
              ),
            ),
          ).then((value) => setState(() {
                debugPrint('Recarregando tela inicial...');
              }));
        },
        child: const Icon(Icons.add),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.replay_outlined, color: Colors.white),
                  onPressed: () {
                    setState(() {});
                  },
                  tooltip: 'Lista Favoritos',
                ),
              ],
              pinned: true,
              elevation: 0,
              backgroundColor: const Color.fromRGBO(5, 25, 51, 1),
              expandedHeight: screenSize.height * .22,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'MOBFLIX',
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900],
                  ),
                ),
                background: const VideoBanner(),
              ),
              floating: true,
            ),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(5, 25, 51, 1),
                Color.fromRGBO(12, 67, 136, 1),
                Color.fromRGBO(12, 67, 136, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              categoryRow(),
              Expanded(
                child: FutureBuilder<List<CardPresentation>>(
                  future: VideoDao().findAll(),
                  builder: (context, snapshot) {
                    List<CardPresentation>? videos = snapshot.data;
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            Text(
                              'Carregando...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      case ConnectionState.waiting:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            Text(
                              'Carregando...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      case ConnectionState.active:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            Text(
                              'Carregando...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      case ConnectionState.done:
                        if (snapshot.hasData && videos != null) {
                          if (videos.isNotEmpty) {
                            return ListView.builder(
                              itemCount: videos.length,
                              itemBuilder: (context, index) {
                                final CardPresentation video = videos[index];
                                return video;
                              },
                            );
                          }
                          return const Center(
                            child: Text(
                              'Lista de Vídeos está vazia',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return const Center(
                          child: Text(
                            'Lista de Vídeos está vazia',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          categorys[0],
          categorys[1],
          categorys[2],
          categorys[3],
          categorys[4],
          categorys[5],
          categorys[6],
        ],
      ),
    );
  }
}
