
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = if List.mem seen' seen then t else seen' @ seen in
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
(8,33)-(8,38)
(8,49)-(8,50)
(8,56)-(8,61)
(8,56)-(8,68)
(8,62)-(8,63)
(9,9)-(9,29)
*)

(* type error slice
(8,24)-(8,32)
(8,24)-(8,43)
(8,33)-(8,38)
(8,39)-(8,43)
(8,56)-(8,61)
(8,56)-(8,68)
(8,62)-(8,63)
(8,64)-(8,68)
*)
