
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l x = x ^ sep in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in
      let l = [(fun x  -> x ^ sep)] in List.fold_left f base l;;

*)

(* changed spans
(7,23)-(7,67)
(7,29)-(7,40)
*)

(* type error slice
(7,23)-(7,67)
(7,29)-(7,40)
(7,44)-(7,58)
(7,44)-(7,67)
(7,66)-(7,67)
*)
