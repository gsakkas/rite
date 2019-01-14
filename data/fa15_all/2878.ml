
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = match h with | h::[] -> h in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match a with | "" -> x | _ -> a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,31)
a
VarG

(6,18)-(6,31)
x
VarG

(6,18)-(6,31)
match a with
| "" -> x
| _ -> a ^ (sep ^ x)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(7,41)-(7,42)
""
LitG

(8,14)-(8,15)
sl
VarG

*)
