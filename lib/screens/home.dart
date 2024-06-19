import 'dart:math';
import 'dart:ui';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:birthday_wish_card/helpers/helper_functions.dart';
import 'package:birthday_wish_card/widgets/gradient_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ConfettiController _confettiController;
  String currentImage = 'assets/images/img1.png';
  int imageIndex = 0;
  final List<String> _images = const [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
  ];

  void _changeImage() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 2200));
      setState(() {
        imageIndex = Random().nextInt(_images.length);
        currentImage = _images[imageIndex];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
    _showConfettiAnimation();
    _changeImage();
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  void _showConfettiAnimation() async {
    _confettiController.play();
    await Future.delayed(const Duration(milliseconds: 2000));
    _confettiController.stop();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Scaffold(
      body: _buildBody(screenHeight),
    );
  }

  Widget _buildBody(double screenHeight) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildBackgroundImage(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: GradientContainer(
            avatarImage: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage(currentImage),
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.15,
          child: _buildNeonText(),
        ),
        _buildConfettiWidget(),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/background_image.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNeonText() {
    return const NeonText(
      text: 'Happy BirthDay\n Pratha ❤️',
      fontStyle: FontStyle.italic,
      spreadColor: Colors.red,
      textColor: Colors.red,
      textSize: 40,
    );
  }

  ConfettiWidget _buildConfettiWidget() {
    return ConfettiWidget(
      shouldLoop: true,
      blastDirectionality: BlastDirectionality.explosive,
      maxBlastForce: 100,
      numberOfParticles: 100,
      confettiController: _confettiController,
    );
  }
}
