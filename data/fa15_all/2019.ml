
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,35)
if List.mem h seen
then h :: seen
else seen
IteG (AppG (fromList [EmptyG])) (ConAppG (Just EmptyG) Nothing) VarG

(7,39)-(7,77)
h
VarG

(7,39)-(7,77)
seen
VarG

(7,39)-(7,77)
seen
VarG

(7,39)-(7,77)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
