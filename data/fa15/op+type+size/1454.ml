
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        if (List.mem h List.rev t) = false
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
(7,8)-(9,76)
(7,20)-(7,21)
(7,20)-(7,29)
(7,25)-(7,29)
(8,8)-(9,76)
(8,11)-(8,34)
(8,11)-(8,42)
(8,12)-(8,20)
(8,21)-(8,22)
(8,23)-(8,31)
(8,37)-(8,42)
(9,13)-(9,76)
(9,38)-(9,76)
*)

(* type error slice
(8,11)-(8,34)
(8,12)-(8,20)
*)

(* all spans
(2,21)-(10,27)
(3,2)-(10,27)
(3,18)-(9,76)
(4,4)-(9,76)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(9,76)
(7,20)-(7,29)
(7,20)-(7,21)
(7,25)-(7,29)
(8,8)-(9,76)
(8,11)-(8,42)
(8,11)-(8,34)
(8,12)-(8,20)
(8,21)-(8,22)
(8,23)-(8,31)
(8,32)-(8,33)
(8,37)-(8,42)
(9,13)-(9,76)
(9,25)-(9,34)
(9,25)-(9,26)
(9,30)-(9,34)
(9,38)-(9,76)
(9,50)-(9,51)
(9,55)-(9,76)
(9,55)-(9,61)
(9,62)-(9,76)
(9,63)-(9,68)
(9,70)-(9,75)
(8,8)-(9,76)
(10,2)-(10,27)
(10,2)-(10,10)
(10,11)-(10,27)
(10,12)-(10,18)
(10,19)-(10,26)
(10,20)-(10,22)
(10,24)-(10,25)
*)
