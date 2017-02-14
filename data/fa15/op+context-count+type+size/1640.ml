
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        (if (List.mem h List.rev t) = false then h :: seen';
         (let rest' = t in helper (seen', rest'))) in
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
(7,8)-(9,50)
(7,20)-(7,24)
(8,8)-(9,50)
(8,9)-(8,59)
(8,12)-(8,35)
(8,12)-(8,43)
(8,13)-(8,21)
(8,22)-(8,23)
(8,24)-(8,32)
(8,33)-(8,34)
(8,38)-(8,43)
(8,54)-(8,59)
(9,9)-(9,49)
(9,22)-(9,23)
(10,2)-(10,27)
*)

(* type error slice
(8,12)-(8,35)
(8,13)-(8,21)
*)
