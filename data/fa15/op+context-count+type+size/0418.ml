
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> ((f t) ^ "]") l));;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> f t) l);;

*)

(* changed spans
(9,37)-(9,75)
(9,58)-(9,71)
(9,59)-(9,64)
(9,65)-(9,66)
(9,67)-(9,70)
*)

(* type error slice
(2,3)-(7,60)
(2,14)-(7,58)
(2,18)-(7,58)
(3,2)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(9,23)-(9,32)
(9,23)-(9,75)
(9,37)-(9,75)
(9,38)-(9,46)
(9,58)-(9,71)
(9,58)-(9,73)
(9,65)-(9,66)
*)
