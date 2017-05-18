
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [5] else [6] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

let _ = removeDuplicates [(1, 6, 2, 13, 2, 6, 9)];;
