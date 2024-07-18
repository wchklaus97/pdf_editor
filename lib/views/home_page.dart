import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_editor/widgets/hover_btn.dart';
import 'package:pdf_editor/blocs/pdf_editor/pdf_editor_bloc.dart';
import 'package:pdf_editor/blocs/pdf_editor/pdf_editor_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final pdfEditorBloc = PdfEditorBloc();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<PdfEditorBloc, PdfEditorState>(
                  bloc: pdfEditorBloc,
                  builder: (context, state) {
                    return state.map(
                      idle: (_) => HoverBtn(
                        text: "Open",
                        onTap: () async => pdfEditorBloc.add(PdfEditorStart()),
                        iconData: Icons.file_open,
                        paddinBetTextnIcon: 8,
                        fontSize: 20,
                        iconSize: 40,
                        padding: const EdgeInsets.symmetric(
                            vertical: 28.0, horizontal: 44.0),
                      ),
                      loading: (_) => Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Loading",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          LoadingAnimationWidget.dotsTriangle(
                              color: Colors.black, size: 60)
                        ],
                      ),
                      loaded: (_) => Container(),
                      exporting: (_) => Container(),
                      error: (props) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(props.msg,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
