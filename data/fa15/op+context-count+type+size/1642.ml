
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else rest' = (t helper (seen', rest')) in
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
(7,8)-(11,46)
(7,20)-(7,22)
(8,8)-(11,46)
(8,20)-(8,28)
(8,20)-(8,30)
(8,29)-(8,30)
(9,8)-(11,46)
(9,11)-(9,19)
(9,11)-(9,27)
(9,20)-(9,21)
(9,22)-(9,27)
(10,13)-(10,18)
(10,13)-(10,22)
(10,21)-(10,22)
(11,13)-(11,18)
(11,13)-(11,46)
(11,21)-(11,46)
(11,22)-(11,23)
(11,24)-(11,30)
(12,2)-(12,27)
*)

(* type error slice
(3,2)-(12,27)
(3,18)-(11,46)
(4,4)-(11,46)
(4,4)-(11,46)
(5,12)-(5,16)
(7,8)-(11,46)
(8,8)-(11,46)
(8,20)-(8,28)
(8,20)-(8,30)
(8,29)-(8,30)
(9,8)-(11,46)
(10,13)-(10,22)
(11,21)-(11,46)
(11,22)-(11,23)
(12,11)-(12,27)
(12,12)-(12,18)
(12,19)-(12,26)
(12,20)-(12,22)
*)
