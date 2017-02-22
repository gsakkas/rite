(*S*)
type ('a, 'b) t = A of 'a | B of 'b * 'b

let a1 = A 100
let a2 = A 0

let b = B ("asd", "lkjlkj")

let _ =
  a1 = a2
let _ =
  a1 = b

let _ =
  if true then A 0 else B ((), ())
