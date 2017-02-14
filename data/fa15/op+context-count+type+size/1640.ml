
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
(7,9)-(9,48)
(7,21)-(7,25)
(8,10)-(8,60)
(8,10)-(9,48)
(8,14)-(8,22)
(8,14)-(8,35)
(8,14)-(8,44)
(8,23)-(8,24)
(8,25)-(8,33)
(8,34)-(8,35)
(8,39)-(8,44)
(8,55)-(8,60)
(9,11)-(9,48)
(9,23)-(9,24)
(10,3)-(10,26)
*)

(* type error slice
(8,14)-(8,22)
(8,14)-(8,35)
*)
