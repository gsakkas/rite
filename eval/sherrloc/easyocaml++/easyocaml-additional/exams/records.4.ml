(*F*)

type 'a t = {
  a : 'a ;
  b : 'a ;
  c : 'a list ;
  d : int ;
}

type s = { e : unit }

let x : int t = { b = 0; c = [0]; d = 0; e = (); f = [] }
let () = x.b <- 1
