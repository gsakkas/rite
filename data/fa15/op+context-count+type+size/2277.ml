
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = seen @ h in let rest' = t in helper (seen', rest')) in
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
(10,13)-(10,77)
(10,33)-(10,34)
(10,38)-(10,76)
*)

(* type error slice
(7,16)-(7,24)
(7,16)-(7,31)
(7,25)-(7,26)
(7,27)-(7,31)
(10,26)-(10,30)
(10,26)-(10,34)
(10,31)-(10,32)
(10,33)-(10,34)
*)
