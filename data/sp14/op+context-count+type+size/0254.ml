
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x a in
      let base = "" in let l = (^) sep in List.fold_left f base l;;


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
(7,23)-(7,65)
(7,31)-(7,34)
(7,31)-(7,38)
(7,35)-(7,38)
*)

(* type error slice
(7,23)-(7,65)
(7,31)-(7,34)
(7,31)-(7,38)
(7,42)-(7,56)
(7,42)-(7,65)
(7,64)-(7,65)
*)
