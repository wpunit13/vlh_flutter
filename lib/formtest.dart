import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
      GlobalKey<FormFieldState>();

  ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderDateTimePicker(
                        attribute: "date1",
                        inputType: InputType.date,
                        format: DateFormat("yyyy-MM-dd"),
                        decoration:
                            InputDecoration(labelText: "Appointment Time"),
                      ),
                      FormBuilderSlider(
                        attribute: "slider",
                        validators: [FormBuilderValidators.min(6)],
                        min: 0.0,
                        max: 10.0,
                        onSaved: (value) {
                          print(value);
                        },
                        initialValue: 1.0,
                        divisions: 20,
                        decoration:
                            InputDecoration(labelText: "Number of things"),
                      ),
                      FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                            "I have read and agree to the terms and conditions"),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                            errorText:
                                "You must accept terms and conditions to continue",
                          ),
                        ],
                      ),
                      FormBuilderDropdown(
                        attribute: "gender",
                        decoration: InputDecoration(labelText: "Gender"),
                        // initialValue: 'Male',
                        hint: Text('Select Gender'),
                        validators: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                      FormBuilderTextField(
                        attribute: "age",
                        decoration: InputDecoration(labelText: "Age"),
                        validators: [
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderSegmentedControl(
                        decoration:
                            InputDecoration(labelText: "Movie Rating (Archer)"),
                        attribute: "movie_rating",
                        options: List.generate(5, (i) => i + 1)
                            .map((number) =>
                                FormBuilderFieldOption(value: number))
                            .toList(),
                      ),
                      FormBuilderSwitch(
                        label: Text('I Accept the tems and conditions'),
                        attribute: "accept_terms_switch",
                        initialValue: true,
                      ),
                      FormBuilderTouchSpin(
                        decoration: InputDecoration(labelText: "Stepper"),
                        attribute: "stepper",
                        initialValue: 10,
                        step: 1,
                      ),
                      FormBuilderRate(
                        decoration:
                            InputDecoration(labelText: "Rate this form"),
                        attribute: "rate",
                        iconSize: 32.0,
                        initialValue: 1,
                        max: 5,
                      ),
                      FormBuilderCheckboxList(
                        decoration: InputDecoration(
                            labelText: "The language of my people"),
                        attribute: "languages",
                        initialValue: ["Dart"],
                        options: [
                          FormBuilderFieldOption(value: "Dart"),
                          FormBuilderFieldOption(value: "Kotlin"),
                          FormBuilderFieldOption(value: "Java"),
                          FormBuilderFieldOption(value: "Swift"),
                          FormBuilderFieldOption(value: "Objective-C"),
                        ],
                      ),
                      FormBuilderChoiceChip(
                        attribute: "favorite_ice_cream",
                        options: [
                          FormBuilderFieldOption(
                              child: Text("Vanilla"), value: "vanilla"),
                          FormBuilderFieldOption(
                              child: Text("Chocolate"), value: "chocolate"),
                          FormBuilderFieldOption(
                              child: Text("Strawberry"), value: "strawberry"),
                          FormBuilderFieldOption(
                              child: Text("Peach"), value: "peach"),
                        ],
                      ),
                      FormBuilderFilterChip(
                        attribute: "pets",
                        options: [
                          FormBuilderFieldOption(
                              child: Text("Cats"), value: "cats"),
                          FormBuilderFieldOption(
                              child: Text("Dogs"), value: "dogs"),
                          FormBuilderFieldOption(
                              child: Text("Rodents"), value: "rodents"),
                          FormBuilderFieldOption(
                              child: Text("Birds"), value: "birds"),
                        ],
                      ),
                      FormBuilderSignaturePad(
                        decoration: InputDecoration(labelText: "Signature"),
                        attribute: "signature",
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Text("Submit"),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
