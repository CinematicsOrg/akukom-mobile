import 'dart:io';
import 'dart:math';

import 'package:akukom/cores/constants/__constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  static const String routeName = '/camera';

  const CameraScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _cameras;
  int _selectedCameraIdx = 0;
  XFile? _imageFile;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS && kDebugMode) {
      _usePlaceholderImage();
    } else {
      _initCamera();
    }
  }

  void _usePlaceholderImage() {
    List<String> placeholderImages = [
      AppImages.logo,
      AppImages.logo
    ]; // Replace with your asset images
    Random random = Random();
    String randomImage =
        placeholderImages[random.nextInt(placeholderImages.length)];
    setState(() {
      _imageFile = XFile(randomImage);
    });
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _controller = CameraController(
          _cameras![_selectedCameraIdx],
          ResolutionPreset.medium,
        );
        _initializeControllerFuture = _controller?.initialize();
      } else {
        setState(() {
          _errorMessage = 'No cameras available';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error initializing camera: ${e.toString()}';
      });
    }
  }

  void _onSwitchCamera() {
    if (_cameras == null || _cameras!.length <= 1) {
      return;
    }

    _selectedCameraIdx = _selectedCameraIdx == 0 ? 1 : 0;
    _controller?.dispose();
    _initCamera();
  }

  Future<void> _takePicture() async {
    if (_initializeControllerFuture == null) return;

    try {
      await _initializeControllerFuture;
      final image = await _controller?.takePicture();
      setState(() {
        _imageFile = image;
      });
    } catch (e) {
      // Handle errors
    }
  }

  void _onAcceptPicture() {
    if (_imageFile != null) {
      Navigator.pop(context, _imageFile);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _errorMessage == null
          ? (_imageFile == null ? _buildCameraWidget() : _buildImagePreview())
          : _buildErrorWidget(),
    );
  }

  Widget _buildCameraWidget() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _controller != null) {
          return Column(
            children: [
              Expanded(child: CameraPreview(_controller!)),
              FloatingActionButton(
                onPressed: _takePicture,
                child: const Icon(Icons.camera),
              ),
              if (_cameras != null && _cameras!.length > 1)
                FloatingActionButton(
                  onPressed: _onSwitchCamera,
                  child: const Icon(Icons.switch_camera),
                )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildImagePreview() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.file(File(_imageFile!.path))),
          FloatingActionButton(
            onPressed: _onAcceptPicture,
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Text(
        _errorMessage ?? 'Unknown error',
        style: const TextStyle(color: Colors.red, fontSize: kfsLarge),
        textAlign: TextAlign.center,
      ),
    );
  }
}
