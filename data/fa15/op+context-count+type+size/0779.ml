
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map f) ^ ((sepConcat (";" l)) ^ "]"));;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(9,30)-(9,42)
(9,31)-(9,39)
(9,40)-(9,41)
(9,46)-(9,65)
(9,57)-(9,64)
(9,62)-(9,63)
(9,66)-(9,67)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(9,29)-(9,73)
(9,30)-(9,42)
(9,31)-(9,39)
(9,43)-(9,44)
(9,45)-(9,72)
(9,46)-(9,65)
(9,47)-(9,56)
(9,57)-(9,64)
(9,58)-(9,61)
(9,66)-(9,67)
*)
