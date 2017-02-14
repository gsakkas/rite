
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map f (sepConcat ";" l);;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
(9,32)-(9,33)
(9,34)-(9,51)
(9,49)-(9,50)
*)

(* type error slice
(2,3)-(7,60)
(2,14)-(7,58)
(2,18)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(9,23)-(9,31)
(9,23)-(9,51)
(9,34)-(9,51)
(9,35)-(9,44)
*)
