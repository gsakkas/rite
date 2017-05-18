
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in let rest' = List.mem h l in helper (seen', rest') in
  List.rev (helper ([], l));;
