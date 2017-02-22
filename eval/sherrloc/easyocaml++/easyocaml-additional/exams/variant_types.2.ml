(*F*)
type ('a, 'b) t = A of 'a | B of 'b * 'b

let x =
  if true then A 0 else B ((),())

let _ = if true then x else A true
