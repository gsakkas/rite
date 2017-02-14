
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in
        (if 1 = 2 then seen' := (h :: seen');
         (let rest' = t in helper (seen', rest'))) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let assignSeen h r seen = if List.mem h r then seen else h :: seen in
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = assignSeen h r seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(3,2)-(11,27)
(3,18)-(10,50)
(7,8)-(10,50)
(8,8)-(10,50)
(8,20)-(8,24)
(9,8)-(10,50)
(9,9)-(9,44)
(9,12)-(9,13)
(9,12)-(9,17)
(9,16)-(9,17)
(9,23)-(9,28)
(9,23)-(9,44)
(9,29)-(9,31)
(9,32)-(9,44)
(9,33)-(9,34)
(9,38)-(9,43)
(10,9)-(10,49)
(10,22)-(10,23)
(11,12)-(11,18)
(11,19)-(11,26)
(11,20)-(11,22)
(11,24)-(11,25)
*)

(* type error slice
(9,23)-(9,28)
(9,23)-(9,44)
(9,29)-(9,31)
(9,32)-(9,44)
(9,38)-(9,43)
*)
