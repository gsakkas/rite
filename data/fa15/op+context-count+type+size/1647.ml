
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
(8,8)-(9,76)
(8,11)-(8,19)
(8,11)-(8,23)
(8,20)-(8,21)
(8,22)-(8,23)
(9,13)-(9,76)
(9,25)-(9,26)
(9,25)-(9,34)
(9,38)-(9,76)
*)

(* type error slice
(3,2)-(10,27)
(3,18)-(9,76)
(4,4)-(9,76)
(4,4)-(9,76)
(5,12)-(5,16)
(7,8)-(9,76)
(8,8)-(9,76)
(8,8)-(9,76)
(8,8)-(9,76)
(9,13)-(9,76)
(9,25)-(9,34)
(9,30)-(9,34)
(9,38)-(9,76)
(9,55)-(9,61)
(9,55)-(9,76)
(10,2)-(10,10)
(10,2)-(10,27)
(10,11)-(10,27)
(10,12)-(10,18)
*)
