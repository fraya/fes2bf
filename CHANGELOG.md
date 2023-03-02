# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2020-04-06

- Mayor redesign. Each instruction is a class. Each instruction linked
  with the next and optimizes itself with the next instruction.

## [0.0.6] - 2019-10-27

### Added

- `Token` enumeration replaces `Instruction` enumeration.
- `Token#.lexemeDef` maps a lexeme (`Int`) with a `Token`

### Removed

- `Instruction`
- Debug information about line and column number


