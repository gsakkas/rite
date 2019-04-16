
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [seen] @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,56)-(7,60)
h
VarG

(7,64)-(7,67)
seen
VarG

(7,67)-(7,67)
seen
VarG

*)

(* type error slice
(3,3)-(9,28)
(3,19)-(8,47)
(7,9)-(8,47)
(7,21)-(7,67)
(7,24)-(7,41)
(7,25)-(7,33)
(7,34)-(7,35)
(7,36)-(7,40)
(7,55)-(7,61)
(7,55)-(7,67)
(7,56)-(7,60)
(7,62)-(7,63)
(7,64)-(7,67)
(7,65)-(7,66)
(7,67)-(7,67)
(8,26)-(8,32)
(8,26)-(8,47)
(8,33)-(8,47)
(8,34)-(8,39)
(9,12)-(9,28)
(9,13)-(9,19)
(9,20)-(9,27)
(9,21)-(9,23)
*)
