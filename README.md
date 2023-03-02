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

. Install fantom following the [instructions](https://fantom.org/download).

. Clone this repository and build the program or download the pod and execute
  it.

## Usage

  fan fes2bf <brainfuck-program>

## Examples

In folder 'res' there are some brainfuck programs. I'm sorry I don't
remember the source of all of them.

There are more examples in `http://esoteric.sange.fi/brainfuck/bf-source/prog/`.

## Optimizations

You can measure the time between a program and the optimized version.

  fan fes2bf --optimize <n>

or

  fan fes2bf -O <n>

where `n` can be

- '0' :: No optimizations
- '1' :: Remove comments
- '2' :: Group instructions (and previous)
- '3' :: Replace `[-]` with `Zero` instruction (and previous).
- '3' :: Precomputed jumps (and previous)

