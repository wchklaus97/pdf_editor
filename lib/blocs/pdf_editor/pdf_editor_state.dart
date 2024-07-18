import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_editor_state.freezed.dart';

@freezed
class PdfEditorState with _$PdfEditorState {
  const factory PdfEditorState.idle() = Idle;
  const factory PdfEditorState.loading() = Loading;
  const factory PdfEditorState.loaded({required PlatformFile file}) = Loaded;
  const factory PdfEditorState.exporting() = Exporting;
  const factory PdfEditorState.error({required String msg}) = Error;
}

abstract class PdfEditorEvent {}

class PdfEditorStart extends PdfEditorEvent {}

class PdfEditorEdit extends PdfEditorEvent {
  PdfEditorEdit();
}
