
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec funt x = (b, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,3)-(7,62)
(7,22)-(7,26)
(7,22)-(7,28)
*)

(* type error slice
(7,3)-(7,62)
(7,16)-(7,41)
(7,22)-(7,26)
(7,22)-(7,28)
(7,22)-(7,41)
*)
