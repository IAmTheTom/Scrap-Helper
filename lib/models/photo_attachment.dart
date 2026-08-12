part of '../main.dart';

class PhotoAttachment {
  PhotoAttachment({
    required this.id,
    required this.ownerId,
    required this.ownerType,
    this.localPath,
    required this.caption,
    required this.createdAt,
    this.hash,
    this.ocrText,
  });

  final String id;
  final String ownerId;
  final String ownerType;
  String? localPath;
  String caption;
  final DateTime createdAt;
  String? hash;
  String? ocrText;
}
