import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StartUpScreen extends StatelessWidget {
  List<PageItem> arrPageItems = [];
  Color pageIndicatorColor;
  Color pageIndicatorSelectedColor;
  Color buttonsColor;
  Color buttonsTextColor;
  Function(BuildContext, int) nextPageCallback;
  Function(BuildContext) skipScreenCallback;
  PageController controller = PageController(initialPage: 0);

  // ignore: sort_constructors_first
  StartUpScreen(
      {this.arrPageItems,
      this.pageIndicatorColor,
      this.pageIndicatorSelectedColor,
      this.buttonsColor,
      this.buttonsTextColor,
      this.skipScreenCallback,
      this.nextPageCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: [
            _createPageBuilder(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _createPageIndicator(context),
                _createButtonsContainer(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _createButtonsContainer(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.only(bottom: height * 0.10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text(
                'Skip',
                style: TextStyle(color: buttonsTextColor),
              ),
              onPressed: () {
                skipScreenCallback(context);
              },
              color: buttonsColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Consumer<StartupScreenNavigationProvider>(
                builder: (ctx, item, child) {
              return RaisedButton(
                child: Text(
                  item.pageSelectedIndex == arrPageItems.length - 1
                      ? 'Finish'
                      : 'Continue',
                  style: TextStyle(color: buttonsTextColor),
                ),
                onPressed: () {
                  if (item.pageSelectedIndex != arrPageItems.length - 1) {
                    controller.animateToPage(
                      item.pageSelectedIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  } else {}
                  nextPageCallback(context, item.pageSelectedIndex);
                },
                color: buttonsColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  PageView _createPageBuilder(BuildContext context) {
    final StartupScreenNavigationProvider provider =
        Provider.of<StartupScreenNavigationProvider>(context, listen: false);
    return PageView.builder(
      physics: const ClampingScrollPhysics(),
      controller: controller,
      itemBuilder: (ctx, index) => _pageBuilder(ctx, arrPageItems[index]),
      itemCount: arrPageItems.length,
      onPageChanged: (pageIndex) {
        provider.setPageSelectedIndex(pageIndex);
      },
    );
  }

  Widget _createPageIndicator(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<StartupScreenNavigationProvider>(
        builder: (ctx, item, child) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: height * 0.05),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < arrPageItems.length; i++)
                    if (i == item.pageSelectedIndex)
                      _circleIndicator(true)
                    else
                      _circleIndicator(false),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _circleIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? pageIndicatorSelectedColor : pageIndicatorColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  Widget _pageBuilder(BuildContext context, PageItem page) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.cyan),
      child: Image.asset(
        page.imgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class PageItem {
  String imgPath;
  // ignore: sort_constructors_first
  PageItem({this.imgPath});
}

class StartupScreenNavigationProvider extends ChangeNotifier {
  int pageSelectedIndex = 0;
  void setPageSelectedIndex(int sIndex) {
    pageSelectedIndex = sIndex;
    notifyListeners();
  }
}
