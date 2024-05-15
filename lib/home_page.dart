import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/components/page_indicator.dart';
import 'package:test_reactive_forms/form/form_data.dart';
import 'package:test_reactive_forms/form_section1.dart';
import 'package:test_reactive_forms/form_section2.dart';
import 'package:test_reactive_forms/form_section3.dart';
import 'package:test_reactive_forms/form_section4.dart';
import 'package:test_reactive_forms/form_section5.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  final int _maxPageIndex = 5;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _maxPageIndex, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    FormGroup formGroup = ref.watch(formDataProvider());
    // AbstractControl<dynamic> stateControl = formGroup.control('address.state');
    // stateControl.markAsDisabled();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: ReactiveForm(
        formGroup: formGroup,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: <Widget>[
                FormSection1(
                  formGroup: formGroup,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                FormSection2(
                  formGroup: formGroup,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                FormSection3(
                  formGroup: formGroup,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                FormSection4(
                  formGroup: formGroup,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
                FormSection5(
                  formGroup: formGroup,
                  onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                ),
              ],
            ),
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              maxPageIndex: _maxPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
            ),
          ],
        ),
      ),
    );
  }
}
