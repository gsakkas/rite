
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
(6,22)-(6,75)
(6,39)-(6,41)
*)

(* type error slice
(6,22)-(6,75)
(6,33)-(6,56)
(6,39)-(6,41)
(6,39)-(6,43)
(6,39)-(6,56)
*)
