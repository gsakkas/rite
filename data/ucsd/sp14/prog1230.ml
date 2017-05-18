
let rec assoc (d,k,l) =
  match (d, k, l) with
  | [] -> 0
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | h::t ->
             (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;
