# Flutter - Intro Screens

A Flutter based Reusable Intro Screens component that provides Application Startup Screens with configurable items which can be used in any Flutter application.


## Table of contents
- [Flutter Support](#Flutter-support)
- [Demo](#demo)
- [Features](#features)
- [Getting started](#getting-started)
- [Usage](#usage)
- [Methods](#methods)
- [Want to Contribute?](#want-to-contribute)
- [Collection of Components](#collection-of-Components)
- [Changelog](#changelog)
- [License](#license)
- [Keywords](#Keywords)


## Flutter Support

Version - Flutter 1.17 (stable)

We have tested our program in above version, however you can use it in other versions as well.


## Demo
[![](introScreen.gif)](https://github.com/weblineindia/Flutter-Intro-Screens/blob/master/introScreen.gif)

------

## Features

* Introduction Screens handled with navigation using stateless widget.
* Introduction Screens with less code of implementation and configurable UI options.


## Getting started

* Download this sample project and import app_startup_ui_widget.dart Widget file in your Flutter App. 
* Update images based on your requirements. 


## Usage

Setup process is described below to integrate in project.

## Configure Intro Screens View in your widget by following below method steps

### Methods

Step 1.Add  'provider' package to pubspec.yaml

Step 2. Add MultiProvider in Your application widget like below and provider StartupScreenNavigationProvider in providers list.
       
    // Put BottomNavigatorProvider as mention below
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final MaterialColor colorCustom = MaterialColor(0xFFFACA58, color);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: StartupScreenNavigationProvider(),
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            home: ...,
          ),
        );
      }
    }
       

Step 3. User following StartUpScreen constructor for adding Intro Screen as user landing screen.             
       
         List<PageItem> arrPageItems = [];
         Color pageIndicatorColor;
         Color pageIndicatorSelectedColor;
         Color buttonsColor;
         Color buttonsTextColor;
         Function(BuildContext, int) nextPageCallback;
         Function(BuildContext) skipScreenCallback;
         

         // ignore: sort_constructors_first
         StartUpScreen(
             {this.arrPageItems,
             this.pageIndicatorColor,
             this.pageIndicatorSelectedColor,
             this.buttonsColor,
             this.buttonsTextColor,
             this.skipScreenCallback,
             this.nextPageCallback});
        

Step 4. Pass PageItems to StartUpScreen widget. 

      this.arrPageItems = [] // Pass PageItem in StartUpScreen widget for displaying and Use 'PageItem' helper class to create PageItems 

     //Use our helper class to create pageItems for StartUpScreen
     class PageItem {
       String imgPath;
       // ignore: sort_constructors_first
       PageItem({this.imgPath});
     }


Step 5.if you want to set various colors to StartUpScreen you can configure as below.

    this.pageIndicatorColor // To set page indicators unselected color
    this.pageIndicatorSelectedColor // To set page indicators selected color
    this.buttonsColor // To set buttons color in StartUpScreen Widget
    this.buttonsTextColor // To set buttons text color in StartUpScreen Widget
    
Step 6.if you want to Handle callbacks of StartUpScreen.
    
    // Use below parameter of StartUpScreen widget for handle skip button callback
    skipScreenCallback: (BuildContext context) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => YOUR_SCREEN()));
    } 
    
    // Use below parameter of StartUpScreen widget for handle next and last page callback of StartUpScreen 
    nextPageCallback: (BuildContext context, int page) {
      if (page == arrItems.length - 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => YOUR_SCREEN()));
       }
       else {...}
    }
    
Step 7. Adding StartUpScreen in your main app widget
    
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: StartUpScreen(
        arrPageItems: arrItems,
        pageIndicatorColor: Colors.grey,
        pageIndicatorSelectedColor: colorCustom,
        buttonsColor: colorCustom,
        buttonsTextColor: Colors.white,
        skipScreenCallback: (BuildContext context) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => YOUR_SCREEN()));
        },
        nextPageCallback: (BuildContext context, int page) {
          if (page == arrItems.length - 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => YOUR_SCREEN()));
          }
        },
      ),
    )
  
    
------

## Want to Contribute?

- Created something awesome, made this code better, added some functionality, or whatever (this is the hardest part).
- [Fork it](http://help.github.com/forking/).
- Create new branch to contribute your changes.
- Commit all your changes to your branch.
- Submit a [pull request](http://help.github.com/pull-requests/).

------

## Need Help? 
If you need help then feel free to contact our [Flutter developers](https://www.weblineindia.com/flutter-cross-platform-mobile-app-development.html).

 ------
 
## Collection of Components
 We have built many other components and free resources for software development in various programming languages. Kindly click here to view our [Free Resources for Software Development.](https://www.weblineindia.com/software-development-resources.html)
 
------

## Changelog
Detailed changes for each release are documented in [CHANGELOG](./CHANGELOG).

## License

[MIT](LICENSE)

[mit]: https://github.com/weblineindia/Flutter-Intro-Screens/blob/master/LICENSE

## Keywords
Flutter-Intro-screens, Introduction-screens, App-startup-screen, App-onboarding-screen
