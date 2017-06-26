
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,16)-(8,26)
(8,60)-(8,69)
*)

(* type error slice
(8,10)-(8,69)
(8,16)-(8,24)
(8,16)-(8,26)
*)

(* all spans
(2,21)-(10,27)
(3,2)-(10,27)
(3,18)-(9,46)
(4,4)-(9,46)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(9,46)
(8,10)-(8,69)
(8,16)-(8,26)
(8,16)-(8,24)
(8,25)-(8,26)
(8,43)-(8,47)
(8,60)-(8,69)
(8,60)-(8,61)
(8,65)-(8,69)
(9,8)-(9,46)
(9,20)-(9,21)
(9,25)-(9,46)
(9,25)-(9,31)
(9,32)-(9,46)
(9,33)-(9,38)
(9,40)-(9,45)
(10,2)-(10,27)
(10,2)-(10,10)
(10,11)-(10,27)
(10,12)-(10,18)
(10,19)-(10,26)
(10,20)-(10,22)
(10,24)-(10,25)
*)
