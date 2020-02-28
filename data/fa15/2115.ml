
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

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
(9,46)-(9,62)
List.map f l
AppG [VarG,VarG]

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(6,7)-(7,59)
(6,13)-(6,32)
(6,19)-(6,20)
(6,19)-(6,32)
(6,21)-(6,22)
(7,7)-(7,59)
(7,18)-(7,19)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,53)-(7,57)
(9,31)-(9,63)
(9,32)-(9,41)
(9,46)-(9,62)
(9,47)-(9,55)
(9,47)-(9,61)
*)
