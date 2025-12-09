import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../widget/onboarding_subpage/informational_subpage.dart';
import '../widget/onboarding_subpage/lets_start_subpage.dart';
import '../widget/onboarding_subpage/product_list_demo_subpage.dart';
import '../widget/pageview_control_button.dart';

class OnboardingScreen extends StatefulWidget {
  /// Screen to be shown on very first application run.
  const OnboardingScreen({
    required this.onOnboardingPassed,
    super.key,
  });

  /// [onOnboardingPassed] is a callback, which is called, when user passes
  /// onboarding.
  final VoidCallback onOnboardingPassed;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  /// Subpages of Onboarding [PageView]
  late final List<Widget> _subpages;

  final _pageViewController = PageController();

  int _currentPageIndex = 0;

  final _pageTransitionDuration = Durations.long2;
  final _pageTransitionCurve = Curves.fastLinearToSlowEaseIn;

  /// Makes [_pageViewController] go to the next subpage.
  Future<void> _goToNextPage() async => _pageViewController.nextPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  /// Makes [_pageViewController] go to the previous subpage.
  Future<void> _goToPreviousPage() async => _pageViewController.previousPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  void _setPageCurrentIndex(int newIndex) => setState(() {
        _currentPageIndex = newIndex;
      });

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final text = S.of(context);
    final iconColor = Theme.of(context).colorScheme.primary;

    _subpages = [
      InformationalSubpage(
        icon: Icon(
          Icons.waving_hand,
          size: 200,
          color: iconColor,
        ),
        titleText: text.greeting_subpage_title,
        informationText: text.greeting_subpage_information,
      ),
      InformationalSubpage(
        icon: Icon(
          Icons.done,
          size: 200,
          color: iconColor,
        ),
        titleText: text.splash_subpage_title,
        informationText: text.splash_subpage_information,
      ),
      const ProductListDemoSubpage(),
      LetsStartSubpage(
        onButtonTap: widget.onOnboardingPassed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PageViewControlButton(
                    caption: text.page_control_button_back,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                    ),
                    onTap: _maybeGoToPreviousPage(),
                  ),
                  PageViewControlButton(
                    caption: text.page_control_button_forward,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    ),
                    onTap: _maybeGoToNextPage(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageViewController,
                onPageChanged: _setPageCurrentIndex,
                children: _subpages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? _maybeGoToPreviousPage() =>
      // If it is the first subpage, 'previous subpage button' can not be active.
      _currentPageIndex != 0 ? _goToPreviousPage : null;

  VoidCallback? _maybeGoToNextPage() =>
      // If it is the last subpage, 'next subpage button' can not be active.
      _currentPageIndex != _subpages.length - 1 ? _goToNextPage : null;
}
