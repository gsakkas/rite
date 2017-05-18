
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with | [] -> seen | h::t -> if !(List.mem h t) then h :: rest in
  let seen' = t in
  let rest' = rest helper (seen', rest') in List.rev (helper ([], l));;
