# @displaykit/responsive_styles

> You don't need to be worried just because you have to support multiple screens 📺 🖥 💻 📱

[<img width="150px" src="https://www.datocms-assets.com/31049/1618983297-powered-by-vercel.svg" />](https://vercel.com/?utm_source=displaykit&utm_campaign=oss)
[![licence mit](https://img.shields.io/badge/licence-MIT-blueviolet.svg)](LICENSE) ![Downloads](https://img.shields.io/npm/dw/@displaykit/responsive_styles?color=orange) ![Current Version](https://img.shields.io/npm/v/@displaykit/responsive_styles?color=success&label=version&cache=1) [![Flutter Package](https://img.shields.io/badge/responsive__stylesheet-fluttter-blue)](https://pub.dev/packages/displaykit_responsive_stylesheet) [![NPM Package](https://img.shields.io/badge/@displaykit/responsive__stylesheet-npm-red)](https://www.npmjs.com/package/@displaykit/responsive_styles)

It's a set of common utility strategies to work with responsive styles with CSS in JS and Flutter

## Summary
- [Dart/Flutter](#dartflutter-🐦)
- [JavaScript/React](#javascriptreact-⚛)
- [Docs](#docs)

## Dart/Flutter 🐦

### How to install?

```sh
flutter pub add responsive_styles
```

### Get started

- [Check this file to see a small example project](./example/with_flutter_sample/lib/flutter_basic/flutter_basic.dart)
- [Go direct to usage in this line](https://github.com/displaykit/responsive_styles/blob/main/example/with_flutter_sample/lib/flutter_basic/flutter_basic.dart#L43)

### Demo

- [Check it out live!](https://responsive-stylesheet-flutter-demo.vercel.app/#/holy-grail-layout)

![CleanShot 2022-07-27 at 16 27 30](https://user-images.githubusercontent.com/13791385/181355905-6729a384-29a9-40b9-ac8d-caada1ded825.gif)

```dart
body: Container(
  color: responsive.value({
    Breakpoints.xs: Colors.red.shade200,
    Breakpoints.sm: Colors.yellow.shade200,
    Breakpoints.md: Colors.green.shade200,
    Breakpoints.lg: Colors.blue.shade200,
    Breakpoints.xl: Colors.purple.shade200,
  }),
)
```

> [Learn more looking at the code example with a small implementation](./example/with_flutter_sample/lib/flutter_basic/flutter_basic.dart#L43)
>
> [Or this one of the gif with the Web "Holy Grail Layout"](./example/with_flutter_sample/lib/holy-grail-layout.dart)

#### Other demos

- [Basic demo](https://responsive-stylesheet-flutter-demo.vercel.app/#/)
  - [Code](./example/with_flutter_sample/lib/flutter_basic/flutter_basic.dart)
- [Holy grail layout](https://responsive-stylesheet-flutter-demo.vercel.app/#/holy-grail-layout)
  - [Code](./example/with_flutter_sample/lib/holy-grail-layout/holy-grail-layout.dart)
- [Chat App](https://responsive-stylesheet-flutter-demo.vercel.app/#/chat-app)
  - [Code](./example/with_flutter_sample/lib/chat-app-screen/chat-app-screen.dart)

## JavaScript/React ⚛

### How to install?

```sh
yarn add @displaykit/responsive_styles
```

### Get started

- [Check this project to see a small example project](./example/with_react_sample)
- [Go direct to usage in this line](https://github.com/displaykit/responsive_styles/blob/main/example/with_react_sample/pages/index.tsx#L9)

### Demo

- [Check it out live!](https://responsive-stylesheet-react-demo.vercel.app/)

## Docs

### What are the default values for the breakpoints?

- `xs: 0` From 0 screen width until 479
- `sm: 480` From 480 screen width until 767
- `md: 768` From 768 screen width until 991
- `lg: 992` From 992 screen width until 1199
- `xl: 1200` From 1200 and beyond

> All values from here came from other libraries and responsive Front End frameworks.

### Can I customize the breakpoints?

**Today, no**. But it's in the have a way to do this but the names `xs`...`xl` will remain part of the library to make it easier to use the abstractions.

### Resources and features

<!-- TODO: Auto-generate this section based on the files -->

| Feature.                                                     | Dart/Flutter | JavaScript/React |
| ---                                                          | ---              | ---          |
| [Responsive](./lib/responsive//responsive.md)                | ✅               | ❌            |
| [breakpoints](./lib/breakpoints/breakpoints.md)              | ✅               | ✅            |
| [GridItem](./lib/grid-item//grid_item.md)                    | ✅               | 🚧            |
| BreakpointsProvider                                          | 🚧               | 🚧            |
| parseStylesheet                                              | 🚧               | ✅            |
| StyleSheet                                                   | 🚧               | ✅            |
| BaseComponent                                                | 🚧               | 🚧            |

> ✅ Ready, 🚧 WIP, ❌ Not in roadmap by now, 🗺️ Inside roadmap

## Other project stuff

### Contributing

Want to contribute to the project? [Check our guide with how and our code guidelines](CONTRIBUTING.md)

### How to report a bug?

Please just open an issue with a link do a small reproduction of the bug and let's discuss it

### License

[MIT License](license) © [Mario Souto](https://mariosouto.com/)
