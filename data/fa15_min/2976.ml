
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> x | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;

*)

(* changed spans
(6,40)-(6,41)
""
LitG

*)

(* type error slice
(6,19)-(6,72)
(6,25)-(6,26)
(6,40)-(6,41)
(6,57)-(6,72)
(6,59)-(6,60)
*)
