
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in
        (if 1 = 2 then seen' := (h :: seen);
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
(3,3)-(11,26)
(3,19)-(10,48)
(7,9)-(10,48)
(8,9)-(10,48)
(8,21)-(8,25)
(9,10)-(9,43)
(9,10)-(10,48)
(9,13)-(9,14)
(9,13)-(9,18)
(9,17)-(9,18)
(9,24)-(9,29)
(9,24)-(9,43)
(9,30)-(9,32)
(9,34)-(9,35)
(9,34)-(9,43)
(9,39)-(9,43)
(10,11)-(10,48)
(11,13)-(11,19)
(11,21)-(11,23)
(11,21)-(11,26)
(11,25)-(11,26)
*)

(* type error slice
(8,9)-(10,48)
(8,21)-(8,25)
(9,24)-(9,29)
(9,24)-(9,43)
(9,30)-(9,32)
(9,34)-(9,43)
(9,39)-(9,43)
*)
