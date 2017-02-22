(*F*)

type 'a t = {
  a : 'a ;
  mutable b : 'a ;
  c : 'a list ;
  d : int ;
}

let x : int t = { a = 0; b = 0; c = [0]; d = 0; x = ()}
