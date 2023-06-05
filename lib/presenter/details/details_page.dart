import 'package:doginfo/domain/models/dog_model.dart';
import 'package:doginfo/presenter/bloc/dogs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DetailsPage extends StatefulWidget {
  final DogModel dogModel;

  const DetailsPage({Key? key, required this.dogModel}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late final DogsBloc dogsBloc;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    dogsBloc = GetIt.I.get<DogsBloc>();
    dogsBloc.add(OnGetDogs());
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dogsBloc,
      child: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          if (state is DogsSuccess) {
            final dogModelList = state.dogModel;

            final selectedDog = dogModelList.firstWhere(
              (dog) => dog.id == widget.dogModel.id,
              orElse: () => DogModel(
                id: '',
                nome: '',
                img: '',
                avatar: '',
                descricao: '',
                comportamento: '',
                historia: '',
                pelo: '',
                tamanho: '',
                idade: '',
              ),
            );

            return Scaffold(
              appBar: AppBar(
                title: Text(selectedDog.nome),
              ),
              body: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 1.2,
                        child: Image.network(
                          selectedDog.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 20.0,
                        right: 20.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            selectedDog.nome,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TabBar(
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  child: Text(
                                    'Informações',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Descrição',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Histórias',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                              labelColor: Colors.black,
                            ),
                          ),
                          Flexible(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Raça: ${selectedDog.nome}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      Text(
                                        'Idade: ${selectedDog.idade}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      Text(
                                        'Pelo: ${selectedDog.pelo}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Descrição:',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        selectedDog.descricao,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Histórias:',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        selectedDog.historia,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
