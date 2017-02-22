(*F*)

type 'a t = {
  a : 'a ;
  b : 'a ;
  c : 'a list ;
  d : int ;
}
type s = { e : unit; f : unit }
type u = { g : unit }

let x : int t = { b = 0; c = [0]; d = 0; e = (); f = (); g = (); z = () }
let _ = x.b <- 100
