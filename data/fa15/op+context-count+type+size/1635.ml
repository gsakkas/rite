
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
(7,8)-(11,62)
(7,20)-(7,22)
(8,8)-(11,62)
(8,20)-(8,28)
(8,20)-(8,30)
(8,29)-(8,30)
(9,8)-(11,62)
(9,11)-(9,19)
(9,11)-(9,27)
(9,20)-(9,21)
(9,22)-(9,27)
(10,13)-(10,18)
(10,13)-(10,22)
(10,21)-(10,22)
(11,13)-(11,62)
(11,31)-(11,36)
(11,40)-(11,61)
(12,2)-(12,27)
*)

(* type error slice
(3,2)-(12,27)
(3,18)-(11,62)
(4,4)-(11,62)
(5,12)-(5,16)
(9,8)-(11,62)
(9,8)-(11,62)
(10,13)-(10,22)
(11,13)-(11,62)
(11,13)-(11,62)
(11,26)-(11,36)
(11,40)-(11,46)
(11,40)-(11,61)
(11,47)-(11,61)
(11,48)-(11,53)
(12,2)-(12,10)
(12,2)-(12,27)
(12,11)-(12,27)
(12,12)-(12,18)
*)
