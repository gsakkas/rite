
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
(7,20)-(7,21)
(8,8)-(9,29)
(8,32)-(8,37)
(8,48)-(8,49)
(8,55)-(8,60)
(8,55)-(8,67)
(8,61)-(8,62)
(9,8)-(9,29)
*)

(* type error slice
(8,23)-(8,31)
(8,23)-(8,42)
(8,32)-(8,37)
(8,38)-(8,42)
(8,55)-(8,60)
(8,55)-(8,67)
(8,61)-(8,62)
(8,63)-(8,67)
*)
