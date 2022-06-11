import 'package:flutter/material.dart';


const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreeSize = 360;
// const int customScreenSize = 1100;




class ResponsiveWidget extends StatelessWidget {
  // final Widget customScreen;

  const ResponsiveWidget({ Key? key, required this.largeScreen,  required this.smallScreen,required this.mediumScreen, }) : super(key: key);
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

static bool isSmallScreen(BuildContext context) =>
  MediaQuery.of(context).size.width < mediumScreenSize;
  
static bool isMediumScreen(BuildContext context) =>
  MediaQuery.of(context).size.width >= mediumScreenSize &&
  MediaQuery.of(context).size.width <largeScreenSize;
  
static bool isLargeScreen(BuildContext context) =>
  MediaQuery.of(context).size.width >=largeScreenSize;
  
static bool isCustomScreen(BuildContext context) =>
  MediaQuery.of(context).size.width >= mediumScreenSize /*&&
  MediaQuery.of(context).size.width <= customScreenSize*/;
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        if (width >= largeScreenSize) {
          return largeScreen;
        }else if(width < largeScreenSize && width >= mediumScreenSize){
          return mediumScreen ?? largeScreen;
        }else{
          
          return  smallScreen ?? largeScreen;
        }
    } );
  }
}
