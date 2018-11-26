
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, t) then h in
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
(7,20)-(7,45)
seen
VarG

(7,23)-(7,38)
List.mem h seen
AppG (fromList [VarG])

(7,36)-(7,37)
seen
VarG

(7,44)-(7,45)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(8,8)-(8,46)
seen
VarG

*)
