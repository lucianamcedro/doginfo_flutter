import 'package:doginfo/domain/ui/dog_info_icons.dart';
import 'package:doginfo/presenter/bloc/bloc/dogs_bloc.dart';
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
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => dogsBloc,
        child: BlocBuilder<DogsBloc, DogsState>(
          builder: (context, state) {
            if (state is DogsSuccess) {
              return Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 5, crossAxisCount: 2),
                    itemCount: state.dogModel.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 305,
                          width: 170,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    elevation: 2,
                                    borderRadius: BorderRadius.circular(15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                        state.dogModel[index].avatar,
                                        height: 190,
                                        width: 165,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    state.dogModel[index].nome,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    state.dogModel[index].tamanho,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 65,
                                right: -4,
                                child: Material(
                                  elevation: 5,
                                  shape: const CircleBorder(),
                                  clipBehavior: Clip.antiAlias,
                                  child: SizedBox(
                                    height: 40,
                                    child: IconButton(
                                      iconSize: 18,
                                      icon: const Icon(
                                        DogInfo.heart,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
        ),
      ),
    );
  }
}
