
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
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
(7,8)-(10,60)
(7,20)-(7,24)
(8,8)-(10,60)
(8,20)-(8,28)
(8,20)-(8,30)
(8,29)-(8,30)
(9,8)-(10,60)
(9,11)-(9,29)
(9,11)-(9,37)
(9,12)-(9,20)
(9,21)-(9,22)
(9,23)-(9,28)
(9,32)-(9,37)
(10,13)-(10,60)
(10,30)-(10,35)
(10,39)-(10,60)
(11,2)-(11,27)
*)

(* type error slice
(3,2)-(11,27)
(3,18)-(10,60)
(4,4)-(10,60)
(4,4)-(10,60)
(5,12)-(5,16)
(7,8)-(10,60)
(7,8)-(10,60)
(7,20)-(7,24)
(8,8)-(10,60)
(9,8)-(10,60)
(9,8)-(10,60)
(9,8)-(10,60)
(10,13)-(10,60)
(10,13)-(10,60)
(10,25)-(10,35)
(10,25)-(10,35)
(10,30)-(10,35)
(10,39)-(10,45)
(10,39)-(10,60)
(10,46)-(10,60)
(10,47)-(10,52)
(11,2)-(11,10)
(11,2)-(11,27)
(11,11)-(11,27)
(11,12)-(11,18)
*)
