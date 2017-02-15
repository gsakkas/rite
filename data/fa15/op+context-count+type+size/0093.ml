
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
(7,2)-(7,62)
(7,20)-(7,28)
(7,21)-(7,25)
*)

(* type error slice
(7,2)-(7,62)
(7,15)-(7,42)
(7,19)-(7,42)
(7,20)-(7,28)
(7,21)-(7,25)
*)
