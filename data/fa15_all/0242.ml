
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h else h @ t in
        let rest' = t in helper (seen', rest') in
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
(7,48)-(7,49)
seen
VarG

(7,48)-(7,49)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(7,50)-(7,51)
seen
VarG

(7,52)-(7,53)
seen
VarG

*)
