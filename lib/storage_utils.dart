import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('app-info');

dynamic getLocalItem(String name, dynamic backup) {
  return storage.getItem(name) ?? backup;
}

dynamic setLocalItem(String name, dynamic value) {
  storage.setItem(name, value);
}

bool existsInStorage(String name) {
  if (storage.getItem(name) != null) {
    return true;
  } 
  return false;
}