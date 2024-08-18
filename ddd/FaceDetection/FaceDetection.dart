import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../Screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'FaceOutput.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({super.key});

  @override
  _FaceDetectionState createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  dynamic _scanResults;
  late CameraController _camera;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.front;

  final FaceDetector _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
          enableClassification: true,
          enableTracking: true,
          performanceMode: FaceDetectorMode.accurate
          // mode: FaceDetectorMode.accurate,
          ));
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final CameraDescription description =
        await ScannerUtils.getCamera(_direction);
    setState(() {});
    _camera = CameraController(
      description,
      defaultTargetPlatform == TargetPlatform.android
          ? ResolutionPreset.high
          : ResolutionPreset.high,
    );
    await _camera.initialize().catchError((onError) => print(onError));

    _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      ScannerUtils.detect(
        image: image,
        detectInImage: _faceDetector.processImage,
        imageRotation: description.sensorOrientation,
      ).then(
        (dynamic results) {
          setState(() {
            _scanResults = results;
          });
        },
      ).whenComplete(() => _isDetecting = false);
    });
  }

  Widget _buildResults() {
    Text noResultsText = const Text('No Face detected yet!');

    if (_scanResults == null ||
        !_camera.value.isInitialized) {
      return noResultsText;
    }

    CustomPainter painter;
//    final Size imageSize = Size(
//      _camera.value.previewSize.height,
//      _camera.value.previewSize.width,
//    );
    if (_scanResults is! List<Face>) return noResultsText;
    final List<Face> faces = _scanResults;
    for (Face face in faces) {
      double? l = face.leftEyeOpenProbability;
      double? r = face.rightEyeOpenProbability;
      print(l);
      print(r);
      if (l! < 0.5 && r! < 0.5) {
        Future.delayed(const Duration(seconds: 4), () {
          _showDialog(context);
          playSound();
        });
      }
    }
//    painter = FaceDetectorPainter(imageSize, _scanResults,flag);

    return const CustomPaint(
        // painter: painter,
        );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? const Center(
              child: Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                CameraPreview(_camera),
                _buildResults(),
              ],
            ),
    );
  }

  void _toggleCameraDirection() async {
    if (_direction == CameraLensDirection.back) {
      _direction = CameraLensDirection.front;
    } else {
      _direction = CameraLensDirection.back;
    }

    await _camera.stopImageStream();
    await _camera.dispose();

    // setState(() {
    //   _camera = null;
    // });

    _initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'ddd',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontFamily: "Satisfy",
          ),
        ),
        centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _buildImage(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: _toggleCameraDirection,
            child: _direction == CameraLensDirection.front
                ? const Icon(Icons.camera_rear)
                : const Icon(Icons.camera_front),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _camera.dispose().then((_) {
      _faceDetector.close();
    });

    super.dispose();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  void playSound() {
    assetsAudioPlayer.open(
      Audio("assets/alarm.mp3"),
    );
    assetsAudioPlayer.setLoopMode(LoopMode.single);
    print('play sound');
    assetsAudioPlayer.play();
  }

  _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Drowsiness Alert',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: "Satisfy",
              ),
            ),
            backgroundColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('Images/Cover2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AlertDialog(
                    title: const Text(
                      'Alert',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 23,
                          color: Colors.black),
                    ),
                    content: const Text(
                      'Drowsiness Detected',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    actions: <Widget>[
                      Center(
                        child: ElevatedButton(
                          // splashColor: Colors.grey,
                          // elevation: 20.0,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(30.0),
                          // ),
                          // highlightElevation: 20.0,
                          // highlightColor: Colors.white,
                          child: const Text(
                            'Turn OFF',
                            style: TextStyle(
                                fontFamily: "Quando",
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          // color: Colors.blue[600],
                          onPressed: () {
                            dispose();
                            assetsAudioPlayer.stop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Methods(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
