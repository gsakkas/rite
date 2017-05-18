
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if a = h then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = h :: (filter t h) in helper (seen', rest') in
  List.rev (helper ([], l));;

let _ = removeDuplicates [1; 6; 2; 4; 12; 2; 13; 6; 9];;
