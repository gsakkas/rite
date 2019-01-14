
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then true else false in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,51)-(7,56)
[] :: seen
ConAppG (Just (TupleG (fromList [VarG,ListG EmptyG Nothing]))) Nothing

(8,8)-(8,69)
seen
VarG

(8,8)-(8,69)
h
VarG

(8,8)-(8,69)
seen
VarG

(8,8)-(8,69)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(8,8)-(8,69)
[]
ListG EmptyG Nothing

(8,29)-(8,44)
t
VarG

*)
