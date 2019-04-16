
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem h seen then rest else h :: rest in
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

(8,21)-(8,64)
t
VarG

*)

(* type error slice
(3,3)-(10,28)
(3,19)-(9,30)
(7,9)-(9,30)
(7,21)-(7,22)
(8,24)-(8,32)
(8,24)-(8,39)
(8,33)-(8,34)
(8,35)-(8,39)
(9,9)-(9,15)
(9,9)-(9,30)
(9,16)-(9,30)
(9,17)-(9,22)
*)
