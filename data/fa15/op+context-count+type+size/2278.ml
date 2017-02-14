
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen :: h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen @ [h] in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(11,24)-(11,28)
(11,24)-(11,33)
(11,32)-(11,33)
(11,37)-(11,74)
*)

(* type error slice
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,27)
(7,28)-(7,32)
(9,14)-(9,20)
(9,14)-(9,29)
(9,22)-(9,26)
(9,22)-(9,29)
(11,12)-(11,74)
(11,24)-(11,28)
(11,24)-(11,33)
(11,24)-(11,33)
(11,24)-(11,33)
(11,32)-(11,33)
(11,54)-(11,60)
(11,54)-(11,74)
(11,62)-(11,67)
(11,62)-(11,74)
*)
