(*S*)
type 'a t = A of 'a | B of 'a t list
let x = A 3
let y = B []
let z = B [A 3]

let rec f = function
  | A n -> n = 0 
  | B [] -> true
  | B (h :: t) -> f h && f (B t)

let g = function
  | A n -> n = 0; assert false
  | x -> x
