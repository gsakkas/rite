
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,9)-(8,76)
(7,12)-(7,20)
(7,12)-(7,27)
(7,21)-(7,22)
(7,23)-(7,27)
(8,14)-(8,76)
(8,39)-(8,76)
*)

(* type error slice
(4,5)-(8,76)
(4,5)-(8,76)
(5,13)-(5,17)
(7,9)-(8,76)
(7,9)-(8,76)
(7,9)-(8,76)
(7,12)-(7,20)
(7,12)-(7,27)
(7,23)-(7,27)
(8,14)-(8,76)
(8,39)-(8,76)
(8,56)-(8,62)
(8,56)-(8,76)
(9,3)-(9,11)
(9,3)-(9,26)
(9,13)-(9,19)
(9,13)-(9,26)
*)
