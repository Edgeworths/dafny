// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

ghost predicate {:opaque} G(f:int~>bool)
  reads f.reads(0)
  requires f.requires(0)
{
  true
}

ghost predicate A<T>(s:set<T>)

predicate{:opaque} B(s:set<int>)
    requires A(s)
