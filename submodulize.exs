#!/usr/bin/env elixir

defmodule Submodulize do
  def filter_repos(dir) do
    File.ls!(dir) |>
    Enum.filter(fn f -> File.exists?(Path.join([dir, f, ".git"])) end) |>
    Enum.map(fn f -> Path.join(dir, f) end)
  end

  def get_origin(path) do
    File.cd!(path, fn -> String.rstrip(System.cmd("git config remote.origin.url")) end)
  end

  def create_submodule(old_path) do
    IO.puts "Getting origin for #{old_path}"
    origin = get_origin old_path
    IO.puts "Removing #{old_path}"
    File.rm_rf! old_path
    IO.puts "Getting submodule for #{old_path}"
    System.cmd "git rm -r #{old_path}"
    IO.puts System.cmd("git submodule add --force #{origin} #{old_path}")
  end

  def start do
    [dir] = System.argv
    lc repo inlist filter_repos dir do
      IO.puts "Submodulizing #{repo}"
      create_submodule repo
    end
  end
end

Submodulize.start
