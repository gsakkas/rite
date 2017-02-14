
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,9)-(8,46)
(7,21)-(7,64)
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,37)
(7,38)-(7,39)
(7,60)-(7,64)
(8,9)-(8,46)
*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,37)
(7,38)-(7,39)
(7,45)-(7,46)
(7,45)-(7,54)
(7,45)-(7,54)
(7,50)-(7,54)
*)
