
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev helper ([], l);;


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
(9,2)-(9,25)
(9,11)-(9,17)
*)

(* type error slice
(9,2)-(9,10)
(9,2)-(9,25)
*)

(* all spans
(2,21)-(9,25)
(3,2)-(9,25)
(3,18)-(8,46)
(4,4)-(8,46)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,46)
(7,20)-(7,63)
(7,23)-(7,38)
(7,23)-(7,31)
(7,32)-(7,33)
(7,34)-(7,38)
(7,44)-(7,48)
(7,54)-(7,63)
(7,54)-(7,55)
(7,59)-(7,63)
(8,8)-(8,46)
(8,20)-(8,21)
(8,25)-(8,46)
(8,25)-(8,31)
(8,32)-(8,46)
(8,33)-(8,38)
(8,40)-(8,45)
(9,2)-(9,25)
(9,2)-(9,10)
(9,11)-(9,17)
(9,18)-(9,25)
(9,19)-(9,21)
(9,23)-(9,24)
*)
