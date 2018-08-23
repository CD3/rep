# `rep`

A small script to replace tokens in a file with values from other files.

# Description

`rep` is a script that is useful for generating multiple inputs files for simulation. For example, if you want to create 10 different configurations
that only differ by a few parameters, you can create a template configuration file with placeholders for the parameters you want to change,
put the parameter values for each parameter into a file, and use `rep` to generate the input parameters for your simulation.

Example from the `testing/` directory:

```
$ cat config.in.t
a = %a%
b = %b%
c = %b%
d = %a%%b%

$ cat a.rep
1
2
3

$ cat b.rep
4
5
6

$ ls
a.rep
b.rep
config.in.t

$ rep config.in.t *.rep
patching config.in.t
applying files: a.rep b.rep
should create 3 new files

$ ls
a.rep
b.rep
config.in.t
config.in.t.auto-gen.1
config.in.t.auto-gen.2
config.in.t.auto-gen.3

```

The rep script searches for tokens it the template file, which are surrounded with '%' characters, and replaces them with the values
found in a *.rep file of the same name. Each line in the *.rep files is a single configuration. In other words, the first line in all
*.rep files is used to create the first configuration file, the second line is used to create the second configuration file, etc.
