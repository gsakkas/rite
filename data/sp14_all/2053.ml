
let rec assoc (d,k,l) =
  let rec helper (a,b,c) =
    match c with
    | [] -> a
    | (n,v)::t -> if n = c then v else helper (a, b, t) in
  helper (d, k, l);;


(* fix

let rec assoc (d,k,l) =
  let rec helper (a,b,c) =
    match c with
    | [] -> a
    | (n,v)::t -> if n = b then v else helper (a, b, t) in
  helper (d, k, l);;

*)

(* changed spans
(6,26)-(6,27)
b
VarG

*)

(* type error slice
(4,5)-(6,56)
(4,11)-(4,12)
(6,22)-(6,23)
(6,22)-(6,27)
(6,26)-(6,27)
*)
