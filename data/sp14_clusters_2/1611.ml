
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (!List.mem) (h, seen) then seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,60)
seen
VarG

(7,24)-(7,25)
List.mem h seen = false
BopG (AppG (fromList [EmptyG])) LitG

(7,25)-(7,33)
List.mem h seen
AppG (fromList [VarG])

(7,50)-(7,60)
false
LitG

*)
