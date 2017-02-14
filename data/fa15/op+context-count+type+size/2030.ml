
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map (sepConcat "; " l) l) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " (List.map f l);;

*)

(* changed spans
(9,23)-(9,26)
(9,27)-(9,28)
(9,29)-(9,68)
(9,30)-(9,61)
(9,40)-(9,58)
(9,62)-(9,63)
(9,64)-(9,67)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(9,30)-(9,61)
(9,31)-(9,39)
(9,40)-(9,58)
(9,41)-(9,50)
*)
