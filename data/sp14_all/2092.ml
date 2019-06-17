
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = sl in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ";" [List.map (f l)]) ^ "]");;


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

(9,46)-(9,62)
List.map f l
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(2,23)-(7,60)
(6,7)-(7,60)
(6,13)-(6,32)
(6,15)-(6,32)
(6,23)-(6,32)
(6,28)-(6,29)
(6,30)-(6,31)
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,51)
(7,37)-(7,60)
(7,52)-(7,53)
(7,59)-(7,60)
(9,31)-(9,63)
(9,32)-(9,41)
(9,46)-(9,62)
(9,47)-(9,55)
(9,47)-(9,61)
*)
