import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/di/dependency_injection.dart';
import 'package:flutter_bloc_demo/features/demo_module/data/datamodels/employee_data_model.dart';
import 'package:flutter_bloc_demo/features/demo_module/presentation/bloc/demo_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final bloc = dcSl<DemoBloc>();
  List<EmployeeDatamodel> employeeList = [];
  void _incrementCounter() {
    bloc.add(OnClickEvent(count: _counter));
  }

  @override
  void initState() {
    super.initState();
    bloc.add(FetchEmployeesEvent(onofRecords: 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<DemoBloc, DemoState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is OnClickState) {
            _counter = state.count;
          } else if (state is FetchEmployeesState) {
            employeeList = state.employeeList;
          }
        },
        child: BlocBuilder<DemoBloc, DemoState>(
          bloc: bloc,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading:
                              Image.network(employeeList[index].imageUrl ?? ''),
                          title: Text(employeeList[index].firstName ?? ''),
                          subtitle: Text(employeeList[index].firstName ?? ''),
                        ),
                      );
                    },
                    itemCount: employeeList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
