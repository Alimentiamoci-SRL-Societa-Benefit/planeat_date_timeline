import 'package:flutter/material.dart';
import 'package:planeat_date_timeline/planeat_date_timeline.dart';

class VerticalExample extends StatefulWidget {
  const VerticalExample({super.key});

  @override
  State<VerticalExample> createState() => _VerticalExampleState();
}

class _VerticalExampleState extends State<VerticalExample> {
  DateTime _selectedDate = DateTime.now();
  late final EasyInfiniteDateTimelineController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyInfiniteDateTimelineController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            final updatedSelectedDate =
                _selectedDate.subtract(Duration(days: 1));
            setState(() {
              _selectedDate = updatedSelectedDate;
            });
            _controller.animateToDate(updatedSelectedDate);
          },
          child: Icon(Icons.arrow_upward),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 300,
          child: EasyInfiniteDateTimeLine(
            controller: _controller,
            firstDate: DateTime(2024, 1, 1),
            lastDate: DateTime(2026, 1, 1),
            focusDate: _selectedDate,
            showTimelineHeader: false,
            dayProps: EasyDayProps(
              dayStructure: DayStructure.expandedDayStrDayNumMonth,
              landScapeMode: true,
              height: 40,
            ),
            selectionMode: SelectionModeAutoCenter(),
            onDateChange: (selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
              });
            },
            verticalView: true,
            verticalHeight: 300,
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            final updatedSelectedDate = _selectedDate.add(Duration(days: 1));
            setState(() {
              _selectedDate = updatedSelectedDate;
            });
            _controller.animateToDate(updatedSelectedDate);
          },
          child: Icon(Icons.arrow_downward),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
