
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in let rest' = List.mem h l in helper (seen', rest') in
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
(7,25)-(7,74)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG) Nothing)

(7,48)-(7,49)
seen
VarG

(7,53)-(7,74)
seen
VarG

(7,53)-(7,74)
h
VarG

(7,53)-(7,74)
seen
VarG

(7,53)-(7,74)
t
VarG

(7,53)-(7,74)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(7,53)-(7,74)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
