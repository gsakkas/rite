
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        if (List.mem h rest') = false then h :: (seen' helper (seen', rest')) in
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
(9,49)-(9,54)
seen
VarG

(9,55)-(9,61)
t
VarG

(9,55)-(9,61)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

(9,55)-(9,61)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)
