import 'package:bloctest/features/home/bloc/fetchuser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<FetchuserBloc>(context).add(GetUserEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<FetchuserBloc, FetchuserState>(
          builder: (context, state) {
            if (state is GettingUserState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GotUsersState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].title ?? ""),
                    subtitle: Text(state.users[index].userId.toString()),
                  );
                },
              );
            }
            return SizedBox();
          },
        ));
  }
}
