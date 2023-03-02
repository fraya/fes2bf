# fes2bf

Brainfuck interpreter/compiler/transpiler using [Fantom](https://fantom.org)
programming language.

It contains an interpreter with different optimizations and a
[transpiler](https://en.wikipedia.org/wiki/Source-to-source_compiler) to
Fantom code.

This little project is an exploration of Object Oriented Programming and
the blog of [Yegor Bugayenko](https://www.yegor256.com/). It emphasizes the
use of _const_ or immutable classes.

## Installation

1. Install fantom following the [instructions](https://fantom.org/download).

2. Clone this [repository](https://github.com/fraya/fes2bf) and build
   the program or download the pod and execute it.

### Build the program

Once Fantom is installed and the repository is cloned, enter in
the project directory and execute:

    fan build.fan

this should build a `fes2bf.pod` and put it in the `lib` directory of
Fantom's distribution.

### Install from the `pod` repository

If Fantom is installed you just only need to download the package from the
[Fantom Pod Repository](http://eggbox.fantomfactory.org/).
Go to [Eggbox/fes2bf](http://eggbox.fantomfactory.org/pods/fes2bf) and follow
the instructions.

## Usage

    fan fes2bf <brainfuck-program>

### Examples

In folder `res` there are some brainfuck programs. I'm sorry I don't
remember the source of all of them.

There are more examples in `http://esoteric.sange.fi/brainfuck/bf-source/prog/`.

For instance:

    fan fes2bf -c res/mandelbrot.b

## Options

The program has the following options:

* `-help`, `-h` Print usage help
* `-debug` `-d` Show debug information
* `-optimize`, `O <Int>` Optimization level (see Optimizations below)
* `-compile`, `-c` Compiles to a fan script and execute it

## Optimizations

You can measure the time between a program and the optimized version.

    fan fes2bf --optimize <n>

or

    fan fes2bf -O <n>

where `n` can be

- `0` No optimizations
- `1` Remove comments
- `2` Group instructions (and previous)
- `3` Replace `[-]` with `Zero` instruction (and previous).
- `4` Precalculate jumps (and previous)

By default optimizations are set to maximum level.
