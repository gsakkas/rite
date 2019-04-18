
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map ((sepConcat (f, l)), l);;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(9,24)-(9,56)
match l with
| x :: [] -> "[" ^ (x ^ "]")
CaseG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(6,23)-(6,32)
(6,24)-(6,27)
(6,28)-(6,29)
(9,24)-(9,32)
(9,24)-(9,56)
(9,33)-(9,56)
(9,34)-(9,52)
(9,35)-(9,44)
(9,45)-(9,51)
*)
