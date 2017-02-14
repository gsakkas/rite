
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ (sep :: (sepConcat (sep t))) in
      let base = "" in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = h ^ sep in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(6,24)-(6,48)
(6,32)-(6,41)
(6,32)-(6,48)
(6,43)-(6,46)
(6,43)-(6,48)
(6,47)-(6,48)
*)

(* type error slice
(2,4)-(7,62)
(2,19)-(7,60)
(6,19)-(6,48)
(6,21)-(6,22)
(6,24)-(6,48)
(6,32)-(6,41)
(6,32)-(6,48)
(6,43)-(6,46)
(6,43)-(6,48)
*)
