
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with
          | true  -> seen @ [h]
          | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen @ [h] | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,16)-(8,34)
(8,25)-(8,34)
*)

(* type error slice
(8,10)-(10,26)
(8,16)-(8,24)
(8,16)-(8,34)
*)

(* all spans
(2,21)-(12,27)
(3,2)-(12,27)
(3,18)-(11,46)
(4,4)-(11,46)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(11,46)
(8,10)-(10,26)
(8,16)-(8,34)
(8,16)-(8,24)
(8,25)-(8,34)
(8,26)-(8,27)
(8,29)-(8,33)
(9,21)-(9,31)
(9,26)-(9,27)
(9,21)-(9,25)
(9,28)-(9,31)
(9,29)-(9,30)
(10,22)-(10,26)
(11,8)-(11,46)
(11,20)-(11,21)
(11,25)-(11,46)
(11,25)-(11,31)
(11,32)-(11,46)
(11,33)-(11,38)
(11,40)-(11,45)
(12,2)-(12,27)
(12,2)-(12,10)
(12,11)-(12,27)
(12,12)-(12,18)
(12,19)-(12,26)
(12,20)-(12,22)
(12,24)-(12,25)
*)
