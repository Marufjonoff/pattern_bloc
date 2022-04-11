import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/create_post_cubit.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/bloc/list_post_state.dart';
import 'package:pattern_bloc/models/pattern_model.dart';

import '../views/view_of_home.dart';
import 'detail_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  static const String id = "/payment_page";
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<PatternApi> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state) {
          if (state is ListPostError) {
            return viewOfHome(items, true);
          }
          if (state is ListPostLoaded) {
            items = state.posts!;
            return viewOfHome(items, false);
          }
          return viewOfHome(items, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


