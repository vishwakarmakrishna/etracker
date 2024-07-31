import 'package:flutter/material.dart';

class SizeReporter extends StatefulWidget {
  final Widget child;
  final Widget? title;
  const SizeReporter({super.key, required this.child, this.title});

  @override
  State<SizeReporter> createState() => _SizeReporterState();
}

class _SizeReporterState extends State<SizeReporter> {
  Size? _size;
  bool isShowWindowSize = false;
  void changeWindowSizeView(bool value) {
    if (!mounted) return;
    setState(() {
      isShowWindowSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              value: isShowWindowSize,
              onChanged: changeWindowSizeView,
              title: Text(
                'Window size: ${isShowWindowSize && _size != null ? '${_size?.width.toStringAsFixed(2)} x ${_size?.height.toStringAsFixed(2)}' : 'Toogle to get Size'}',
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (isShowWindowSize) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      final RenderBox? renderBox =
                          context.findRenderObject() as RenderBox?;
                      if (renderBox != null) {
                        final size = renderBox.size;
                        if (size != _size) {
                          setState(() {
                            _size = size;
                          });
                        }
                      }
                    });
                  }

                  return widget.child;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
