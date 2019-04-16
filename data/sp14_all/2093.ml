
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";") ^ ([List.map (f l)] ^ "]"));;


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
(7,31)-(7,33)
t
VarG

(9,31)-(9,46)
sepConcat ";" (List.map f l)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,49)-(9,73)
"]"
LitG

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(2,23)-(7,60)
(9,30)-(9,74)
(9,31)-(9,46)
(9,32)-(9,41)
(9,47)-(9,48)
(9,49)-(9,73)
(9,50)-(9,66)
(9,67)-(9,68)
*)
