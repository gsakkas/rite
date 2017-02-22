(*F*)
type ('a, 'b) t = A of 'a | B of 'b * 'b

let a1 = A 100

let b = B ("asd", true)

let _ = a = b
