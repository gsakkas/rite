
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then
          let seen' = h :: seen in
          let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,9)-(11,68)
(8,12)-(8,20)
(8,12)-(8,24)
(8,21)-(8,22)
(8,23)-(8,24)
(10,11)-(11,68)
(10,23)-(10,24)
(10,23)-(10,32)
(10,28)-(10,32)
(11,11)-(11,68)
(11,31)-(11,68)
*)

(* type error slice
(3,3)-(12,26)
(3,19)-(11,68)
(4,5)-(11,68)
(4,5)-(11,68)
(5,13)-(5,17)
(7,9)-(11,68)
(8,9)-(11,68)
(8,9)-(11,68)
(8,9)-(11,68)
(10,11)-(11,68)
(10,23)-(10,32)
(10,28)-(10,32)
(11,11)-(11,68)
(11,31)-(11,68)
(11,48)-(11,54)
(11,48)-(11,68)
(12,3)-(12,11)
(12,3)-(12,26)
(12,13)-(12,19)
(12,13)-(12,26)
*)
