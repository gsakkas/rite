
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then helper ((h :: seen), t) in
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
(7,21)-(7,70)
(7,24)-(7,41)
(7,34)-(7,41)
(7,57)-(7,66)
(8,9)-(8,62)
(9,21)-(9,23)
(9,25)-(9,26)
*)

(* type error slice
(3,3)-(9,26)
(3,19)-(8,62)
(4,5)-(8,62)
(5,13)-(5,17)
(7,9)-(8,62)
(7,21)-(7,70)
(7,21)-(7,70)
(7,21)-(7,70)
(7,21)-(7,70)
(7,24)-(7,32)
(7,24)-(7,41)
(7,48)-(7,54)
(7,48)-(7,70)
(7,57)-(7,66)
(7,57)-(7,66)
(7,57)-(7,70)
(7,62)-(7,66)
(8,21)-(8,27)
(8,21)-(8,37)
(8,29)-(8,34)
(8,29)-(8,37)
(8,42)-(8,48)
(8,42)-(8,62)
(8,50)-(8,55)
(8,50)-(8,62)
(9,3)-(9,11)
(9,3)-(9,26)
(9,13)-(9,19)
(9,13)-(9,26)
*)
