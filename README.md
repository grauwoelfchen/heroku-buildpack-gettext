# Heroku buildpack: GNU gettext

This buildpack compile GNU gettext with gettext-tools from official gettext  
source code.
As second time to build, it checks cache.

Following executable binaries are installed.

```txt
autopoint
envsubst
gettext
gettextize
gettext.sh
msgattrib
msgcat
msgcmp
msgcomm
msgconv
msgen
msgexec
msgfilter
msgfmt
msggrep
msginit
msgmerge
msgunfmt
msguniq
ngettext
recode-sr-latin
xgettext
```

## GNU gettext

Current version is `0.21`.

```zsh
% heroku run gettext --version
Runnig gettext --version on   XXXX...up, run.NNNN (XXXX)
gettext (GNU gettext-runtime) 0.21
Copyright (C) 1995-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Written by Ulrich Drepper.
```


## Note

`LD_LIBRARY_PATH` should be set to search run-time library.  
It is done by [`.profile.d` script](
https://devcenter.heroku.com/articles/buildpack-api#profile-d-scripts).
This will be created by this buildpack.

See `profile/heroku-buildpack-gettext.sh`

```zsh
# without LD_LIBRARY_PATH
% heroku run ldd /app/.heroku/gettext/usr/local/bin/msgfmt
Running ldd /app/.heroku/gettext/usr/local/bin/msgfmt on ⬢ XXXXX... up, run.NNNN (XXXX)
        linux-vdso.so.1 =>  (0x00007ffc6a6b8000)
        libgettextsrc-0.19.8.1.so => not found
        libgettextlib-0.19.8.1.so => not found
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fe31c615000)
        libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fe31c3f7000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fe31c9da000)
```


## Usage

Plesae put `<TAG>` as you need.

```zsh
% cat .buildpacks
https://gitlab.com/grauwoelfchen/heroku-buildpack-gettext#<TAG>
...

% git push heroku release:master
...
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Multipack app detected
remote: =====> Downloading Buildpack: https://gitlab.com/grauwoelfchen/
heroku-buildpack-gettext
remote: =====> Detected Framework: GNU gettext
...
```

## Test

Test run on docker image.  
This uses [heroku-buildpack-testrunner](
    https://github.com/heroku/heroku-buildpack-testrunner).

```zsh
% sh ./test/suite.sh

BUILDPACK: /app/buildpack
  TEST SUITE: compile_test.sh

  Ran 0 tests.

  OK
  0 SECONDS

  TEST SUITE: detect_test.sh
  testExitStatus
  testDetectedName

  Ran 2 tests.

  OK
  0 SECONDS

0 SECONDS

------
ALL OK
0 SECONDS
```


## See also

* [Yasuhiro Asaka / heroku-buildpack-make · GitLab:](
    https://gitlab.com/grauwoelfchen/heroku-buildpack-make)


## Links

* [Buildpack API | Heroku Dev Center](
    https://devcenter.heroku.com/articles/buildpack-api)
* [heroku/heroku-buildpack-testrunner: Unit testing framework for
   Heroku buildpacks.](https://github.com/heroku/heroku-buildpack-testrunner).


## License

See `LICENSE`.

Copyright (c) 2017-2021 Yasuhiro Яша Asaka

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
