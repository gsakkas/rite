
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
(7,32)-(7,39)
[fun x -> x ^ sep]
ListG [LamG EmptyPatG EmptyG]

*)

(* type error slice
(7,24)-(7,66)
(7,32)-(7,35)
(7,32)-(7,39)
(7,43)-(7,57)
(7,43)-(7,66)
(7,65)-(7,66)
*)
