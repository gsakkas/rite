
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
(7,24)-(7,34)
List.mem h seen
AppG (fromList [VarG])

(7,40)-(7,41)
h :: seen
AppG (fromList [VarG])

(7,41)-(7,41)
seen
VarG

*)

(* type error slice
(7,9)-(8,47)
(7,21)-(7,41)
(7,24)-(7,32)
(7,24)-(7,34)
(7,41)-(7,41)
(8,26)-(8,32)
(8,26)-(8,47)
(8,33)-(8,47)
(8,34)-(8,39)
(9,12)-(9,28)
(9,13)-(9,19)
(9,20)-(9,27)
(9,21)-(9,23)
*)
