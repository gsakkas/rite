
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen
          then helper (seen, t)
          else helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,67)
(7,54)-(7,63)
(9,21)-(9,23)
(9,25)-(9,26)
*)

(* type error slice
(3,3)-(9,26)
(3,19)-(8,62)
(4,5)-(8,62)
(4,11)-(4,15)
(5,13)-(5,17)
(7,9)-(8,62)
(7,21)-(7,67)
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,45)-(7,51)
(7,45)-(7,67)
(7,54)-(7,63)
(7,54)-(7,67)
(7,66)-(7,67)
(8,9)-(8,62)
(8,21)-(8,27)
(8,21)-(8,37)
(8,29)-(8,34)
(8,29)-(8,37)
(8,36)-(8,37)
(8,42)-(8,48)
(8,42)-(8,62)
(8,50)-(8,55)
(8,50)-(8,62)
(8,57)-(8,62)
(9,3)-(9,11)
(9,3)-(9,26)
(9,13)-(9,19)
(9,13)-(9,26)
(9,21)-(9,23)
(9,21)-(9,26)
(9,25)-(9,26)
*)
