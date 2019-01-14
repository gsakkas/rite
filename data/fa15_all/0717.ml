
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem (seen', seen) then t else seen' @ seen in
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
(8,23)-(8,45)
List.mem h seen
AppG (fromList [VarG])

(8,33)-(8,38)
h
VarG

(9,8)-(9,29)
h
VarG

(9,8)-(9,29)
seen
VarG

(9,8)-(9,29)
t
VarG

(9,8)-(9,29)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(9,8)-(9,29)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
