
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else rest' = (t helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,11)-(9,19)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(11,21)-(11,46)
seen
VarG

(11,22)-(11,23)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(11,24)-(11,30)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

*)
