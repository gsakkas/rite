
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map l) ^ ((sepConcat (";" l)) ^ "]"));;


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
(9,31)-(9,43)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,46)-(9,73)
"]"
LitG

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(9,30)-(9,74)
(9,31)-(9,43)
(9,32)-(9,40)
(9,44)-(9,45)
(9,46)-(9,73)
(9,47)-(9,66)
(9,48)-(9,57)
(9,58)-(9,65)
(9,59)-(9,62)
(9,67)-(9,68)
*)
