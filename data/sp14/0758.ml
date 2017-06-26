
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        if List.mem h l
        then h :: seen'
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        if List.mem h seen'
        then h :: seen
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,21)
(8,22)-(8,23)
(9,18)-(9,23)
*)

(* type error slice
(7,8)-(10,53)
(7,20)-(7,21)
(9,13)-(9,14)
(9,13)-(9,23)
(9,18)-(9,23)
*)

(* all spans
(2,21)-(11,27)
(3,2)-(11,27)
(3,18)-(10,53)
(4,4)-(10,53)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(10,53)
(7,20)-(7,21)
(8,8)-(10,53)
(8,11)-(8,23)
(8,11)-(8,19)
(8,20)-(8,21)
(8,22)-(8,23)
(9,13)-(9,23)
(9,13)-(9,14)
(9,18)-(9,23)
(10,13)-(10,53)
(10,26)-(10,27)
(10,31)-(10,52)
(10,31)-(10,37)
(10,38)-(10,52)
(10,39)-(10,44)
(10,46)-(10,51)
(11,2)-(11,27)
(11,2)-(11,10)
(11,11)-(11,27)
(11,12)-(11,18)
(11,19)-(11,26)
(11,20)-(11,22)
(11,24)-(11,25)
*)
