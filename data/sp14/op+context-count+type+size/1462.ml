
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,46)
(7,41)-(7,44)
*)

(* type error slice
(2,3)-(7,75)
(2,18)-(7,73)
(2,22)-(7,73)
(3,2)-(7,73)
(4,10)-(4,12)
(7,23)-(7,73)
(7,31)-(7,40)
(7,31)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,72)-(7,73)
*)
