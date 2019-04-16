
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((funt b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let rec funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,21)-(7,29)
f b
AppG (fromList [VarG])

*)

(* type error slice
(7,3)-(7,63)
(7,16)-(7,43)
(7,20)-(7,43)
(7,21)-(7,29)
(7,22)-(7,26)
*)
