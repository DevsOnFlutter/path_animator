# Path Animator

A flutter package to draw path with animation on canvas.

## Show some :heart: and :star: the repo

## Features

✅ Animated Path Drawing </br>

## Demo

|<img height=500 src="https://i.imgur.com/3wqFiFK.gif"/>|
|---|

## Getting started

Include plugin to your project

```yml
dependencies:
  path_animator: <latest version>
```

Run `pub get` and get packages.

### Build Animated Path

The `build` function creates animated path and returns it.

```dart
final animatedPath = PathAnimator.build(
    path: path,
    animationPercent: controller.value,
);
```

The returned animated path is then used to draw the path on the canvas.

```dart
canvas.drawPath(animatedPath, paint);
```

## Example

Go to example section in pub.dev to see the full example code.

In GitHub, head over to `example/lib/main.dart` to see the full example code.

## Project Created & Maintained By

### Divyanshu Shekhar

<a href="https://twitter.com/dshekhar17"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a> <a href="https://in.linkedin.com/in/divyanshu-shekhar-a8a04a162"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a> <a href="https://instagram.com/dshekhar17"><img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="60"></a>

[![GitHub followers](https://img.shields.io/github/followers/divshekhar.svg?style=social&label=Follow)](https://github.com/divshekhar/)

## Contributions

Contributions are welcomed!

**If you feel that a hook is missing, feel free to open a pull-request.**

For a custom-hook to be merged, you will need to do the following:

* Describe the use-case.

* Open an issue explaining why we need this hook, how to use it, ...
  This is important as a hook will not get merged if the hook doens't appeal to
  a large number of people.

* If your hook is rejected, don't worry! A rejection doesn't mean that it won't
  be merged later in the future if more people shows an interest in it.
  In the mean-time, feel free to publish your hook as a package on [https://pub.dev](https://pub.dev).

* A hook will not be merged unles fully tested, to avoid breaking it inadvertendly in the future.
  
## Stargazers

[![Stargazers repo roster for @DevsOnFlutter/path_animator](https://reporoster.com/stars/dark/DevsOnFlutter/path_animator)](https://github.com/DevsOnFlutter/path_animator/stargazers)

## Forkers

[![Forkers repo roster for @DevsOnFlutter/path_animator](https://reporoster.com/forks/dark/DevsOnFlutter/path_animator)](https://github.com/DevsOnFlutter/path_animator/network/members)

## Copyright & License

Code and documentation Copyright (c) 2021 [DevsOnFlutter](https://github.com/DevsOnFlutter). Code released under the [BSD 3-Clause License](./LICENSE).