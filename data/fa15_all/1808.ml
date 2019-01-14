
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        let rest' = List.rev t in
        if (List.mem h rest') = false
        then let seen' = h :: seen' in helper (seen', rest') in
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
(7,20)-(7,24)
h
VarG

(7,20)-(7,24)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

*)
