
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " ^ x)) in
      let base = [] in let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ (" " ^ x)) in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,17)-(7,19)
""
LitG

*)
