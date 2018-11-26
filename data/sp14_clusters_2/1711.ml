
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem h seen then rest else h :: rest in
        helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,44)-(8,48)
seen
VarG

(8,59)-(8,63)
seen
VarG

(9,8)-(9,29)
t
VarG

(9,8)-(9,29)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
