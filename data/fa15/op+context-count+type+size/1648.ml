
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
(8,8)-(11,68)
(8,11)-(8,19)
(8,11)-(8,23)
(8,20)-(8,21)
(8,22)-(8,23)
(10,10)-(11,68)
(10,22)-(10,23)
(10,22)-(10,31)
(10,27)-(10,31)
(11,10)-(11,68)
(11,30)-(11,68)
*)

(* type error slice
(3,2)-(12,27)
(3,18)-(11,68)
(4,4)-(11,68)
(4,4)-(11,68)
(5,12)-(5,16)
(7,8)-(11,68)
(8,8)-(11,68)
(8,8)-(11,68)
(8,8)-(11,68)
(10,10)-(11,68)
(10,22)-(10,31)
(10,27)-(10,31)
(11,10)-(11,68)
(11,30)-(11,68)
(11,47)-(11,53)
(11,47)-(11,68)
(12,2)-(12,10)
(12,2)-(12,27)
(12,11)-(12,27)
(12,12)-(12,18)
*)
