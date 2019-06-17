
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h in
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
(7,35)-(7,36)
seen
VarG

(7,42)-(7,43)
h :: seen
AppG [VarG,VarG]

(7,43)-(7,43)
seen
VarG

*)

(* type error slice
(7,9)-(8,47)
(7,21)-(7,43)
(7,43)-(7,43)
(8,26)-(8,32)
(8,26)-(8,47)
(8,33)-(8,47)
(8,34)-(8,39)
(9,12)-(9,28)
(9,13)-(9,19)
(9,20)-(9,27)
(9,21)-(9,23)
*)
