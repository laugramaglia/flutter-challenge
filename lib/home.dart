import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<double> valueNotifier = ValueNotifier(75);

  int totalCards = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _cards,
          ],
        ),
      ),
    );
  }

  Widget get _cards {
    return Stack(
      // children: [
      //   _card1,
      //   _card2,
      //   _card3,
      // ],
      children: List.generate(
        totalCards,
        (index) {
          if (index == totalCards - 1) {
            return _finalCard;
          }

          return _card(index);
        },
      ),
    );
  }

  Widget _card(int index) {
    return Center(
      child: Card(
        elevation: (index + 1) * 3,
        shadowColor: Colors.transparent,
        color: Color.fromRGBO(48, 20, 124, (totalCards - index) * 0.2),
        surfaceTintColor:
            Color.fromRGBO(48, 20, 124, (totalCards - index) * 0.2),
        margin: EdgeInsets.symmetric(
          horizontal: (totalCards - index - 1) * 20,
          vertical: (index) * 16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          height: 100 + (totalCards - index) * 20,
        ),
      ),
    );
  }

  Widget get _card1 {
    return Center(
      child: Card(
        elevation: 3,
        shadowColor: Colors.transparent,
        color: const Color.fromRGBO(48, 20, 124, 0.43),
        surfaceTintColor: const Color.fromRGBO(48, 20, 124, 0.43),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          height: 100,
        ),
      ),
    );
  }

  Widget get _card2 {
    return Center(
      child: Card(
        elevation: 5,
        shadowColor: Colors.transparent,
        color: const Color.fromRGBO(48, 20, 124, 0.59),
        surfaceTintColor: const Color.fromRGBO(48, 20, 124, 0.59),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        margin: const EdgeInsets.only(
          top: 16,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width - 20,
        ),
      ),
    );
  }

  Widget get _finalCard {
    return Center(
      child: Card(
        elevation: 10,
        shadowColor: Colors.transparent,
        color: const Color.fromRGBO(48, 20, 124, 1),
        surfaceTintColor: const Color.fromRGBO(48, 20, 124, 1),
        margin: const EdgeInsets.only(top: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title,
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  _totalUsage,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _totalUsage {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _progressIndicator,
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Total Usage',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _title {
    return const Text(
      'Daytime Consumption Record',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget get _progressIndicator {
    return SimpleCircularProgressBar(
      startAngle: 360,
      valueNotifier: valueNotifier,
      backColor: Colors.white,
      progressColors: const [
        Color.fromRGBO(254, 123, 30, 1),
      ],
      onGetText: (double value) {
        return Text(
          '${value.toInt()}%',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
