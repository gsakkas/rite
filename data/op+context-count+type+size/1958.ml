
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,49)
(7,45)-(7,49)
*)

(* type error slice
(2,4)-(9,30)
(2,22)-(9,26)
(3,3)-(9,26)
(3,3)-(9,26)
(3,19)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,5)-(8,46)
(4,11)-(4,15)
(5,13)-(5,17)
(7,9)-(8,46)
(7,9)-(8,46)
(7,21)-(7,49)
(7,21)-(7,49)
(7,21)-(7,49)
(7,21)-(7,49)
(7,24)-(7,32)
(7,24)-(7,39)
(7,24)-(7,39)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,45)-(7,49)
(8,9)-(8,46)
(8,9)-(8,46)
(8,21)-(8,22)
(8,26)-(8,32)
(8,26)-(8,46)
(8,26)-(8,46)
(8,34)-(8,39)
(8,34)-(8,46)
(8,41)-(8,46)
(9,3)-(9,11)
(9,3)-(9,26)
(9,3)-(9,26)
(9,13)-(9,19)
(9,13)-(9,26)
(9,13)-(9,26)
(9,21)-(9,23)
(9,21)-(9,26)
(9,25)-(9,26)
*)
