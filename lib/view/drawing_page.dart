import 'dart:ui';
import 'package:final_app/view/drawing_canvas/drawing_canvas.dart';
import 'package:final_app/view/drawing_canvas/models/drawing_mode.dart';
import 'package:final_app/view/drawing_canvas/models/sketch.dart';
import 'package:final_app/view/drawing_canvas/widgets/canvas_side_bar.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_hooks/flutter_hooks.dart';


class DrawingPage extends HookWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = useState(Colors.black);
    final strokeSize = useState<double>(10);
    final eraserSize = useState<double>(30);
    final drawingMode = useState(DrawingMode.pencil);
    final filled = useState<bool>(false);
    final polygonSides = useState<int>(3);
    final backgroundImage = useState<Image?>(null);

    final canvasGlobalKey = GlobalKey();

    ValueNotifier<Sketch?> currentSketch = useState(null);
    ValueNotifier<List<Sketch>> allSketches = useState([]);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
      initialValue: 0,
    );
    return Column(
      children: [
        Stack(
          children: [

            Container(
              // color: Colors.lightGrey,
              width: double.maxFinite,
              // height: double.maxFinite,
              // margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.2,top: 10),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.02,horizontal:MediaQuery.of(context).size.height*0.06),
child:
              DrawingCanvas(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.8,
                drawingMode: drawingMode,
                selectedColor: selectedColor,
                strokeSize: strokeSize,
                eraserSize: eraserSize,
                sideBarController: animationController,
                currentSketch: currentSketch,
                allSketches: allSketches,
                canvasGlobalKey: canvasGlobalKey,
                filled: filled,
                polygonSides: polygonSides,
                backgroundImage: backgroundImage,
              ),
            ),),
            Positioned(
              top: 10,
              // left: -5,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animationController),
                child: CanvasSideBar(
                  drawingMode: drawingMode,
                  selectedColor: selectedColor,
                  strokeSize: strokeSize,
                  eraserSize: eraserSize,
                  currentSketch: currentSketch,
                  allSketches: allSketches,
                  canvasGlobalKey: canvasGlobalKey,
                  filled: filled,
                  polygonSides: polygonSides,
                  backgroundImage: backgroundImage,
                ),
              ),
            ),
            _CustomAppBar(animationController: animationController),

            //
          ],
        ),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final AnimationController animationController;

  const _CustomAppBar({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(MediaQuery.sizeOf(context).width*0.25,-MediaQuery.sizeOf(context).height*0.02),
      child: IconButton(
        color: Colors.black,
        onPressed: () {
          if (animationController.value == 0) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
        icon: const Icon(Icons.menu),
      ),
    );
  }
}
