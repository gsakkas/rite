
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h t in let rest' = t in helper (seen', rest') in
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
(7,21)-(7,33)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG))

*)

(* type error slice
(7,9)-(7,75)
(7,21)-(7,29)
(7,21)-(7,33)
(7,54)-(7,60)
(7,54)-(7,75)
(7,61)-(7,75)
(7,62)-(7,67)
(8,12)-(8,28)
(8,13)-(8,19)
(8,20)-(8,27)
(8,21)-(8,23)
*)
