
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        if List.mem h l
        then h :: seen'
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;
