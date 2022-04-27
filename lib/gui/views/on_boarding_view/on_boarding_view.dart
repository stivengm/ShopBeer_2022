import 'package:flutter/material.dart';
import 'package:shopbeer/core/data_base/data_base.dart';
import 'package:shopbeer/data/models/on_boarding_data_base_model.dart';
import 'package:shopbeer/gui/constants.dart';
import 'package:shopbeer/data/models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({ Key? key }) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      color: backgroundApp,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: ( value ) => setState(() => _currentPage = value),
              itemCount: onBoardingInfo.length,
              itemBuilder: (context, i) {
                return _page(onBoardingInfo[i]);
              }
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count:  onBoardingInfo.length,  
                  effect:  const WormEffect(),
                  onDotClicked: (index) => _controller.animateToPage(
                    index, 
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn
                  ),
                ),
                actionsBottom(),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _page(OnBoardingModel onPage) {
    Size media = MediaQuery.of(context).size;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(onPage.image, height: media.height * .2,),
            Column(
              children: [
                Text(
                  onPage.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Text(
                  onPage.description,
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonAnimated() {
    return ElevatedButton(
      onPressed: () {
        if (_currentPage + 1 == onBoardingInfo.length) {
          final onBoarding = OnBoardingDataBaseModel(
            id: 1,
            show: "false",
            description: "Ya se mostró el OnBoarding."
          );
          DataBaseApp.instance.onBoardingViewer(onBoarding);
          Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn
          );
        }
      },
      child: Text( _currentPage + 1 == onBoardingInfo.length ? "INICIAR" : "SIGUIENTE"),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0)
      ),
    );
  }

  Widget actionsBottom() {
    Size media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          buttonSkip(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            right: _currentPage + 1 == onBoardingInfo.length ? media.width * .28 : 0,
            child: _buttonAnimated()
          ),
        ],
      ),
    );
  }

  Widget buttonSkip() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => _controller.animateToPage(
            onBoardingInfo.length - 1, 
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn
          ),
          child: Text(_currentPage + 1 == onBoardingInfo.length ? "" : "OMITIR", style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15.0)),
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: transparent,
            primary: blackColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

}