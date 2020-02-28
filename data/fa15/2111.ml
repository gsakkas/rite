
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (f l)) ^ ((sepConcat (";" l)) ^ "]"));;


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
(9,31)-(9,47)
sepConcat ";" (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

(9,50)-(9,77)
"]"
LitG

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(9,30)-(9,78)
(9,31)-(9,47)
(9,32)-(9,40)
(9,48)-(9,49)
(9,50)-(9,77)
(9,51)-(9,70)
(9,52)-(9,61)
(9,62)-(9,69)
(9,63)-(9,66)
(9,71)-(9,72)
*)
