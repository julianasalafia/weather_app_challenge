import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';

class InformacoesTempoResult with InformacoesTempoHelper {
  final List<Estado> estados;

  const InformacoesTempoResult._({required this.estados});

  factory InformacoesTempoResult.fromJson(dynamic json) {
    return InformacoesTempoResult._(
      estados: Estado.fromListJson(json['result']['estados']),
    );
  }
}

class Estado {
  final String estado;
  final Map<DiasSemanaEnum, Dia> dias;

  const Estado._({
    required this.estado,
    required this.dias,
  });

  factory Estado.fromJson(dynamic json) {
    final dias = json['dias'][0];
    Map<DiasSemanaEnum, Dia> mapDia = {};

    for (final dia in DiasSemanaEnum.values) {
      mapDia[dia] = Dia.fromJson(dias[dia.name][0]);
    }

    return Estado._(
      estado: json['estado'],
      dias: mapDia,
    );
  }

  Dia? getToday() {
    final today = DateTime.now().weekday;
    final dia = dias[DiasSemanaEnum.values[today - 1]];

    return dia;
  }

  static List<Estado> fromListJson(dynamic list) {
    final List<Estado> result = [];

    for (var o in list) {
      result.add(Estado.fromJson(o));
    }
    return result;
  }
}

enum DiasSemanaEnum {
  segunda(id: 0),
  terca(id: 1),
  quarta(id: 2),
  quinta(id: 3),
  sexta(id: 4),
  sabado(id: 5),
  domingo(id: 6);

  final int id;

  const DiasSemanaEnum({required this.id});
}

enum PeriodosEnum {
  manha(id: 0),
  tarde(id: 1),
  noite(id: 2);

  final int id;

  const PeriodosEnum({required this.id});
}

class Dia {
  final Map<PeriodosEnum, Periodo> periodos;

  const Dia._({
    required this.periodos,
  });

  factory Dia.fromJson(dynamic json) {
    final Map<PeriodosEnum, Periodo> periodos = {};
    for (final periodo in PeriodosEnum.values) {
      periodos[periodo] = Periodo.fromJson(json[periodo.name][0]);
    }

    final result = Dia._(
      periodos: periodos,
    );
    return result;
  }

  Periodo? getPeriodoNow() {
    final hourNow = DateTime.now().hour;

    if (hourNow >= 6 && hourNow <= 12) {
      final periodo = periodos[PeriodosEnum.manha];
      return periodo;
    } else if (hourNow >= 13 && hourNow <= 18) {
      final periodo = periodos[PeriodosEnum.tarde];
      return periodo;
    } else {
      final periodo = periodos[PeriodosEnum.noite];
      return periodo;
    }
  }

  static List<Dia> fromListJson(dynamic list) {
    final List<Dia> result = [];

    for (var o in list) {
      result.add(Dia.fromJson(o));
    }
    return result;
  }
}

class Periodo {
  final String tempo;
  final String graus;

  const Periodo._({
    required this.tempo,
    required this.graus,
  });

  factory Periodo.fromJson(dynamic json) {
    return Periodo._(
      tempo: json['tempo'],
      // tratar nulo aqui
      graus: json['graus']?.toString() ?? '0',
    );
  }

  static List<Periodo> fromListJson(dynamic list) {
    final List<Periodo> result = [];

    for (var o in list) {
      result.add(Periodo.fromJson(o));
    }
    return result;
  }
}
