
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
(7,30)-(7,32)
(9,45)-(9,61)
(9,46)-(9,60)
(9,55)-(9,60)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(2,22)-(7,59)
(6,6)-(7,59)
(6,12)-(6,31)
(6,14)-(6,31)
(6,22)-(6,31)
(6,27)-(6,28)
(6,29)-(6,30)
(7,22)-(7,59)
(7,30)-(7,32)
(7,36)-(7,50)
(7,36)-(7,59)
(7,51)-(7,52)
(7,58)-(7,59)
(9,30)-(9,62)
(9,31)-(9,40)
(9,45)-(9,61)
(9,45)-(9,61)
(9,46)-(9,54)
(9,46)-(9,60)
*)
