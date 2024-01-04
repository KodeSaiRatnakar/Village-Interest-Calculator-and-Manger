part of 'providers.dart';

@Riverpod(keepAlive: true)
class BarrowedDataProvider extends _$BarrowedDataProvider {
  Box<BarrowedData>? box;
  @override
  Future<List<BarrowedData>> build() async {
    box = await Hive.openBox<BarrowedData>(barrowedDataBox);
    if (box?.isNotEmpty ?? false) {
      return box!.values.toList();
    }
    return [];
  }

  void addNewData(BarrowedData obj) {
    if (state.hasValue) {
      state = AsyncData([obj, ...state.requireValue]);
    }
    box?.put(obj.id, obj);
  }

  void removeData(BarrowedData obj) {
    if (state.hasValue) {
      state = AsyncData(
        [
          ...state.requireValue..remove(obj),
        ],
      );
      box?.delete(obj.id);
    }
  }

  void modifiyData(BarrowedData obj) {
    if (state.hasValue) {
      final data = state.requireValue;
      for (int i = 0; i < data.length; i++) {
        final itr = data.elementAt(i);
        if (itr.id == obj.id) {
          data[i] = obj;
        }
      }
      box?.put(obj.id, obj);
    }
  }
}
