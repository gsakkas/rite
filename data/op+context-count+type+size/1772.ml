
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
(7,21)-(7,22)
(8,23)-(8,24)
(9,19)-(9,24)
*)

(* type error slice
(3,3)-(11,26)
(3,19)-(10,52)
(4,5)-(10,52)
(4,11)-(4,15)
(5,13)-(5,17)
(7,9)-(10,52)
(7,21)-(7,22)
(8,9)-(10,52)
(8,12)-(8,20)
(8,12)-(8,24)
(8,21)-(8,22)
(8,23)-(8,24)
(9,14)-(9,15)
(9,14)-(9,24)
(9,19)-(9,24)
(10,15)-(10,52)
(10,27)-(10,28)
(10,32)-(10,38)
(10,32)-(10,52)
(10,40)-(10,45)
(10,40)-(10,52)
(10,47)-(10,52)
*)
