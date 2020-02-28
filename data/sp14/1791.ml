
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> 0 | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base =
    match fs with | [] -> (fun x  -> x * 1) | h::t -> f (fun x  -> x * 1) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,36)-(4,37)
fun x -> x * 1
LamG VarPatG (BopG EmptyG EmptyG)

(4,61)-(4,62)
x * 1
BopG VarG LitG

*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(4,14)-(4,65)
(4,36)-(4,37)
(4,48)-(4,49)
(4,48)-(4,65)
(4,50)-(4,63)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
*)
