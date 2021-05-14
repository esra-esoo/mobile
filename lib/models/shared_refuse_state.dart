import 'package:huayati/models/company/refuse_state.dart';
import 'package:huayati/models/individual/refuse_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shared_refuse_state.g.dart';

@JsonSerializable(explicitToJson: true)
class SharedRefuseState {
  IndivisualRefuseState? indivisualRefuseState;
  CompanyRefuseState? companyRefuseState;

  SharedRefuseState({
    required this.indivisualRefuseState,
    required this.companyRefuseState,
  });

  SharedRefuseState.initial()
      : indivisualRefuseState = null,
        companyRefuseState = null;

  factory SharedRefuseState.fromJson(Map<String, dynamic> json) =>
      _$SharedRefuseStateFromJson(json);

  Map<String, dynamic> toJson() => _$SharedRefuseStateToJson(this);
}
