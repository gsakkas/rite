
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
(8,9)-(9,29)
(8,45)-(8,49)
(8,60)-(8,64)
(9,9)-(9,29)
*)

(* type error slice
(3,3)-(10,26)
(3,19)-(9,29)
(7,9)-(9,29)
(7,21)-(7,22)
(8,24)-(8,32)
(8,24)-(8,39)
(8,33)-(8,34)
(8,35)-(8,39)
(9,9)-(9,15)
(9,9)-(9,29)
(9,17)-(9,22)
(9,17)-(9,29)
*)
