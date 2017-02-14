
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l l = sepConcat "; " (List.map f);;


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
(9,22)-(9,52)
(9,42)-(9,52)
*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(3,3)-(7,59)
(3,9)-(3,11)
(9,26)-(9,35)
(9,26)-(9,52)
(9,42)-(9,50)
(9,42)-(9,52)
*)
