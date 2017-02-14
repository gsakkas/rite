
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest = t
        else seen' = (h :: (seen' helper (seen', rest'))) in
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
(7,9)-(11,55)
(7,21)-(7,23)
(8,9)-(11,55)
(8,21)-(8,29)
(8,21)-(8,31)
(8,30)-(8,31)
(9,9)-(11,55)
(9,12)-(9,20)
(9,12)-(9,28)
(9,21)-(9,22)
(9,23)-(9,28)
(10,14)-(10,18)
(10,14)-(10,22)
(10,21)-(10,22)
(11,14)-(11,19)
(11,14)-(11,55)
(11,23)-(11,24)
(11,23)-(11,55)
(11,29)-(11,55)
*)

(* type error slice
(3,3)-(12,26)
(3,19)-(11,55)
(4,5)-(11,55)
(4,5)-(11,55)
(5,13)-(5,17)
(7,9)-(11,55)
(7,9)-(11,55)
(7,21)-(7,23)
(8,9)-(11,55)
(9,9)-(11,55)
(10,14)-(10,22)
(11,29)-(11,34)
(11,29)-(11,55)
(12,13)-(12,19)
(12,13)-(12,26)
(12,21)-(12,23)
(12,21)-(12,26)
*)
