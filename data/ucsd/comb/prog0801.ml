
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

let _ =
  removeDuplicates [1; 6; 2; 4; 12; 2; 13; 6; 9] [1; 6; 2; 4; 12; 13; 9];;
