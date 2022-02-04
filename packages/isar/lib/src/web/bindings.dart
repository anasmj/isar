import 'dart:typed_data';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS('Promise')
class Promise {}

extension PromiseX on Promise {
  Future<T> wait<T>() => promiseToFuture(this);
}

@JS('openIsar')
external Promise openIsarJs(
    String name, List<dynamic> schemas, bool relaxedDurability);

@JS('IsarTxn')
class IsarTxnJs {
  external Promise commit();

  external void abort();

  external bool get write;
}

@JS('IsarInstance')
class IsarInstanceJs {
  external IsarTxnJs beginTxn(bool write);

  external IsarCollectionJs getCollection(String name);

  external Promise close(bool deleteFromDisk);
}

@JS('IsarCollection')
class IsarCollectionJs {
  external Promise get(IsarTxnJs txn, int id);

  external Promise getAll(IsarTxnJs txn, List<int> ids);

  external Promise getByIndex(
      IsarTxnJs txn, String indexName, List<dynamic> value);

  external Promise getAllByIndex(
      IsarTxnJs txn, String indexName, List<List<dynamic>> values);

  external Promise put(IsarTxnJs txn, dynamic object, bool replaceOnConflict);

  external Promise putAll(IsarTxnJs txn, List objects, bool replaceOnConflict);

  external Promise delete(IsarTxnJs txn, int id);

  external Promise deleteByIndex(IsarTxnJs txn, dynamic key);

  external Promise deleteAll(IsarTxnJs txn, List<int> ids);

  external Promise deleteAllByIndex(IsarTxnJs txn, List<dynamic> keys);

  external Promise clear(IsarTxnJs txn);

  external Promise importJsonRaw(
      IsarTxnJs txn, Uint8List jsonBytes, bool replaceOnConflict);

  external Promise importJson(
      IsarTxnJs txn, Map<String, dynamic> json, bool replaceOnConflict);
}
