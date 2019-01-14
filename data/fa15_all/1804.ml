
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest = t
        else seen' = (h :: (seen' helper (seen', rest'))) in
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
(11,28)-(11,33)
seen
VarG

(11,34)-(11,40)
t
VarG

(11,34)-(11,40)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

(11,34)-(11,40)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
