import 'package:flutter_modulos/app/shared/models/pokemon.model.dart';
import 'package:flutter_modulos/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeBase(this.repository) {
    fetchPokemons();
  }

  @action
  fetchPokemons() {
    pokemons = this.repository.getAllPokemons().asObservable();
  }
}
