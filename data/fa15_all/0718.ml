
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if ((List.mem seen'), seen) then t else seen' @ seen in
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
IteG (AppG [EmptyG,EmptyG]) VarG (AppG [EmptyG,EmptyG])

(8,21)-(8,73)
t
VarG

*)

(* type error slice
(4,5)-(9,30)
(7,9)-(9,30)
(7,21)-(7,22)
(8,21)-(8,73)
(8,24)-(8,48)
(8,54)-(8,55)
(8,61)-(8,66)
(8,61)-(8,73)
(8,67)-(8,68)
*)
