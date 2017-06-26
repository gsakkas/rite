
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h t) then seen :: h else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,39)-(7,40)
(7,47)-(7,56)
(7,55)-(7,56)
(8,8)-(8,46)
*)

(* type error slice
(7,20)-(7,66)
(7,47)-(7,51)
(7,47)-(7,56)
(7,62)-(7,66)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,46)
(4,4)-(8,46)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,46)
(7,20)-(7,66)
(7,23)-(7,41)
(7,23)-(7,26)
(7,27)-(7,41)
(7,28)-(7,36)
(7,37)-(7,38)
(7,39)-(7,40)
(7,47)-(7,56)
(7,47)-(7,51)
(7,55)-(7,56)
(7,62)-(7,66)
(8,8)-(8,46)
(8,20)-(8,21)
(8,25)-(8,46)
(8,25)-(8,31)
(8,32)-(8,46)
(8,33)-(8,38)
(8,40)-(8,45)
(9,2)-(9,27)
(9,2)-(9,10)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
(9,24)-(9,25)
*)
