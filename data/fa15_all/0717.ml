
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem (seen', seen) then t else seen' @ seen in
        helper (seen', rest') in
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
(7,21)-(7,22)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG))

(8,21)-(8,71)
t
VarG

*)

(* type error slice
(4,5)-(9,30)
(7,9)-(9,30)
(7,21)-(7,22)
(8,21)-(8,71)
(8,24)-(8,32)
(8,24)-(8,46)
(8,52)-(8,53)
(8,59)-(8,64)
(8,59)-(8,71)
(8,65)-(8,66)
*)
