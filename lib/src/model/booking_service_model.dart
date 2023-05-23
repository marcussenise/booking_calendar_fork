// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class BookingServiceModel {
  final String? key;
  final String carro;
  final String data;
  final String horario;
  DateTime bookingStart;
  DateTime bookingEnd;
  final int serviceDuration;
  final String localRecarga;
  final String? observacao;
  final String? motivoRejeicao;
  final String statusRecarga;
  final String nome;
  final String telefone;
  final double? notaRecarga;
  final String? antesRecargaUrl;
  final String? depoisRecargaUrl;

  BookingServiceModel({
    this.key,
    required this.carro,
    required this.data,
    required this.horario,
    required this.bookingStart,
    required this.bookingEnd,
    required this.serviceDuration,
    required this.localRecarga,
    this.observacao,
    this.motivoRejeicao,
    required this.statusRecarga,
    required this.nome,
    required this.telefone,
    this.notaRecarga,
    this.antesRecargaUrl,
    this.depoisRecargaUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'carro': carro,
      'data': data,
      'horario': horario,
      'bookingStart': bookingStart.millisecondsSinceEpoch,
      'bookingEnd': bookingEnd.millisecondsSinceEpoch,
      'localRecarga': localRecarga,
      'observacao': observacao,
      'motivoRejeicao': motivoRejeicao,
      'statusRecarga': statusRecarga,
      'nome': nome,
      'telefone': telefone,
      'notaRecarga': notaRecarga,
      'antesRecargaUrl': antesRecargaUrl,
      'depoisRecargaUrl': depoisRecargaUrl,
      'serviceDuration': serviceDuration,
    };
  }

  factory BookingServiceModel.fromMap(Map<String, dynamic> map) {
    return BookingServiceModel(
      key: map['key'] != null ? map['key'] as String : null,
      carro: map['carro'] as String,
      data: map['data'] as String,
      horario: map['horario'] as String,
      bookingStart:
          DateTime.fromMillisecondsSinceEpoch(map['bookingStart'] as int),
      bookingEnd: DateTime.fromMillisecondsSinceEpoch(map['bookingEnd'] as int),
      localRecarga: map['localRecarga'] as String,
      observacao:
          map['observacao'] != null ? map['observacao'] as String : null,
      motivoRejeicao: map['motivoRejeicao'] != null
          ? map['motivoRejeicao'] as String
          : null,
      statusRecarga: map['statusRecarga'] as String,
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      notaRecarga:
          map['notaRecarga'] != null ? map['notaRecarga'] as double : null,
      antesRecargaUrl: map['antesRecargaUrl'] != null
          ? map['antesRecargaUrl'] as String
          : null,
      depoisRecargaUrl: map['depoisRecargaUrl'] != null
          ? map['depoisRecargaUrl'] as String
          : null,
      serviceDuration: map['serviceDuration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingServiceModel.fromJson(String source) =>
      BookingServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BookingServiceModel(key: $key, carro: $carro, data: $data, horario: $horario, localRecarga: $localRecarga, observacao: $observacao, motivoRejeicao: $motivoRejeicao, statusRecarga: $statusRecarga, nome: $nome, telefone: $telefone, notaRecarga: $notaRecarga, antesRecargaUrl: $antesRecargaUrl, depoisRecargaUrl: $depoisRecargaUrl, serviceDuration: $serviceDuration, bookingStart: $bookingStart, bookingEnd: $bookingEnd)';
}
