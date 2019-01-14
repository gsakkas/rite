
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem seen h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,35)
if List.mem h seen
then seen
else seen @ [h]
IteG (AppG (fromList [EmptyG])) VarG (AppG (fromList [EmptyG]))

(7,29)-(7,33)
h
VarG

(7,34)-(7,35)
seen
VarG

(7,34)-(7,35)
seen
VarG

(7,34)-(7,35)
(@)
VarG

(7,34)-(7,35)
seen @ [h]
AppG (fromList [VarG,ListG EmptyG Nothing])

(7,34)-(7,35)
[h]
ListG VarG Nothing

*)
