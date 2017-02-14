
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
(9,8)-(10,76)
(9,11)-(9,25)
(9,11)-(9,33)
(9,12)-(9,20)
(9,21)-(9,22)
(9,23)-(9,24)
(9,28)-(9,33)
(10,13)-(10,76)
(10,25)-(10,26)
(10,25)-(10,34)
(10,30)-(10,34)
(10,38)-(10,76)
(11,2)-(11,27)
*)

(* type error slice
(3,2)-(11,27)
(3,18)-(10,76)
(4,4)-(10,76)
(4,4)-(10,76)
(5,12)-(5,16)
(7,8)-(10,76)
(8,8)-(10,76)
(8,20)-(8,29)
(8,25)-(8,29)
(9,8)-(10,76)
(9,8)-(10,76)
(9,8)-(10,76)
(10,13)-(10,76)
(10,13)-(10,76)
(10,25)-(10,34)
(10,38)-(10,76)
(10,55)-(10,61)
(10,55)-(10,76)
(10,62)-(10,76)
(10,63)-(10,68)
(11,2)-(11,10)
(11,2)-(11,27)
(11,11)-(11,27)
(11,12)-(11,18)
*)
