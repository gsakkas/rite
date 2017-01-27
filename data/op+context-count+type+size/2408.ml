
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = sepConcat (sep t) in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,32)-(7,41)
(7,32)-(7,48)
(7,43)-(7,46)
(7,43)-(7,48)
*)

(* type error slice
(2,4)-(7,78)
(2,19)-(7,76)
(2,23)-(7,76)
(3,3)-(7,76)
(3,9)-(3,11)
(4,11)-(4,13)
(6,19)-(6,20)
(6,19)-(6,26)
(6,21)-(6,22)
(6,23)-(6,26)
(7,32)-(7,41)
(7,32)-(7,48)
(7,43)-(7,46)
(7,43)-(7,48)
(7,47)-(7,48)
*)
