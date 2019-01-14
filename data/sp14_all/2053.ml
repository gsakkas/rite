
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
(6,25)-(6,26)
b
VarG

*)
