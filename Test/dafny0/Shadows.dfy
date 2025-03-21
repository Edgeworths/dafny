// RUN: %testDafnyForEachResolver --expect-exit-code=2 "%s" -- --warn-shadowing


module Module0 {
  class C<alpha> {
    method M<beta, beta>(x: beta)  // error: duplicate type parameter
    method P<alpha>(x: alpha)  // shadowed type parameter
    ghost function F<beta, beta>(x: beta): int  // error: duplicate type parameter
    ghost function G<alpha>(x: alpha): int  // shadowed type parameter

    method Q0(x: int) returns (x: int)  // error: duplicate variable name
  }
}
module Module1 {
  class D {
    method Q1(x: int) returns (y: int)
    {
      var x;  // shadowed
      var y;  // error: duplicate
    }

    var f: int
    method R()
    {
      var f;  // okay
      var f;  // error: duplicate
    }
    method S()
    {
      var x;
      {
        var x;  // shadow
      }
    }
    method T()
    {
      var x;
      ghost var b := forall x :: x < 10;  // shadow
      ghost var c := forall y :: forall y :: y != y + 1;  // shadow
    }
  }
}
