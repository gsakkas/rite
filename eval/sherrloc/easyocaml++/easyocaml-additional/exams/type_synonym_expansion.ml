(*S*)

type t = int option
let h (x: t) y = x = y
let h (x: int option) (y: t) = x = y

(*
type ('a, 'b) t
type 'a s = ('a, int) t
type u = (unit, int) t
type v = unit s

let h (x: ('a, int) t) (y: u) =
  x = y
 *)
(*
let i (x : (unit, int) t) (y: v) = x = y
let j (x : u) (y: v) = x = y
 *)

(*
let f (x : v) (y : unit s) =
  x = y

let g (x : ('a, int) t) (y : 'a s) =
  x = y
 *)
