
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat, (f, l));;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(9,24)-(9,52)
match l with
| x :: [] -> "[" ^ (x ^ "]")
CaseG VarG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(9,24)-(9,32)
(9,24)-(9,52)
(9,33)-(9,52)
*)
