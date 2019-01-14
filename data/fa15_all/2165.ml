
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else [seen; h] in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,52)-(7,56)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(8,8)-(8,46)
seen
VarG

(9,2)-(9,8)
List.rev
VarG

(9,2)-(9,8)
helper ([] , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
