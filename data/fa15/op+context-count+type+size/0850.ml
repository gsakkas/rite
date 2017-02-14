
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
(9,32)-(9,40)
(9,32)-(9,45)
(9,42)-(9,45)
(9,52)-(9,61)
(9,52)-(9,68)
(9,52)-(9,76)
(9,63)-(9,68)
(9,71)-(9,72)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(9,32)-(9,40)
(9,32)-(9,45)
(9,32)-(9,76)
(9,48)-(9,49)
(9,52)-(9,61)
(9,52)-(9,68)
(9,52)-(9,76)
(9,63)-(9,66)
(9,63)-(9,68)
(9,71)-(9,72)
*)
