
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in
        if (List.mem h r) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,9)-(10,76)
(9,13)-(9,21)
(9,13)-(9,25)
(9,13)-(9,34)
(9,22)-(9,23)
(9,24)-(9,25)
(9,29)-(9,34)
(10,14)-(10,76)
(10,26)-(10,27)
(10,26)-(10,35)
(10,31)-(10,35)
(10,39)-(10,76)
(11,3)-(11,26)
*)

(* type error slice
(3,3)-(11,26)
(3,19)-(10,76)
(4,5)-(10,76)
(4,5)-(10,76)
(5,13)-(5,17)
(7,9)-(10,76)
(8,9)-(10,76)
(8,21)-(8,30)
(8,26)-(8,30)
(9,9)-(10,76)
(9,9)-(10,76)
(9,9)-(10,76)
(10,14)-(10,76)
(10,14)-(10,76)
(10,26)-(10,35)
(10,39)-(10,76)
(10,56)-(10,62)
(10,56)-(10,76)
(10,64)-(10,69)
(10,64)-(10,76)
(11,3)-(11,11)
(11,3)-(11,26)
(11,13)-(11,19)
(11,13)-(11,26)
*)
