
let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then [[addHelper (t, t')]; (1 + h') + h]
           else [addHelper (t, t'); h' + h]);;
