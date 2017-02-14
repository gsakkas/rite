
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,9)-(9,76)
(8,12)-(8,20)
(8,12)-(8,24)
(8,21)-(8,22)
(8,23)-(8,24)
(9,14)-(9,76)
(9,26)-(9,27)
(9,26)-(9,35)
(9,39)-(9,76)
*)

(* type error slice
(3,3)-(10,26)
(3,19)-(9,76)
(4,5)-(9,76)
(4,5)-(9,76)
(5,13)-(5,17)
(7,9)-(9,76)
(8,9)-(9,76)
(8,9)-(9,76)
(8,9)-(9,76)
(9,14)-(9,76)
(9,26)-(9,35)
(9,31)-(9,35)
(9,39)-(9,76)
(9,56)-(9,62)
(9,56)-(9,76)
(10,3)-(10,11)
(10,3)-(10,26)
(10,13)-(10,19)
(10,13)-(10,26)
*)
