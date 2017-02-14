
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
(11,23)-(11,27)
(11,23)-(11,32)
(11,31)-(11,32)
(11,36)-(11,74)
*)

(* type error slice
(7,16)-(7,24)
(7,16)-(7,31)
(7,25)-(7,26)
(7,27)-(7,31)
(9,13)-(9,19)
(9,13)-(9,29)
(9,20)-(9,29)
(9,21)-(9,25)
(11,10)-(11,75)
(11,23)-(11,27)
(11,23)-(11,32)
(11,23)-(11,32)
(11,23)-(11,32)
(11,31)-(11,32)
(11,53)-(11,59)
(11,53)-(11,74)
(11,60)-(11,74)
(11,61)-(11,66)
*)
