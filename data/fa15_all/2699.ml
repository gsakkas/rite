
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,39)
List.mem h seen = false
BopG (AppG (fromList [EmptyG])) LitG

*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,37)
(7,38)-(7,39)
(7,45)-(7,49)
(7,45)-(7,55)
(7,50)-(7,51)
(7,52)-(7,55)
(7,53)-(7,54)
*)
