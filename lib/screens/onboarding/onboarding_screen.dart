import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 280,
                    child: Column(
                      children: [
                        Text(
                          "Aprenda design & código",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Não pule o design. Aprenda design e programação construindo aplicativos reais com Flutter. Cursos completos sobre as melhores ferramentas.",
                        )
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    onPress: () {
                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: "Sign in",
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Center(
                          child: Container(
                            height: 620,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(
                              vertical: 32,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.94),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: const Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Column(
                                children: [
                                  Text(
                                    "Entrar",
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: Text(
                                      "Acesso a mais de 240 horas de conteúdo. Aprenda design e programação construindo aplicativos reais com Flutter.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SignInForm()
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "A compra inclui acesso a mais de 30 cursos, 240+ tutoriais premium, 120+ horas de vídeos, códigos-fonte e certificados.",
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ),
            ),
          ),
          const Text(
            "Senha",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.arrow_right),
            label: const Text("Entrar"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF77D8E),
              minimumSize: const Size(
                double.infinity,
                56,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
