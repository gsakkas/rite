
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h seen in let rest' = t in helper (seen', rest') in
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
(7,21)-(7,36)
if List.mem h seen
then h :: seen
else seen
IteG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(3,3)-(8,28)
(3,19)-(7,78)
(7,9)-(7,78)
(7,21)-(7,29)
(7,21)-(7,36)
(7,32)-(7,36)
(7,57)-(7,63)
(7,57)-(7,78)
(7,64)-(7,78)
(7,65)-(7,70)
(8,12)-(8,28)
(8,13)-(8,19)
(8,20)-(8,27)
(8,21)-(8,23)
*)
