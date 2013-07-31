# Submodulize

Not a whole lot to talk about here. This is a little Elixir script that takes a
directory as an argument and looks for all git repos in that directory and makes
them submodules instead. I wrote this originally to convert all my vim plugins
in `~/.vim/bundle` that were plain git repos to submodules.

This script is not very intelligent. It does not check if the repos it finds are
submodules already or not. This script can be used when none of the git repos in
the directory are already submodules.

## Usage

This is an Elixir script. It requires that Elixir be installed, which requires
that Erlang also be installed. This may seem like a whole lot of crap to install
for a simple script, but damn it, you should have these things anyways. Elixir
is awesome for scripting. Move over Ruby! :p

Anyways, usage is simple:

```
$ pwd
/Users/raynes/.vim
$ submodulize.exs bundle
...
shit happens
...
```

Enjoy!

## License

Do whatever the fuck you want with this (see LICENSE).
