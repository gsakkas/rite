
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat l (List.map f l);;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "[]" (List.map f l);;

*)

(* changed spans
(9,33)-(9,34)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(9,23)-(9,32)
(9,23)-(9,49)
(9,33)-(9,34)
(9,35)-(9,49)
(9,36)-(9,44)
(9,47)-(9,48)
*)
