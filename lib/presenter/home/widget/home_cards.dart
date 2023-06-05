import 'package:doginfo/domain/ui/dog_info_icons.dart';
import 'package:doginfo/presenter/bloc/bloc/dogs_bloc.dart';
import 'package:doginfo/presenter/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeCards extends StatefulWidget {
  const HomeCards({Key? key}) : super(key: key);

  @override
  State<HomeCards> createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  late final DogsBloc dogsBloc;

  @override
  void initState() {
    super.initState();
    dogsBloc = GetIt.I.get<DogsBloc>();
    dogsBloc.add(OnGetDogs());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dogsBloc,
      child: BlocBuilder<DogsBloc, DogsState>(
        builder: (context, state) {
          if (state is DogsSuccess) {
            final dogModelList = state.dogModel;

            return SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: dogModelList.length,
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final dogModel = dogModelList[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(dogModel: dogModel),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  dogModel.avatar,
                                  height: 260,
                                  width: 185,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 10,
                                child: Material(
                                  elevation: 5,
                                  shape: const CircleBorder(),
                                  clipBehavior: Clip.antiAlias,
                                  child: IconButton(
                                    iconSize: 18,
                                    icon: const Icon(
                                      DogInfo.heart,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          dogModel.nome,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
