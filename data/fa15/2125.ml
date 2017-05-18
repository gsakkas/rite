
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.rev (List.mem h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,31)
(7,23)-(7,46)
(9,2)-(9,8)
*)

(* type error slice
(7,23)-(7,31)
(7,23)-(7,46)
(7,32)-(7,46)
(7,33)-(7,41)
*)

(* all spans
(2,21)-(9,16)
(3,2)-(9,16)
(3,18)-(8,46)
(4,4)-(8,46)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,46)
(7,20)-(7,71)
(7,23)-(7,46)
(7,23)-(7,31)
(7,32)-(7,46)
(7,33)-(7,41)
(7,42)-(7,43)
(7,44)-(7,45)
(7,52)-(7,56)
(7,62)-(7,71)
(7,62)-(7,63)
(7,67)-(7,71)
(8,8)-(8,46)
(8,20)-(8,21)
(8,25)-(8,46)
(8,25)-(8,31)
(8,32)-(8,46)
(8,33)-(8,38)
(8,40)-(8,45)
(9,2)-(9,16)
(9,2)-(9,8)
(9,9)-(9,16)
(9,10)-(9,12)
(9,14)-(9,15)
*)
