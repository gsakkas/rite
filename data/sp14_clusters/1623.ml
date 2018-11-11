
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,52)
seen
VarG

(7,23)-(7,38)
List.mem h seen = false
BopG (AppG [EmptyG,EmptyG]) LitG

(7,44)-(7,45)
[h]
ListG VarG Nothing

(7,44)-(7,52)
false
LitG

*)
