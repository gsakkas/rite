
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

*)

(* changed spans
(8,36)-(8,60)
append (listReverse t) [h]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(8,43)-(8,54)
listReverse t
AppG [VarG]

*)
