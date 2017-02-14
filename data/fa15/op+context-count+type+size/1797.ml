
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map ((sepConcat ";" l) l)) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,24)-(9,27)
(9,28)-(9,29)
(9,32)-(9,61)
(9,32)-(9,69)
(9,43)-(9,61)
(9,64)-(9,65)
(9,66)-(9,69)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(9,32)-(9,40)
(9,32)-(9,61)
(9,32)-(9,69)
(9,43)-(9,52)
(9,43)-(9,58)
(9,43)-(9,61)
(9,64)-(9,65)
*)
