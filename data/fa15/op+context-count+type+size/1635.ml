
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else (let seen' = h :: seen' in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,9)-(11,61)
(7,21)-(7,23)
(8,9)-(11,61)
(8,21)-(8,29)
(8,21)-(8,31)
(8,30)-(8,31)
(9,9)-(11,61)
(9,12)-(9,20)
(9,12)-(9,28)
(9,21)-(9,22)
(9,23)-(9,28)
(10,14)-(10,19)
(10,14)-(10,23)
(10,22)-(10,23)
(11,15)-(11,61)
(11,32)-(11,37)
(11,41)-(11,61)
(12,3)-(12,26)
*)

(* type error slice
(3,3)-(12,26)
(3,19)-(11,61)
(4,5)-(11,61)
(5,13)-(5,17)
(9,9)-(11,61)
(9,9)-(11,61)
(10,14)-(10,23)
(11,15)-(11,61)
(11,15)-(11,61)
(11,27)-(11,37)
(11,41)-(11,47)
(11,41)-(11,61)
(11,49)-(11,54)
(11,49)-(11,61)
(12,3)-(12,11)
(12,3)-(12,26)
(12,13)-(12,19)
(12,13)-(12,26)
*)
