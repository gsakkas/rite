
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else append_new h seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else [h] @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(2,19)-(3,74)
(2,23)-(3,74)
(3,2)-(3,74)
(3,8)-(3,11)
(3,25)-(3,28)
(3,45)-(3,49)
(3,45)-(3,74)
(3,53)-(3,74)
(3,54)-(3,64)
(3,65)-(3,69)
(3,70)-(3,73)
(6,2)-(12,27)
(10,8)-(11,46)
(10,54)-(10,64)
(10,65)-(10,66)
(11,8)-(11,46)
(12,2)-(12,27)
*)

(* type error slice
(3,2)-(3,74)
(3,2)-(3,74)
(3,2)-(3,74)
(3,2)-(3,74)
(3,25)-(3,28)
(3,45)-(3,49)
(3,45)-(3,74)
(3,45)-(3,74)
(3,53)-(3,74)
(3,54)-(3,64)
(3,65)-(3,69)
(3,70)-(3,73)
(10,23)-(10,31)
(10,23)-(10,38)
(10,32)-(10,33)
(10,34)-(10,38)
(10,54)-(10,64)
(10,54)-(10,71)
(10,65)-(10,66)
(10,67)-(10,71)
*)
