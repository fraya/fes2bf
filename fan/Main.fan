using util

**
**
class Main : AbstractMain
{
  @Arg
  {
    help = "Source file"
  }
  File? from

  @Opt
  { help = "Show debug information"; aliases = ["d"] }
  Bool debug := false

  @Opt
  {
    help = Str
    <|Optimization level
         where:
            0 - No optimization,
            1 - Remove comments,
            2 - Group instructions (+,-,<,>) and previous,
            3 - Replace [-] for tape.item = 0
            4 - Precalculate jumps and previous
     |>
    aliases = ["O"]
  }
  Int optimize := 4

  @Opt
  {
    help = "Compiles to a fan script"
    aliases = ["c"]
  }
  Bool compile

  override Int run()
  {
    if (debug)
      log.level = LogLevel.debug

    try
    {
      if (!from.exists)
        throw ArgErr("File does not exists '${from}'")

      if (log.isDebug)
        log.debug("Optimizing program ${from}")

      program   := FileProgram(from)
      cc        := DefCompiler().level(optimize)
      optimized := cc.compile(program)

      if (compile)
      {
        tmp := File.createTemp("bf-", ".fan")

        asm := BfeFanTranspiler().compile(optimized)
        out := tmp.out
        asm.writeOn(out)
        out.close

        script := Env.cur.compileScript(tmp)
        script.make->main

        if (!debug)
          tmp.deleteOnExit
      }
      else
      {
        intr := BfInterpreter()
        intr.runProgram(optimized)
      }

      return 0
    }
    catch (ArgErr e)
    {
      log.err("Usage error: ${e.msg}")
      return 1
    }
    catch (Err e)
    {
      log.err("Unexpected error", e)
      return 2
    }
  }
}
