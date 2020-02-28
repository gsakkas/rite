
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem l seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
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
(7,33)-(7,34)
h
VarG

*)

(* type error slice
(4,5)-(8,47)
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,55)-(7,56)
(7,55)-(7,64)
(7,60)-(7,64)
(8,9)-(8,47)
(8,21)-(8,22)
(8,26)-(8,32)
(8,26)-(8,47)
(8,33)-(8,47)
(8,41)-(8,46)
(9,12)-(9,28)
(9,13)-(9,19)
(9,20)-(9,27)
(9,25)-(9,26)
*)
