
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
(7,20)-(7,70)
(7,23)-(7,41)
(7,32)-(7,41)
(7,55)-(7,66)
(8,8)-(8,62)
(9,20)-(9,22)
(9,24)-(9,25)
*)

(* type error slice
(3,2)-(9,27)
(3,18)-(8,62)
(4,4)-(8,62)
(5,12)-(5,16)
(7,8)-(8,62)
(7,20)-(7,70)
(7,20)-(7,70)
(7,20)-(7,70)
(7,20)-(7,70)
(7,23)-(7,31)
(7,23)-(7,41)
(7,47)-(7,53)
(7,47)-(7,70)
(7,54)-(7,70)
(7,55)-(7,66)
(7,55)-(7,66)
(7,61)-(7,65)
(8,20)-(8,26)
(8,20)-(8,37)
(8,27)-(8,37)
(8,28)-(8,33)
(8,41)-(8,47)
(8,41)-(8,62)
(8,48)-(8,62)
(8,49)-(8,54)
(9,2)-(9,10)
(9,2)-(9,27)
(9,11)-(9,27)
(9,12)-(9,18)
*)
