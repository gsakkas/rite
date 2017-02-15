
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
(6,22)-(6,50)
(6,30)-(6,49)
(6,31)-(6,40)
(6,41)-(6,48)
(6,42)-(6,45)
(6,46)-(6,47)
(7,36)-(7,50)
*)

(* type error slice
(2,3)-(7,61)
(2,18)-(7,59)
(6,18)-(6,50)
(6,20)-(6,21)
(6,22)-(6,50)
(6,30)-(6,49)
(6,31)-(6,40)
(6,41)-(6,48)
(6,42)-(6,45)
*)
