import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_editor/blocs/pdf_editor/pdf_editor_state.dart';

class PdfEditorBloc extends Bloc<PdfEditorEvent, PdfEditorState> {
  PdfEditorBloc() : super(const PdfEditorState.idle()) {
    on<PdfEditorStart>(_onStart);
  }

  Future<void> _emitErrorMsg(Emitter<PdfEditorState> emit, String msg) async {
    emit(PdfEditorState.error(msg: msg));
    await Future.delayed(
        const Duration(seconds: 3), () => emit(const PdfEditorState.idle()));
  }

  Future<void> _onStart(
      PdfEditorStart event, Emitter<PdfEditorState> emit) async {
    emit(const PdfEditorState.loading());
    FilePickerResult? res = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (res != null) {
      final file = res.files.first;
      if (file.extension!.isNotEmpty &&
          file.extension!.toUpperCase() == "PDF") {
        emit(PdfEditorState.loaded(file: file));
      } else {
        await _emitErrorMsg(emit, "Invalid file type");
      }
    } else {
      await _emitErrorMsg(emit, "No file selected");
    }
  }
}
