
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen @ h in
        let rest' = filter (t, h) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        let rest' = filter t h in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(12,20)-(12,24)
(12,20)-(12,28)
(12,25)-(12,26)
(13,8)-(13,58)
(13,20)-(13,33)
(13,27)-(13,33)
*)

(* type error slice
(3,2)-(5,59)
(3,2)-(5,59)
(5,47)-(5,59)
(5,48)-(5,54)
(5,55)-(5,56)
(13,20)-(13,26)
(13,20)-(13,33)
(13,27)-(13,33)
*)
