
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest = t
        else h :: (seen' helper (seen', rest')) in
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
(7,8)-(11,47)
(7,20)-(7,22)
(8,8)-(11,47)
(8,20)-(8,28)
(8,20)-(8,30)
(8,29)-(8,30)
(9,8)-(11,47)
(9,11)-(9,19)
(9,11)-(9,27)
(9,20)-(9,21)
(9,22)-(9,27)
(10,13)-(10,17)
(10,13)-(10,21)
(10,20)-(10,21)
(11,18)-(11,47)
(11,19)-(11,24)
(11,25)-(11,31)
(12,2)-(12,27)
*)

(* type error slice
(3,2)-(12,27)
(3,18)-(11,47)
(4,4)-(11,47)
(4,4)-(11,47)
(5,12)-(5,16)
(7,8)-(11,47)
(7,8)-(11,47)
(7,20)-(7,22)
(8,8)-(11,47)
(9,8)-(11,47)
(9,8)-(11,47)
(10,13)-(10,21)
(11,13)-(11,47)
(11,18)-(11,47)
(11,19)-(11,24)
(12,11)-(12,27)
(12,12)-(12,18)
(12,19)-(12,26)
(12,20)-(12,22)
*)
