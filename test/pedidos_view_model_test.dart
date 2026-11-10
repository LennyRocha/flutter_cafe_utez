
import 'package:cafe_utez/datos/memoria_pedido_repository.dart';
import 'package:cafe_utez/presentacion/pedidos_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Registrar un pedido", () async {
    final repo = MemoriaPedidoRepository();
    final vm = PedidosViewModel(repo);

    int avisos = 0;
    vm.addListener(() => avisos++);

    final ok = await vm.registrar("Ana", "Café", "2");

    expect(ok, isTrue);
    expect(vm.error, isNull);
    expect(vm.pedidos, hasLength(1));
    expect(vm.totalPiezas, 2);
    expect((await repo.todos()).single.cliente, 'Ana');
    expect(avisos, greaterThan(0));

    vm.dispose();
  });
}