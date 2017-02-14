
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if (List.mem h rest') = false
        then let seen' = h :: seen' in helper (seen', rest') in
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
(7,9)-(10,60)
(7,21)-(7,23)
(8,9)-(10,60)
(8,21)-(8,29)
(8,21)-(8,31)
(8,30)-(8,31)
(9,9)-(10,60)
(9,13)-(9,21)
(9,13)-(9,29)
(9,13)-(9,38)
(9,22)-(9,23)
(9,24)-(9,29)
(9,33)-(9,38)
(10,14)-(10,60)
(10,31)-(10,36)
(10,40)-(10,60)
(11,3)-(11,26)
*)

(* type error slice
(3,3)-(11,26)
(3,19)-(10,60)
(4,5)-(10,60)
(5,13)-(5,17)
(9,9)-(10,60)
(9,9)-(10,60)
(9,9)-(10,60)
(10,14)-(10,60)
(10,14)-(10,60)
(10,26)-(10,36)
(10,40)-(10,46)
(10,40)-(10,60)
(10,48)-(10,53)
(10,48)-(10,60)
(11,3)-(11,11)
(11,3)-(11,26)
(11,13)-(11,19)
(11,13)-(11,26)
*)
