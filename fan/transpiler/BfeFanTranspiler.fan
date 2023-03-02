const class BfeFanTranspiler : Transpiler
{
  override Backend makeBackend()
  {
    FanBackend()
  }
}
