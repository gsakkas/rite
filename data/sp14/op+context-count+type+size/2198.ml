
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat "" l) f;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "" (List.map f l);;

*)

(* changed spans
(9,23)-(9,31)
(9,32)-(9,48)
(9,46)-(9,47)
(9,49)-(9,50)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(9,23)-(9,31)
(9,23)-(9,50)
(9,32)-(9,48)
(9,33)-(9,42)
*)
