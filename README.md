# ShopBeer

Este proyecto está desarrollador en Flutter con el lenguaje de programación Dart.

## Requisitos

- Instalar y configurar Flutter en el computador. [Link Flutter](https://flutter.dev/docs/get-started/install)
- Instalar y configurar Android Studio. [Link Android Studio](https://developer.android.com/studio)

> Versión de Flutter 2.10.1


### Generar Build APK
```sh
# Generar un Build APK
flutter build apk

# Generar un AppBundle
flutter build appbundle
```

### Generar Build iOS
```sh
# Generar un Build .plist
flutter run --release
```

> NOTA: En este caso tiene que estar el dispositivo conectado al Mac para poder instalar la aplicación.

# Compilación

## Producción (Manual)
Abrir una `terminal` en la raíz del proyecto y ejecutar los siguientes comandos para limpiar e instalar dependencias:

```sh
flutter clean
flutter pub get
```

Para generar la serialización `JSON` de Modelos, se debe ejecutar el siguiente comando:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

NOTA: Este comando debe ejecutarse cuando:
* Se hace `git pull`
* Se editan los Modelos del proyecto

En caso de no ejecutar este comando, la compilación del proyecto va a generar un error porque no encuentra los archivos `*g.dart`. Los IDEs de desarrollo, también marcarán error al no tener las clases creadas.

# Arquitectura App ShopApp