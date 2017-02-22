(*F*)
type ('a, 'b) t = 'a * 'b
type 'a s = ('a, int) t
type u = float s

let unspecified = assert false 

let _ =
  let x : (unit, int) t  = unspecified in
  let y : u = unspecified in
  x = y
