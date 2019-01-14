
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "none" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match x with | [] -> "none" | hea::tail -> a ^ (sep ^ hea) in
      let base = h in let l = [t] in List.fold_left f base l;;

*)

(* changed spans
(7,30)-(7,31)
[t]
ListG VarG Nothing

*)
