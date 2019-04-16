
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
(7,30)-(7,41)
[fun x -> x ^ sep]
ListG (fromList [LamG VarPatG EmptyG])

*)

(* type error slice
(7,24)-(7,68)
(7,30)-(7,41)
(7,45)-(7,59)
(7,45)-(7,68)
(7,67)-(7,68)
*)
