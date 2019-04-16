
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if !(List.mem h seen) then h :: seen else seen in
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
(7,24)-(7,42)
List.mem h seen
AppG (fromList [VarG])

(7,48)-(7,57)
seen
VarG

(7,63)-(7,67)
h :: seen
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(7,24)-(7,25)
(7,24)-(7,42)
(7,25)-(7,42)
(7,26)-(7,34)
*)
