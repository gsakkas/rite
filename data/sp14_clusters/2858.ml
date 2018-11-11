
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [h] in let rest' = List.mem h l in helper (seen', rest') in
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
(7,27)-(7,76)
if List.mem h seen
then seen
else h :: seen
IteG (AppG [EmptyG,EmptyG]) VarG (ConAppG (Just EmptyG) Nothing)

(7,50)-(7,51)
seen
VarG

(7,55)-(7,76)
seen
VarG

(7,55)-(7,76)
h
VarG

(7,55)-(7,76)
seen
VarG

(7,55)-(7,76)
t
VarG

(7,55)-(7,76)
let rest' = t in
helper (seen' , rest')
LetG NonRec [VarG] (AppG [EmptyG])

(7,55)-(7,76)
h :: seen
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)
