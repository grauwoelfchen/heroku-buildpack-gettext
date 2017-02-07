# Heroku buildpack: GNU gettext


## Usage

```zsh
% cat .buildpacks
https://gitlab.com/grauwoelfchen/heroku-buildpack-gettext#v0.1
...

% git push heroku release:master
...
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Multipack app detected
remote: =====> Downloading Buildpack: https://gitlab.com/grauwoelfchen/heroku-buildpack-gettext
remote: =====> Detected Framework: GNU gettext
...
```


## Links

* [Buildpack API | Heroku Dev Center](https://devcenter.heroku.com/articles/buildpack-api)


## License

See `LICENSE`.

Copyright (c) 2017 Yasuhiro Asaka

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
