
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
(7,32)-(7,33)
(7,37)-(7,74)
(7,49)-(7,50)
(8,13)-(8,19)
(8,21)-(8,23)
(8,21)-(8,26)
(8,25)-(8,26)
*)

(* type error slice
(7,9)-(7,74)
(7,21)-(7,29)
(7,21)-(7,33)
(7,54)-(7,60)
(7,54)-(7,74)
(7,62)-(7,67)
(7,62)-(7,74)
(8,13)-(8,19)
(8,13)-(8,26)
(8,21)-(8,23)
(8,21)-(8,26)
*)
