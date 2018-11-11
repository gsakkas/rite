
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h then h in
        let rest' = t in helper (seen', rest') in
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
(7,20)-(7,40)
seen
VarG

(7,23)-(7,33)
List.mem h seen
AppG [VarG,VarG]

(7,39)-(7,40)
seen
VarG

(7,39)-(7,40)
h :: seen
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(8,8)-(8,46)
seen
VarG

*)
