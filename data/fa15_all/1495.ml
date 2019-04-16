
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem seen h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,36)
if List.mem h seen
then seen
else seen @ [h]
IteG (AppG (fromList [EmptyG])) VarG (AppG (fromList [EmptyG]))

*)

(* type error slice
(7,9)-(7,78)
(7,21)-(7,29)
(7,21)-(7,36)
(7,57)-(7,63)
(7,57)-(7,78)
(7,64)-(7,78)
(7,65)-(7,70)
(8,12)-(8,28)
(8,13)-(8,19)
(8,20)-(8,27)
(8,21)-(8,23)
*)
