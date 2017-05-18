
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem (h, seen)
        then helper (seen', t)
        else (let seen' = [] @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;
