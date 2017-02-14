
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec fs x = ((fs b), ((f b) = b)) in wwhile (fs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fs x = ((f b), ((f b) = b)) in wwhile (fs, b);;

*)

(* changed spans
(6,21)-(6,75)
(6,38)-(6,40)
*)

(* type error slice
(6,21)-(6,75)
(6,32)-(6,57)
(6,36)-(6,57)
(6,37)-(6,43)
(6,38)-(6,40)
*)
