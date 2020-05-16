import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../class/mitral_regurgitation_class.dart';
import '../data/constants.dart';
import 'list_screen.dart';

class MitralRegurgitation extends StatefulWidget {
  @override
  MitralRegurgitationState createState() {
    return MitralRegurgitationState();
  }
}

class MitralRegurgitationState extends State<MitralRegurgitation> {
  var data;
  bool autoValidate = true;
  MR newMr = MR();
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
      GlobalKey<FormFieldState>();

  ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];
  var boolVal = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mitral Regurgitation'),
        ),
        body: MyArWidgetParent(fbKey: _fbKey, newMr: newMr));
  }
}

class MyArWidgetParent extends StatelessWidget {
  const MyArWidgetParent({
    Key key,
    @required GlobalKey<FormBuilderState> fbKey,
    @required this.newMr,
  })  : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;
  final MR newMr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    FormBuilderDateTimePicker(
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      attribute: "date",
                      inputType: InputType.date,
                      format: DateFormat("yyyy-MM-dd"),
                      decoration: InputDecoration(
                          labelText: "Appointment Time",
                          labelStyle: kMultiSelectText),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "symptomatic",

                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Symptomatic",
                          labelStyle: kMultiSelectText),
                      // initialValue: 'Male',
                      //hint: Text('Is patient symptomatic?'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Yes', 'No']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "newOnsetAF",

                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "New onset AF",
                          labelStyle: kMultiSelectText),
                      // initialValue: 'Male',
                      //hint: Text('Is patient symptomatic?'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Yes', 'No']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "pASP",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "PASP (mm Hg)",
                          suffixText: 'mm Hg',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "venaContrata",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mm',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Vena Contrata (mm)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.required(),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "rVol",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mL/Beat',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Regurgitation volume (mL/Beat)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "rf",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "Regurgitation fraction (%)",
                          suffixText: '%',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "ero",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "ERO", labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvef",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: '%',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "LVEF (%)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvedd",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mm',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "LVEDD (mm)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvesd",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "LVESD (mm)",
                          suffixStyle: kFormFieldSuffTextStyle,
                          suffixText: 'mm',
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "lowSurgicalRisk",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Low surgical risk",
                          labelStyle: kMultiSelectText),
                      // initialValue: 'Male',
                      //hint: Text('Surgical risk'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Low', 'High']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Calculate"),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                        newMr.venaContrata = double.parse(
                            _fbKey.currentState.value['venaContrata']);

                        newMr.lowSurgicalRisk =
                            (_fbKey.currentState.value['lowSurgicalRisk'] ==
                                    'Low')
                                ? true
                                : false;
                        if (_fbKey.currentState.value['ero'].isEmpty ||
                            _fbKey.currentState.value['ero'] == '') {
                          newMr.ero = 0;
                        } else {
                          newMr.ero =
                              double.parse(_fbKey.currentState.value['ero']);
                        }

                        if (_fbKey.currentState.value['rVol'].isEmpty ||
                            _fbKey.currentState.value['rVol'] == '') {
                          newMr.rVol = 0;
                        } else {
                          newMr.rVol =
                              double.parse(_fbKey.currentState.value['rVol']);
                        }

                        if (_fbKey.currentState.value['rf'].isEmpty ||
                            _fbKey.currentState.value['rf'] == '') {
                          newMr.rf = 0;
                        } else {
                          newMr.rf =
                              double.parse(_fbKey.currentState.value['rf']);
                        }
                        newMr.lvesd =
                            double.parse(_fbKey.currentState.value['lvesd']);
                        newMr.lvedd =
                            double.parse(_fbKey.currentState.value['lvedd']);
                        newMr.lvef =
                            double.parse(_fbKey.currentState.value['lvef']);
                        newMr.symptomatic =
                            (_fbKey.currentState.value['symptomatic'] == 'Yes')
                                ? true
                                : false;
                        newMr.newOnsetAF =
                            (_fbKey.currentState.value['newOnsetAF'] == 'Yes')
                                ? true
                                : false;
                        newMr.pASP =
                            double.parse(_fbKey.currentState.value['pASP']);

                        print(newMr.managementSuggestion());
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(newMr.managementSuggestion()),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TileApp(
                                      inputList: newMr.converter(),
                                    )));
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Reset"),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  ),
                  MaterialButton(
                    child: Text("Go Back"),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        Navigator.pop(context, newMr.getMRStatue());
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
