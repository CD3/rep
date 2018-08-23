# `rep`

A small script to replace tokens in a file with values from other files.

# Description

`rep` is a script that is useful for generating multiple inputs files for simulation. For example, if you want to create 10 different configurations
that only differ by a few parameters, you can create a template configuration file with placeholders for the parameters you want to change,
put the parameter values for each parameter into a file, and use `rep` to generate the input parameters for your simulation.

Example from the `testing/` directory:

```
$ cat config.in.t
\shell{cat testing/config.in.t}
$ cat a.rep
\shell{cat testing/a.rep}
$ cat b.rep
\shell{cat testing/b.rep}
$ ls
\shell{cd testing; rm *auto-gen*; ls}
$ rep config.in.t *.rep
\shell{cd testing; ../rep config.in.t *.rep}
$ ls
\shell{cd testing; ls}
```

The rep script searches for tokens it the template file, which are surrounded with '%' characters, and replaces them with the values
found in a *.rep file of the same name. Each line in the *.rep files is a single configuration. In other words, the first line in all
*.rep files is used to create the first configuration file, the second line is used to create the second configuration file, etc.
