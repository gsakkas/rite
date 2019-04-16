
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
(12,21)-(12,29)
h :: seen
ConAppG (Just (TupleG (fromList [EmptyG])))

(13,21)-(13,34)
filter t h
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(5,60)
(5,48)-(5,60)
(5,49)-(5,55)
(5,56)-(5,57)
(13,21)-(13,27)
(13,21)-(13,34)
(13,28)-(13,34)
*)
