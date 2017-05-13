
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

let _ = removeDuplicates [1; 6; 2; 4; 12; 2; 13; 6; 9];;
