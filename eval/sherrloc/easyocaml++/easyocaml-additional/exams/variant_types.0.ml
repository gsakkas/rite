(*F*)
type ('a, 'b) t = A of 'a | B of 'b * 'b

let a1 = A 100
let a2 = A true

let _ = a1 = a2
