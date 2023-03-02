#! /usr/bin/env fan

using build

class Build : build::BuildPod
{
  new make()
  {
    podName = "fes2bf"
    summary = "Brainfuck language interpreter programmed in Fantom" 
    version = Version("1.0")

    meta = [
      "proj.name": "Brainfuck",
      "proj.uri": "https://github.com/fraya/fes2bf",
      "license.name": "GPL-3",
      "repo.public": "true",
      "repo.tags": "interpreter, brainfuck, compiler, transpiler",
      "vcs.name": "Git",
      "vcs.uri": "https://github.com/fraya/fes2bf"
    ]
    
    depends = [
      "sys 1.0",
      "util 1.0+"
    ]
    
    srcDirs = [
      `fan/`,
      `fan/compiler/`,
      `fan/core/`,
      `fan/interpreter/`,
      `fan/instruction/`,
      `fan/instruction/io/`,
      `fan/instruction/jump/`,
      `fan/instruction/tape/`,
      `fan/instruction/other/`,
      `fan/optimization/`,
      `fan/program/`,
      `fan/transpiler/`,
      `test/`
    ]
    
  }
}
