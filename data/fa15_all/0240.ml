
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h t in let rest' = t in helper (seen', rest') in
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
(7,20)-(7,32)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG) Nothing)

(7,31)-(7,32)
seen
VarG

(7,36)-(7,74)
seen
VarG

(7,36)-(7,74)
h
VarG

(7,36)-(7,74)
seen
VarG

(7,36)-(7,74)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
