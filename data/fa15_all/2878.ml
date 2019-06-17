
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
(6,19)-(6,32)
match a with
| "" -> x
| _ -> a ^ (sep ^ x)
CaseG VarG [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG [EmptyG,EmptyG])]

(7,18)-(7,43)
""
LitG

(8,15)-(8,16)
sl
VarG

*)

(* type error slice
(3,3)-(8,43)
(6,7)-(8,43)
(6,13)-(6,32)
(6,15)-(6,32)
(6,23)-(6,32)
(6,28)-(6,29)
(6,30)-(6,31)
(7,18)-(7,43)
(7,24)-(7,25)
(8,7)-(8,43)
(8,15)-(8,16)
(8,20)-(8,34)
(8,20)-(8,43)
(8,35)-(8,36)
(8,42)-(8,43)
*)
