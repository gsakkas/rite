
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (";", (List.map (f, l)));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " l;;

*)

(* changed spans
(9,23)-(9,57)
(9,33)-(9,57)
(9,34)-(9,37)
(9,39)-(9,56)
(9,40)-(9,48)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(9,23)-(9,32)
(9,23)-(9,57)
(9,33)-(9,57)
(9,39)-(9,56)
(9,40)-(9,48)
(9,49)-(9,55)
*)
