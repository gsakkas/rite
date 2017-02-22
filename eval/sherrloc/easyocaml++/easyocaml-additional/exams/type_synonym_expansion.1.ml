(*F*)
type 'a t
type s = int t

let unspecified = assert false 

let _ =
  let x : unit t = unspecified in
  let y : s = unspecified in
  x = y
