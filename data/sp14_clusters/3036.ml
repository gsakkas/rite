
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
(7,31)-(7,34)
fun x -> x ^ sep
LamG (AppG [EmptyG,EmptyG])

(7,31)-(7,34)
x ^ sep
AppG [VarG,VarG]

(7,31)-(7,38)
[fun x -> x ^ sep]
ListG (LamG EmptyG) Nothing

(7,35)-(7,38)
x
VarG

*)
