
let rec assoc (d,k,l) =
  match d k l with
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | hd::tl ->
             (match hd with | (a,b) -> if a = k then b else assoc (d, k, t)));;
